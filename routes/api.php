<?php

use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminBlogController;
use App\Http\Controllers\AdminUserController;
use App\Http\Controllers\User\AuthController;
use App\Http\Controllers\User\BlogController;
use App\Http\Controllers\User\CategoryAndTagController;
use App\Http\Controllers\User\GetCategoriesController;
use App\Http\Controllers\User\GetTagsController;
use App\Http\Controllers\User\RegisterController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Laravel\Sanctum\Sanctum;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/authenticate-user', [AuthController::class, 'login'])->name('login');
Route::post('/register', [RegisterController::class, 'register']);

// admin authentication
Route::post('/authenticate-admin', [AdminAuthController::class, 'login']);

Route::middleware(['auth:sanctum'])->group(function() {
    Route::get('/blogs/user/{id}', [BlogController::class, 'index']);
    Route::post('/blog', [BlogController::class, 'store']);
    Route::get('/blog/{id}', [BlogController::class, 'show']);
    Route::post('/blog/{id}', [BlogController::class, 'update']);
    Route::delete('/blog/{id}', [BlogController::class, 'delete']);
    Route::get('/getBlogDetails/{id}', [BlogController::class, 'getBlogDetails']);


    Route::get('/categories', [GetCategoriesController::class, 'getCategories']);
    Route::get('/tags', [GetTagsController::class, 'getTags']);

    Route::get('/getSelectedCategory/{id}', [GetCategoriesController::class, 'getSelectedCategory']);
    Route::get('/getSelectedTags/{id}', [GetTagsController::class, 'getSelectedTags']);

    Route::get('/getBlogName/{id}', [CategoryAndTagController::class, 'getBlogName']);
    Route::post('/assignCategoryAndTag/{id}', [CategoryAndTagController::class, 'assignCategoryAndTags']);

    Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

    // Admin Routes
    Route::get('/admin/users', [AdminUserController::class, 'index']);

    // Route::controller(AdminBlogController::class)->group(function(){
    //     Route::get('/admin/blogs', 'index');
    //     Route::delete('admin/blog/{id}', 'delete');
    // });

    Route::get('/admin/blogs', [AdminBlogController::class, 'index']);

    // admin logout
    Route::post('/admin/logout', [AdminAuthController::class, 'logout']);
});

