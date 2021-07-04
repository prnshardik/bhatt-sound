<?php

use Illuminate\Support\Facades\Route;

Route::get('clear', function() {
    Artisan::call('cache:clear');
    Artisan::call('optimize:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    return "config, cache, and view cleared successfully";
});

Route::get('config', function() {
    Artisan::call('config:cache');
    return "config cache successfully";
});

Route::get('key-generate', function() {
    Artisan::call('key:generate');
    return "Key generate successfully";
});

Route::get('migrate', function() {
    Artisan::call('migrate:refresh');
    return "Database migration generated";
});

Route::get('seed', function() {
    Artisan::call('db:seed');
    return "Database seeding generated";
});

Route::group(['middleware' => ['prevent-back-history']], function(){
    Route::group(['middleware' => ['guest']], function () {
        Route::get('/', 'AuthController@login')->name('login');
        Route::post('signin', 'AuthController@signin')->name('signin');

        Route::get('forget-password', 'AuthController@forget_password')->name('forget.password');
        Route::post('password-forget', 'AuthController@password_forget')->name('password.forget');
        Route::get('reset-password/{string}', 'AuthController@reset_password')->name('reset.password');
        Route::post('recover-password', 'AuthController@recover_password')->name('recover.password');
    });

    Route::group(['middleware' => ['auth']], function () {
        Route::get('logout', 'AuthController@logout')->name('logout');

        Route::get('/dashboard', 'DashboardController@index')->name('dashboard');

        /** users */
            Route::any('users', 'UsersController@index')->name('users');
            Route::get('users/create', 'UsersController@create')->name('users.create');
            Route::post('users/insert', 'UsersController@insert')->name('users.insert');
            Route::get('users/view/{id?}', 'UsersController@view')->name('users.view');
            Route::get('users/edit/{id?}', 'UsersController@edit')->name('users.edit');
            Route::patch('users/update', 'UsersController@update')->name('users.update');
            Route::post('users/change-status', 'UsersController@change_status')->name('users.change.status');
            Route::post('users/remove-image', 'UsersController@remove_image')->name('users.remove.image');
        /** users */

        /** items - Module */
            /** items-category */
                Route::any('items-categories', 'ItemsCategoriesController@index')->name('items.categories');
                Route::get('items-categories/create', 'ItemsCategoriesController@create')->name('items.categories.create');
                Route::post('items-categories/insert', 'ItemsCategoriesController@insert')->name('items.categories.insert');
                Route::get('items-categories/view/{id?}', 'ItemsCategoriesController@view')->name('items.categories.view');
                Route::get('items-categories/edit/{id?}', 'ItemsCategoriesController@edit')->name('items.categories.edit');
                Route::patch('items-categories/update', 'ItemsCategoriesController@update')->name('items.categories.update');
                Route::post('items-categories/change-status', 'ItemsCategoriesController@change_status')->name('items.categories.change.status');
            /** items-category */

            /** items */
                Route::any('items', 'ItemsController@index')->name('items');
                Route::get('items/create', 'ItemsController@create')->name('items.create');
                Route::post('items/insert', 'ItemsController@insert')->name('items.insert');
                Route::get('items/view/{id?}', 'ItemsController@view')->name('items.view');
                Route::get('items/edit/{id?}', 'ItemsController@edit')->name('items.edit');
                Route::patch('items/update', 'ItemsController@update')->name('items.update');
                Route::post('items/change-status', 'ItemsController@change_status')->name('items.change.status');

                Route::get('items/print/{id?}', 'ItemsController@print')->name('items.print');
            /** items */

            /** items-inventory */
                Route::any('items-inventories', 'ItemsInventoriesController@index')->name('items.inventories');
                Route::get('items-inventories/create', 'ItemsInventoriesController@create')->name('items.inventories.create');
                Route::post('items-inventories/insert', 'ItemsInventoriesController@insert')->name('items.inventories.insert');
                Route::get('items-inventories/view/{id?}', 'ItemsInventoriesController@view')->name('items.inventories.view');
                Route::get('items-inventories/edit/{id?}', 'ItemsInventoriesController@edit')->name('items.inventories.edit');
                Route::patch('items-inventories/update', 'ItemsInventoriesController@update')->name('items.inventories.update');
                Route::post('items-inventories/change-status', 'ItemsInventoriesController@change_status')->name('items.inventories.change.status');

                Route::get('items-inventories/print/{id?}', 'ItemsInventoriesController@print')->name('items.inventories.print');

                Route::get('items-inventories/items', 'ItemsInventoriesController@items')->name('items.inventories.items');
                Route::get('items-inventories/items/delete', 'ItemsInventoriesController@items_delete')->name('items.inventories.items.delete');

                Route::get('items-inventories/print/{id?}', 'ItemsInventoriesController@print')->name('items.inventories.print');
            /** items-inventory */
        /** items - Module */


        /** Sub items - Module */
            /** items-category */
                Route::any('sub-items-categories', 'SubItemsCategoriesController@index')->name('sub.items.categories');
                Route::get('sub-items-categories/create', 'SubItemsCategoriesController@create')->name('sub.items.categories.create');
                Route::post('sub-items-categories/insert', 'SubItemsCategoriesController@insert')->name('sub.items.categories.insert');
                Route::get('sub-items-categories/view/{id?}', 'SubItemsCategoriesController@view')->name('sub.items.categories.view');
                Route::get('sub-items-categories/edit/{id?}', 'SubItemsCategoriesController@edit')->name('sub.items.categories.edit');
                Route::patch('sub-items-categories/update', 'SubItemsCategoriesController@update')->name('sub.items.categories.update');
                Route::post('sub-items-categories/change-status', 'SubItemsCategoriesController@change_status')->name('sub.items.categories.change.status');
            /** items-category */

            /** Sub-Items */
                Route::any('sub-items', 'SubItemsController@index')->name('sub-items');
                Route::get('sub-items/create', 'SubItemsController@create')->name('sub-items.create');
                Route::post('sub-items/insert', 'SubItemsController@insert')->name('sub-items.insert');
                Route::get('sub-items/view/{id?}', 'SubItemsController@view')->name('sub-items.view');
                Route::get('sub-items/edit/{id?}', 'SubItemsController@edit')->name('sub-items.edit');
                Route::patch('sub-items/update', 'SubItemsController@update')->name('sub-items.update');
                Route::post('sub-items/change-status', 'SubItemsController@change_status')->name('sub-items.change.status');

                Route::get('sub-items/print/{id?}', 'SubItemsController@print')->name('sub-items.print');
            /** Sub-Items */

            /** items-inventory */
                Route::any('sub-items-inventories', 'SubItemsInventoriesController@index')->name('sub-items.inventories');
                Route::get('sub-items-inventories/create', 'SubItemsInventoriesController@create')->name('sub-items.inventories.create');
                Route::post('sub-items-inventories/insert', 'SubItemsInventoriesController@insert')->name('sub-items.inventories.insert');
                Route::get('sub-items-inventories/view/{id?}', 'SubItemsInventoriesController@view')->name('sub-items.inventories.view');
                Route::get('sub-items-inventories/edit/{id?}', 'SubItemsInventoriesController@edit')->name('sub-items.inventories.edit');
                Route::patch('sub-items-inventories/update', 'SubItemsInventoriesController@update')->name('sub-items.inventories.update');
                Route::post('sub-items-inventories/change-status', 'SubItemsInventoriesController@change_status')->name('sub-items.inventories.change.status');

                Route::get('sub-items-inventories/print/{id?}', 'SubItemsInventoriesController@print')->name('sub-items.inventories.print');

                Route::get('sub-items-inventories/sub-items', 'SubItemsInventoriesController@sub-items')->name('sub-items.inventories.sub_items');
                Route::get('sub-items-inventories/sub-items/delete', 'SubItemsInventoriesController@sub-items_delete')->name('sub-items.inventories.sub-items.delete');

                Route::get('sub-items-inventories/print/{id?}', 'SubItemsInventoriesController@print')->name('sub-items.inventories.print');
            /** items-inventory */
        /** Sub items - Module */
    });

    Route::get("{path}", function(){ return redirect()->route('login'); })->where('path', '.+');
});