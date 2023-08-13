<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AfiliateProduct extends Model
{
    protected $table ='afiliate_products';

    protected $fillable = [
        'afiliate_id',
        'products_id',
    ];

    public function products()
    {
        return $this->belongsToMany(Products::class, 'products');
    }
  
    public function afilprod()
    {
        return $this->belongsTo(Products::class, 'products_id');
    }

}