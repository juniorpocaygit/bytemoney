<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

Use App\Models\User;
Use App\Models\Sales;
Use App\Models\Products;
Use App\Models\AccessLevel;


class HomeController extends Controller
{
    public function index(){
        $userId = auth()->user()->id;

        //Return level access for user
        $user = User::with('accessLevel')->find($userId);
        $accessLevel = $user->accessLevel;

        //Verify level access for users is productor
        if ($user->accessLevel->level == 90) {
           
            //Return the user's top 4 best selling products
            $mostSoldProducts = DB::table('sales as s')
                ->select('p.*', DB::raw('COUNT(*) as total_sales'))
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->where('p.productor_id', '=', $userId)
                ->groupBy('product_id')
                ->orderByDesc('total_sales')
                ->limit(4)
                ->get(); 

            //Return the last sales
            $lastSales = DB::table('sales as s')
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->where('p.productor_id', '=', $userId)
                ->orderByDesc('s.created_at')
                ->limit(5)
                ->get(); 
            
            //Returns the ranking of the best afiliates
            $rankingAfiliates = DB::table('sales as s')
                ->select('u.photo', 'u.name', DB::raw('COUNT(s.product_id) * p.price_productor AS total_commission'),
                DB::raw('COUNT(s.product_id) * p.price AS total_sales'))
                ->join('users as u', 's.user_id', '=', 'u.id')
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->where('p.productor_id', '=', $userId )
                ->groupBy('u.id')
                ->orderByDesc('total_sales')
                ->get();
            
            //Returns total sales and total commissions
            $salesCommissions = DB::table('sales as s')
                ->select( DB::raw('COUNT(s.product_id) * p.price_productor AS total_commission'),
                DB::raw('COUNT(s.product_id) * p.price AS total_sales'))
                ->join('users as u', 's.user_id', '=', 'u.id')
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->where('p.productor_id', '=', $userId )
                ->groupBy('p.productor_id')
                ->orderByDesc('total_sales')
                ->first();

                if ($salesCommissions != null) {
                    Session::put('commission', $salesCommissions->total_commission);
                    Session::put('total_sales', $salesCommissions->total_sales);
                } else {                   
                    Session::put('commission', '0.00');
                    Session::put('total_sales', '0.00');
                }

                        
            //Returns the total sales for the last 30 days
            $sales30d = DB::table('sales as s')
                ->select(
                    DB::raw('COUNT(s.product_id) * p.price AS total_sales')
                )
                ->join('users as u', 's.user_id', '=', 'u.id')
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->where('p.productor_id', '=', $userId)
                ->whereBetween('s.created_at', [now()->subDays(30), now()])
                ->groupBy('p.productor_id')
                ->orderByDesc('total_sales')
                ->first();

                if ($sales30d != null) {
                    Session::put('sales30d', $sales30d->total_sales);   
                } else {
                    Session::put('sales30d', '0.00');   
                } 
        

            return view('app.home', [
                'accessLevel' => $accessLevel,
                'mostSoldProducts' => $mostSoldProducts,
                'rankingAfiliates' => $rankingAfiliates,
                'lastSales' => $lastSales,
                
            ]);

        } else {

            //Return the user's top 4 best selling products
            $mostSoldProducts = DB::table('sales as s')
                ->select('p.*', DB::raw('COUNT(*) as total_sales'))
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->where('user_id', '=', $userId)
                ->groupBy('product_id')
                ->orderByDesc('total_sales')
                ->limit(4)
                ->get(); 

            //Return the last sales
            $lastSales = DB::table('sales as s')
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->where('user_id', '=', $userId)
                ->orderByDesc('s.created_at')
                ->limit(5)
                ->get(); 
            
            //Returns the ranking of the best products
            $productRanking = DB::table('sales as s')
                ->select(
                    'p.photo',
                    'p.title',
                    DB::raw('c.name as category'),
                    DB::raw('COUNT(*) AS total_products'),
                    DB::raw('COUNT(s.product_id) * p.price_afiliate AS total_commission'),
                    DB::raw('COUNT(s.product_id) * p.price AS total_sales')
                )
                ->join('users as u', 's.user_id', '=', 'u.id')
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->join('category as c', 'p.category_id', '=', 'c.id')
                ->where('u.id', '=', $userId)
                ->groupBy('s.product_id', 'p.photo', 'p.title', 'c.name')
                ->orderByDesc('total_products')
                ->get();
         
            //Returns total sales and total commissions
            $salesCommissions = DB::table('sales as s')
                ->select( DB::raw('COUNT(s.product_id) * p.price_afiliate AS total_commission'),
                DB::raw('COUNT(s.product_id) * p.price AS total_sales'))
                ->join('users as u', 's.user_id', '=', 'u.id')
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->where('u.id', '=', $userId )
                ->groupBy('u.id')
                ->orderByDesc('total_sales')
                ->first();
               
                if ($salesCommissions != null) {
                    Session::put('commission', $salesCommissions->total_commission);
                    Session::put('total_sales', $salesCommissions->total_sales);
                } else {                   
                    Session::put('commission', '0.00');
                    Session::put('total_sales', '0.00');
                }
                        
            //Returns the total sales for the last 30 days
            $sales30d = DB::table('sales as s')
                ->select(
                    DB::raw('COUNT(s.product_id) * p.price AS total_sales')
                )
                ->join('users as u', 's.user_id', '=', 'u.id')
                ->join('products as p', 's.product_id', '=', 'p.id')
                ->where('u.id', '=', $userId)
                ->whereBetween('s.created_at', [now()->subDays(30), now()])
                ->groupBy('u.id')
                ->orderByDesc('total_sales')
                ->first();
                      
                if ($sales30d != null) {
                    Session::put('sales30d', $sales30d->total_sales);   
                } else {
                    Session::put('sales30d', '0.00');   
                }   

            return view('app.home', [
                'accessLevel' => $accessLevel,
                'mostSoldProducts' => $mostSoldProducts,
                'productRanking' => $productRanking,
                'lastSales' => $lastSales,
            ]);
        }
    }
}
