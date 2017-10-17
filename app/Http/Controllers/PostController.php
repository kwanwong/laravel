<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post as Post;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::all();
        dd($posts);
    }
}
