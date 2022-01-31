<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\UserController;
use App\Http\Controllers\Api\V1\CategoryController;
use App\Http\Controllers\Api\V1\SubcategoryController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('v1/users/register', [UserController::class, 'register']);

Route::post('v1/users/login', [UserController::class, 'login']);


Route::middleware('auth:sanctum')->group(function() {
    Route::get('v1/users/show', [UserController::class, 'show']);
    Route::apiResource('v1/subcategories', SubcategoryController::class);
    Route::apiResource('v1/categories', CategoryController::class);
});

