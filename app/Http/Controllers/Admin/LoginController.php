<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LoginController extends Controller
{
    public function showLoginForm()
    {
        $title = '后台登录';
        return view('admin.auth.login', compact('title'));
    }

    public function login(Request $request)
    {
        dd($request->all());
    }
}
