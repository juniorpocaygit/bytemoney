<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccessLevel extends Model
{
    protected $table = 'access_level';

    protected $fillable = [
        'name',
        'level',
    ];

    public function users()
    {
        return $this->hasMany(User::class);
    }
}
