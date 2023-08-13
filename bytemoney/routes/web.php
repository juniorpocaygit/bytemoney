<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PerfilController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\AfiliateProductsController;
use App\Http\Controllers\SalesController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

//Sale
Route::get('/vendas/{link}', [SalesController::class, 'saleProducts'])->name('sale.product');
Route::post('/vendas/{link}', [SalesController::class, 'sale'])->name('sale.post');

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [HomeController::class, 'index'] )->name('app.home');
   
    Route::get('/perfil', [PerfilController::class, 'edit'])->name('perfil.edit');
    Route::put('/perfil', [PerfilController::class, 'update'])->name('perfil.update');
    Route::delete('/perfil', [PerfilController::class, 'destroy'])->name('perfil.destroy');
   
    //Afiliates
    Route::get('/produtos/mercado', [AfiliateProductsController::class, 'allProducts'])->name('afiliate.allproducts');
    Route::get('/afiliacao/{id}', [AfiliateProductsController::class, 'afiliate'])->name('afiliate.products');
    Route::get('/produtos/meuprodutos', [AfiliateProductsController::class, 'myafiliate'])->name('myafiliate.products');
    Route::delete('/produtos/desfiliacao/{id}', [AfiliateProductsController::class, 'desfiliate'])->name('desfiliate.products');
    Route::get('/afiliados', [AfiliateProductsController::class, 'allAfiliates'])->name('all.afiliates');
    Route::get('/produtos/categoria/{id}', [AfiliateProductsController::class, 'filterCategory'])->name('filter.category');
    
    //Access_Level
    Route::resource('/nivel-acesso', AccessLevelController::class);

    //Products
    Route::resource('produtos', ProductsController::class);

    //Sale protected
    Route::get('/clientes', [SalesController::class, 'allClients'])->name('all.clients');
});

require __DIR__.'/auth.php';
