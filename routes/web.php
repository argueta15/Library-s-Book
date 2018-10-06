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
Route::get('/admin/categories', function () {
    return view('home');
});
Route::get('/admin/users', function () {
    return view('home');
});

Route::get('/home', 'HomeController@index')->name('home');
