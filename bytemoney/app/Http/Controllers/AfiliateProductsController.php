<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

use App\Models\Products;
use App\Models\Category;
use App\Models\Afiliate;
use App\Models\AfiliateProduct;
use App\Models\User;

class AfiliateProductsController extends Controller
{
    public function allproducts(){

        $allProducts = Products::all();
        $categories = Category::all();
        return view('app.afiliate.allproducts', ['allProducts' => $allProducts, 'categories' => $categories]);

    }
   
    public function afiliate($id){

        $afiliateLink = md5(strval(date('H:i:s').auth()->user()->id.$id));

        $afiliate = new AfiliateProduct();
        $afiliate->user_id = auth()->user()->id;
        $afiliate->products_id = $id; 
        $afiliate->link = $afiliateLink;
        $afiliate->save();

        $allProducts = Products::all();
        $categories = Category::all();
        return redirect()->route('afiliate.allproducts', ['allProducts' => $allProducts, 'categories' => $categories, 'afiliateLink' => $afiliateLink ]);

    }

    public function myafiliate(){

        $myProducts = User::find(auth()->user()->id)->products;
        $categories = Category::all();
        return view('app.afiliate.myproducts', ['myProducts' => $myProducts, 'categories' => $categories]);
        
    }

    public function desfiliate($id){

        $desfiliate = AfiliateProduct::find($id);
        $desfiliate->delete();

        $allProducts = Products::all();
        $categories = Category::all();
        return redirect()->route('afiliate.allproducts', ['allProducts' => $allProducts, 'categories' => $categories]);

    }

    public function allAfiliates(){

        $userId = auth()->user()->id;
        $afiliateInfo = DB::table('afiliate_products as ap')
            ->select(
                'u.photo',
                'u.name',
                'u.email',
                'u.phone',
                DB::raw('COUNT(*) AS total_products'),
                DB::raw('COUNT(s.product_id) * p.price AS total_sales'),
                DB::raw('COUNT(s.product_id) * p.price_productor AS total_commission')
            )
            ->join('products as p', 'ap.products_id', '=', 'p.id')
            ->join('users as u', 'ap.user_id', '=', 'u.id')
            ->join('sales as s', 'ap.products_id', '=', 's.product_id')
            ->where('p.productor_id', '=', $userId)
            ->groupBy('u.id', 'u.photo', 'u.name', 'u.email', 'u.phone')
            ->orderByDesc('total_sales')
            ->get();   

        return view('app.afiliate.allAfiliates', [ 'afiliateInfo' => $afiliateInfo]);
    }

    public function filterCategory($id){

        $allProducts = Products::where('category_id', $id)->get();
        $categories = Category::all();
        return view('app.afiliate.allproducts', ['allProducts' => $allProducts, 'categories' => $categories]);

    }
}
