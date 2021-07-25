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
                    /** categories */
                        Route::get('items/categories', 'ItemsCategoriesController@index');
                        Route::get('items/category/{id?}', 'ItemsCategoriesController@single');
                        Route::post('items/category/insert', 'ItemsCategoriesController@insert');
                        Route::post('items/category/update', 'ItemsCategoriesController@update');
                        Route::post('items/category/status-change', 'ItemsCategoriesController@status_change');
                    /** categories */

                    /** items */
                        Route::get('items', 'ItemsController@index');
                        Route::get('item/{id?}', 'ItemsController@single');
                        Route::post('item/insert', 'ItemsController@insert');
                        Route::post('item/update', 'ItemsController@update');
                        Route::post('item/status-change', 'ItemsController@status_change');
                    /** items */

                    /** inventories */
                        Route::get('items/inventories', 'ItemsInventoriesController@index');
                        Route::get('items/inventory/{id?}', 'ItemsInventoriesController@single');
                        Route::post('items/inventory/insert', 'ItemsInventoriesController@insert');
                        Route::post('items/inventory/update', 'ItemsInventoriesController@update');
                        Route::post('items/inventory/status-change', 'ItemsInventoriesController@status_change');

                        Route::post('items/inventory/items', 'ItemsInventoriesController@items');
                        Route::post('items/inventory/items/delete', 'ItemsInventoriesController@items_delete');
                    /** inventories */
                /** items - module */

                /** Sub items - module */
                    /** categories */
                        Route::get('sub-items/categories', 'SubItemCategoriesController@index');
                        Route::get('sub-items/category/{id?}', 'SubItemCategoriesController@single');
                        Route::post('sub-items/category/insert', 'SubItemCategoriesController@insert');
                        Route::post('sub-items/category/update', 'SubItemCategoriesController@update');
                        Route::post('sub-items/category/status-change', 'SubItemCategoriesController@status_change');
                    /** categories */

                    /** subitems */
                        Route::get('sub-items', 'SubItemController@index');
                        Route::get('sub-item/{id?}', 'SubItemController@single');
                        Route::post('sub-item/insert', 'SubItemController@insert');
                        Route::post('sub-item/update', 'SubItemController@update');
                        Route::post('sub-item/status-change', 'SubItemController@status_change');
                    /** subitems */

                    /** inventories */
                        Route::get('sub-items/inventories', 'SubItemInventoriesController@index');
                        Route::get('sub-items/inventory/{id?}', 'SubItemInventoriesController@single');
                        Route::post('sub-items/inventory/insert', 'SubItemInventoriesController@insert');
                        Route::post('sub-items/inventory/update', 'SubItemInventoriesController@update');
                        Route::post('sub-items/inventory/status-change', 'SubItemInventoriesController@status_change');

                        Route::post('sub-items/inventory/sub-items', 'SubItemInventoriesController@sub_items');
                        Route::post('sub-items/inventory/sub-items/delete', 'SubItemInventoriesController@sub_items_delete');
                    /** inventories */
                /** Sub items - module */

                /** cart */ 
                    Route::get('carts', 'CartController@index');
                    Route::get('cart/{id?}', 'CartController@single');
                    Route::post('cart/insert', 'CartController@insert');
                    Route::post('cart/update', 'CartController@update');
                    Route::post('cart/status-change', 'CartController@status_change');

                    Route::post('cart/users', 'CartController@users');
                    Route::post('cart/sub_users', 'CartController@sub_users');
                    Route::post('cart/inventories', 'CartController@inventories');
                    Route::post('cart/sub_inventories', 'CartController@sub_inventories');
                /** cart */
            });
        /** Admin */
    });
});

Route::get("{path}", function(){ return response()->json(['status' => 500, 'message' => 'Bad request']); })->where('path', '.+');

Route::get('/unauthenticated', function () {
    return response()->json(['status' => 201, 'message' => 'Unacuthorized Access']);
})->name('api.unauthenticated');