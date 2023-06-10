<?php

use Illuminate\Support\Facades\Route;
use App\http\Controllers\AdminController;
use App\Http\Controllers\auth\LoginController;
use App\Http\Controllers\auth\LogoutController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


//-------------------Group Login Controller-------------------- */
Route::controller(LoginController::class)->group(function () {

    Route::get('/', 'loginView')->name('login');

    Route::post('/logging-in/admin', 'adminLogin')->name('admin.login');
});
//-------------------End of Group Login Controller-------------------- */

Route::controller(LogoutController::class)->group(function () {

    Route::post('/logging-out/admin', 'adminLogout')->name('admin.logout');

});


//----------Group Admin Controller with middleware adminUser---------- */
Route::middleware(['userAuth:adminUser'])->group(function () {

    Route::controller(AdminController::class)->group(function () {

        Route::get('/admin/dashboard', 'dashboard')->name('admin.dashboard');

    });

});
//----------End of Group Admin Controller with middleware adminUser---------- */
