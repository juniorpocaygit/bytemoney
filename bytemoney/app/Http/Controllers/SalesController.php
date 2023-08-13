<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

use App\Models\User;
use App\Models\Products;
use App\Models\Sales;
use App\Models\AfiliateProduct;
use App\Models\Category;

class SalesController extends Controller
{
    public function saleProducts($link){

        $afiliate = AfiliateProduct::with('afilprod')->where('link', $link)->first();
        return view('app.sales.sales-product', ['afiliate' => $afiliate]);

    }

    public function sale(Request $request, $link){

        $rules = [
            'name' => ['required', 'string', 'min:3', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ];

        $feedback = [
            'required' => 'O campo :attribute é obrigatório.',
            'name.min' => 'O nome deve ter no mínimo 3 caracteres.',
            'email.unique' => 'E-mail já cadastrado.',
            'password.min' => 'A senha deve ter no mínimo 8 caracteres.',
            'confirmed' => 'A confirmação de senha não coincide.',
        ];

        $afiliate = AfiliateProduct::where('link', $link)->first();

        if(!$afiliate){
            $mensagem = 'Produto não encontrado em nossa base de dados!';
        }

        $request->validate($rules, $feedback);

        $client = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'access_level_id' => 3,
            'password' => Hash::make($request->password),
        ]);
        event(new Registered($client));

        $sale = new Sales();
        $sale->client_id = $client->id;
        $sale->user_id = $afiliate->user_id;
        $sale->product_id = $afiliate->products_id;
        $sale->save();

        $mensagem = 'Olá '.$client->name.', obrigado por realizar sua compra!!!';

        return view('app.sales.thankyou', ['mensagem' => $mensagem]);
    }

    public function allClients(){

        //return all sales
        $salesInfo = DB::table('sales as s')
            ->select('c.name as client_name', 'p.title', 'p.price', 'p.price_afiliate', 's.created_at', 'cat.name as category_name')
            ->join('products as p', 's.product_id', '=', 'p.id')
            ->join('users as u', 's.user_id', '=', 'u.id')
            ->join('users as c', 's.client_id', '=', 'c.id')
            ->join('category as cat', 'p.category_id', '=', 'cat.id')
            ->where('s.user_id', '=', auth()->user()->id)
            ->orderBy('s.created_at')
            ->get();

        return view('app.sales.allClients', ['salesInfo' => $salesInfo]);

    }

  
}
