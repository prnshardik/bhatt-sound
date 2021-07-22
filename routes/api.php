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
                    Route::get('users', 'UsersController@index');
                    Route::get('user/{id?}', 'UsersController@single');
                    Route::post('user/insert', 'UsersController@insert');
                    Route::post('user/update', 'UsersController@update');
                    Route::post('user/status-change', 'UsersController@status_change');
                /** user */

                /** items - module */
                    /** items-categories */
                        Route::get('items/categories', 'ItemsCategoriesController@index');
                        Route::get('items/category/{id?}', 'ItemsCategoriesController@single');
                        Route::post('items/category/insert', 'ItemsCategoriesController@insert');
                        Route::post('items/category/update', 'ItemsCategoriesController@update');
                        Route::post('items/category/status-change', 'ItemsCategoriesController@status_change');
                    /** items-categories */

                    /** items */
                        Route::get('items', 'ItemsController@index');
                        Route::get('item/{id?}', 'ItemsController@single');
                        Route::post('item/insert', 'ItemsController@insert');
                        Route::post('item/update', 'ItemsController@update');
                        Route::post('item/status-change', 'ItemsController@status_change');
                    /** items */

                    /** items-inventories */
                        Route::get('items/inventories', 'ItemsInventoriesController@index');
                        Route::get('items/inventory/{id?}', 'ItemsInventoriesController@single');
                        Route::post('items/inventory/insert', 'ItemsInventoriesController@insert');
                        Route::post('items/inventory/update', 'ItemsInventoriesController@update');
                        Route::post('items/inventory/status-change', 'ItemsInventoriesController@status_change');

                        Route::post('items/inventory/items', 'ItemsInventoriesController@items');
                        Route::post('items/inventory/items/delete', 'ItemsInventoriesController@items_delete');
                    /** items-inventories */
                /** items - module */
            });
        /** Admin */
    });
});

Route::get("{path}", function(){ return response()->json(['status' => 500, 'message' => 'Bad request']); })->where('path', '.+');

Route::get('/unauthenticated', function () {
    return response()->json(['status' => 201, 'message' => 'Unacuthorized Access']);
})->name('api.unauthenticated');