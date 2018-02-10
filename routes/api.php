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

Route::get('users/{id}/posts', function ($id) {
    return App\User::find($id)->posts->toJson();
});

Route::delete('posts/{post_id}', function ($id) {
    $count = App\Post::destroy($id);

    return collect([
        'code' => 200,
        'message' => '成功删除'.$count.'条记录',
    ])->toJson();
});

