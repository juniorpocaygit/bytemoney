<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
Use App\Models\User;
Use App\Models\AccessLevel;


class HomeController extends Controller
{
    public function index(){
        $userId = auth()->user()->id;

        $user = User::with('accessLevel')->find($userId);
        $accessLevel = $user->accessLevel;
      

        return view('app.home', [
            'accessLevel' => $accessLevel,
        ]);
    }
}
