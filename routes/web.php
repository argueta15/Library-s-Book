<?php
Route::get('/', function () {
    return view('home');
});
Route::get('/login', function () {
    return view('home');
});
Route::get('/admin', function () {
    return view('home');
});

//Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
