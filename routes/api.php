<?php

use Illuminate\Http\Request;

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

Route::post('auth/login', 'Api\AuthController@login');
Route::post('auth/register', 'Api\AuthController@register');

Route::group(['middleware' => 'auth:api'], function ($router) {
    Route::get('auth/user', 'Api\AuthController@user');
    Route::post('auth/logout', 'Api\AuthController@logout');
});

Route::group(['prefix' => 'admin', 'as' => 'admin.'], function () {
    Route::resource('posts', 'Api\Admin\PostController');
    Route::resource('tags', 'Api\Admin\TagController');
    Route::resource('publishes', 'Api\Admin\PublishController');
    Route::resource('units', 'Api\Admin\UnitController');
    Route::resource('roles', 'Api\Admin\RoleController');
    Route::resource('users', 'Api\Admin\UserController');
});

Route::post('images-add', 'PostController@imageAdd');
Route::post('images-remove', 'PostController@imageRemove');
Route::post('posts/comments/{post}', 'PostController@comment');
Route::delete('posts/comments/{comment}', 'PostController@deleteComment');
Route::resource('posts', 'PostController');
Route::resource('home', 'HomeController');


