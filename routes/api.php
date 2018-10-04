<?php

use Illuminate\Http\Request;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1',  'middleware' => 'auth:api'], function()
{
    Route::resource('books', 'BookController', [
        'except' => ['edit', 'create']
    ]);

    Route::post('books/status/{id}', [
        'uses' => 'BookController@updateStatus'
    ]);

    Route::resource('categories', 'CategoryController', [
        'except' => ['edit', 'create']
    ]);

    Route::resource('users', 'UserController', [
        'except' => ['edit', 'create', 'destroy']
    ]);

});
