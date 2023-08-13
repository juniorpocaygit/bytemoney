<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'phone',
        'photo',
        'access_level_id',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function accessLevel()
    {
        return $this->belongsTo(AccessLevel::class);
    }

    public function productor()
    {
        return $this->hasMany(Products::class);
    }

    public function products()
    {
        return $this->belongsToMany(Products::class, 'afiliate_products' )->withPivot(['id','link']);
    }
    
    public function saleproducts()
    {
        return $this->belongsToMany(Products::class, 'sales' )->withPivot(['client_id', 'created_at']);
    }

    public function userproduct()
    {
        return $this->hasOne(Products::class);
    }
}
