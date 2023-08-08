<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    protected $fillable = [
        'productor_id',
        'category_id',
        'title',
        'price',
        'price_productor',
        'price_afiliate',
        'afiliate_rules',
        'description',
        'photo',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function productor()
    {
        return $this->belongsTo(User::class);
    }
}
