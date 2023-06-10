<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminApiController;

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

//----------Group Admin Controller with middleware adminUser---------- */
Route::middleware(['userAuth:adminUser'])->group(function () {

    Route::controller(AdminApiController::class)->group(function () {

        Route::get('/admin/user', 'getUser')->name('api.admin.getUser');
        Route::get('/admin/website-detail', 'getUser')->name('api.admin.web-detail');

    });

});
//----------End of Group Admin Controller with middleware adminUser---------- */
