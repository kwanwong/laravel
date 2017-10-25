<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CollectionController extends Controller
{
    public function index($name = '')
    {
        if(!method_exists($this, $name)){
            echo 'this collection method not exist';
        }

        $this->$name();
    }

    private function reject()
    {
        $collection = collect(['foo', 'bar', null])->map(function ($name) {
            return strtolower($name);
        })->reject(function($name){
            return empty($name);
        });
        dd($collection->all());
    }

    public function __call($method = '', $args = [])
    {
        if($method == 'avg'){
            echo 'call avg method.';
        }
    }
}
