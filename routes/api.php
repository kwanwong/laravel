<?php
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::get('users/{id}', function ($id) {
//    $auth = Auth::check() ? 'Bearer '.Auth::user()->api_token : 'Bearer ';
//    $request->header('Authorization', $auth);
    return App\User::find($id)->toJson();
});

