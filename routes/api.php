<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'api', 'namespace' => 'API'], function () {
    Route::post('login', 'AuthController@login');

    Route::group(['middleware' => 'auth:sanctum'], function () {
        Route::get('logout', 'AuthController@logout');

        /** process */
            // Route::post('scan', 'InventoryController@scan');
        /** process */

        /** Admin */
            Route::group(['namespace' => 'Admin', 'prefix' => 'admin'], function () {
                /** user */
                    Route::get('users', 'UsersController@users');
                    Route::get('user/{id?}', 'UsersController@user');
                    Route::post('user/insert', 'UsersController@insert');
                    Route::post('user/update', 'UsersController@update');
                    Route::post('user/status-change', 'UsersController@status_change');
                /** user */

                /** items - module */
                    /** items-categories */
                        Route::get('items/categories', 'ItemsCategoriesController@categories');
                        Route::get('items/category/{id?}', 'ItemsCategoriesController@category');
                        Route::post('items/category/insert', 'ItemsCategoriesController@insert');
                        Route::post('items/category/update', 'ItemsCategoriesController@update');
                        Route::post('items/category/status-change', 'ItemsCategoriesController@status_change');
                    /** items-categories */
                /** items - module */
            });
        /** Admin */
    });
});

Route::get("{path}", function(){ return response()->json(['status' => 500, 'message' => 'Bad request']); })->where('path', '.+');

Route::get('/unauthenticated', function () {
    return response()->json(['status' => 201, 'message' => 'Unacuthorized Access']);
})->name('api.unauthenticated');