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

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');
Route::post('/register', 'Auth\RegisterController@create');
Route::post('/userprofile/{id}','Auth\RegisterController@uploadprofile')->middleware('auth:api');
Route::post('/kitchenregister','KitchenRegisterController@store')->middleware('auth:api');
Route::get('/kitchens','KitchenRegisterController@index')->middleware('auth:api');
Route::post('/dish','DishController@store')->middleware('auth:api');
Route::get('/dish','DishController@index')->middleware('auth:api');
Route::get('/dish/{id}','DishController@show')->middleware('auth:api');
Route::get('/deletedish/{id}','DishController@destroy')->middleware('auth:api');
Route::get('/specificdish/{kid}/{did}','DishController@specificDish')->middleware('auth:api');
Route::get('/kitchendish/{id}','DishController@kitchenDish')->middleware('auth:api');
Route::post('/events','EventsController@store')->middleware('auth:api');
Route::get('/events','EventsController@index')->middleware('auth:api');
Route::post('/events/{id}','EventsController@update')->middleware('auth:api');
Route::get('/events/{id}','EventsController@show')->middleware('auth:api');
Route::get('/kitchenevent/{id}','EventsController@kitchenEvents')->middleware('auth:api');
Route::get('/deleteevent/{id}','EventsController@destroy')->middleware('auth:api');
Route::get('/specificevent/{kid}/{eid}','EventsController@specificEvent')->middleware('auth:api');
Route::post('/gallery','GalleryController@store')->middleware('auth:api');
Route::get('/gallery','GalleryController@index')->middleware('auth:api');
Route::get('/kitchengallery/{id}','GalleryController@kitchenGallery')->middleware('auth:api');
Route::get('/specificgallery/{kid}/{gid}','GalleryController@specificGallery')->middleware('auth:api');
Route::post('/rating','RatingController@store')->middleware('auth:api');
Route::get('/specificRating/{kid}','RatingController@specificKitchenRating')->middleware('auth:api');

