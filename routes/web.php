<?php

use Illuminate\Support\Facades\Route;

Route::get('clear', function() {
    Artisan::call('cache:clear');
    Artisan::call('optimize:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    return "config, cache, and view cleared successfully";
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
        /** items */
    });

    Route::get("{path}", function(){ return redirect()->route('login'); })->where('path', '.+');
});