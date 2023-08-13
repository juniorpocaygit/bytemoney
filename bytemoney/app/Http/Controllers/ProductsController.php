<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

use App\Models\Category;
use App\Models\User;
use App\Models\Products;
use App\Models\AfiliateProduct;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Products::with('category')->where('productor_id', auth()->user()->id)->orderBy('created_at', 'desc')->get();
        return view('app.products.index', ['products' => $products]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all();
        $products = Products::where('productor_id', auth()->user()->id)->orderBy('created_at', 'desc')->limit(4)->get();
        return view('app.products.create', ['categories' => $categories , 'products' => $products]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //validations
        $regras = [
            'title' => 'required|min:5|max:50',
            'category_id' => 'exists:category,id',
            'price' => 'required',
            'afiliate_rules' => 'required|min:50',
            'description' => 'required|min:50',
            'photo' => ['file', 'image', 'max:5024', 'mimes:jpeg,png,jpg,gif'], // Max size is 1MB, adjust as needed
        ];

        $feedback = [
            'title.required' => 'O campo título deve ser preenchido.',
            'title.min' => 'O campo título deve ter no mínimo 5 caracteres.',
            'title.max' => 'O campo título deve ter no máximo 50 caracteres.',
            'price.required' => 'O campo valor deve ser preenchido.',
            'afiliate_rules.required' => 'O campo regras de afiliação deve ser preenchido.',
            'afiliate_rules.min' => 'O campo regras de afilização deve ter no mínimo 50 caracteres.',
            'description.required' => 'O campo descrição deve ser preenchido.',
            'description.min' => 'O campo descrição deve ter no mínimo 50 caracteres.',
            'photo' => [
                'file' => 'O campo :attribute deve ser um arquivo.',
                'image' => 'O campo :attribute deve ser uma imagem.',
                'max' => 'O tamanho máximo do arquivo de :max kb foi excedido.',
                'mimes' => 'O arquivo de :attribute deve ser um dos tipos: :values.',
            ],   
            'category_id.exists' => 'Selecione uma categoria.',
        ];

        $request->validate($regras, $feedback);

        //Create object product
        $product = new Products();
        $product->productor_id = auth()->user()->id;
        $product->category_id = $request->category_id;
        $product->title = $request->title;
        $product->price = $request->price;
        $product->afiliate_rules = $request->afiliate_rules;
        $product->description = $request->description;

        $product->price_productor = (75/100) * $request->price; 
        $product->price_afiliate = (25/100) * $request->price; 
      
        //treatment for save images
        if ($request->hasFile('photo') && $request->file('photo')->isValid()) {
            $requestImage = $request->photo;
            $extension = $requestImage->extension();
            $imageName = md5($requestImage->getClientOriginalName().strtotime('now')).".".$extension;

            $request->photo->move(public_path('storage/img/products'), $imageName);

            $product->photo = $imageName ;
        }
       
        $product->save();
  
        return redirect()->route('produtos.index')->with('status', 'product-add');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $product = Products::with('afiliates')->find($id);

        //returns the total number of products sold
        $salesProduct = DB::table('sales as s')
            ->join('products as p', 's.product_id', '=', 'p.id')
            ->select(DB::raw('COUNT(*) AS sales_product'))
            ->where('s.product_id', '=', $id)
            ->groupBy('s.product_id')
            ->first();

        return view('app.products.show', ['product' => $product, 'salesProduct' => $salesProduct]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $categories = Category::all();
        $product = Products::find($id);
        $products = Products::where('productor_id', auth()->user()->id)->orderBy('created_at', 'desc')->limit(4)->get();
        return view('app.products.edit', ['categories' => $categories , 'product' => $product, 'products' => $products]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {      
        //validations 
        $regras = [
            'title' => 'required|min:5|max:50',
            'category_id' => 'exists:category,id',
            'price' => 'required',
            'afiliate_rules' => 'required|min:50',
            'description' => 'required|min:50',
            'photo' => ['file', 'image', 'max:5024', 'mimes:jpeg,png,jpg,gif'], // Max size is 1MB, adjust as needed
        ];

        $feedback = [
            'title.required' => 'O campo título deve ser preenchido.',
            'title.min' => 'O campo título deve ter no mínimo 5 caracteres.',
            'title.max' => 'O campo título deve ter no máximo 50 caracteres.',
            'price.required' => 'O campo valor deve ser preenchido.',
            'afiliate_rules.required' => 'O campo regras de afiliação deve ser preenchido.',
            'afiliate_rules.min' => 'O campo regras de afilização deve ter no mínimo 50 caracteres.',
            'description.required' => 'O campo descrição deve ser preenchido.',
            'description.min' => 'O campo descrição deve ter no mínimo 50 caracteres.',
            'photo' => [
                'file' => 'O campo :attribute deve ser um arquivo.',
                'image' => 'O campo :attribute deve ser uma imagem.',
                'max' => 'O tamanho máximo do arquivo de :max kb foi excedido.',
                'mimes' => 'O arquivo de :attribute deve ser um dos tipos: :values.',
            ],            
            'category_id.exists' => 'Selecione uma categoria.',
        ];
        
        $request->validate($regras, $feedback);

        //Create object product
        $product = Products::find($id);
        $product->productor_id = auth()->user()->id;
        $product->category_id = $request->category_id;
        $product->title = $request->title;
        $product->price = $request->price;
        $product->afiliate_rules = $request->afiliate_rules;
        $product->description = $request->description;
        $product->price_productor = (75/100) * $request->price; 
        $product->price_afiliate = (25/100) * $request->price; 
      
        //treatment for update images
        if ($request->hasFile('photo') && $request->file('photo')->isValid()) {

            unlink(public_path('storage/img/products/'.$product->photo));
            $requestImage = $request->photo;
            $extension = $requestImage->extension();
            $imageName = md5($requestImage->getClientOriginalName().strtotime('now')).".".$extension;
            $request->photo->move(public_path('storage/img/products'), $imageName);

            $product->photo = $imageName ;
        }
        
        $product->save();
  
        return redirect()->route('produtos.edit', ['produto' => $id])->with('status', 'product-edited');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product = Products::find($id);
        unlink(public_path('storage/img/products/'.$product->photo));
     
        $product->delete();

        return redirect()->route('produtos.index');
    }
}
