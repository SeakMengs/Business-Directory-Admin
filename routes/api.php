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

        Route::get('/admin/website-overview', 'getWebsiteOverview')->name('api.admin.web-overview');

        Route::get('/admin/acc-management/normalUsers', 'getNormalUsers')->name('api.admin.acc-management.normalUsers');

        Route::get('/admin/acc-management/companyUsers', 'getCompanyUsers')->name('api.admin.acc-management.companyUsers');

        Route::get('/admin/acc-management/companies', 'getCompanies')->name('api.admin.acc-management.companies');

        Route::post('/admin/acc-management/post/banCompany', 'banCompany')->name('api.admin.acc-management.post.banCompany');

        Route::post('/admin/acc-management/post/banCompanyUser', 'banCompanyUser')->name('api.admin.acc-management.post.banCompanyUser');

        Route::post('/admin/acc-management/post/banNormalUser', 'banNormalUser')->name('api.admin.acc-management.post.banNormalUser');

        Route::post('/admin/acc-management/post/unBanCompanyUser', 'unBanCompanyUser')->name('api.admin.acc-management.post.unBanCompanyUser');

        Route::post('/admin/acc-management/post/unBanNormalUser', 'unBanNormalUser')->name('api.admin.acc-management.post.unBanNormalUser');

        Route::get('/admin/site-management/category', 'getCategory')->name('api.admin.site-management.category');

        Route::post('/admin/site-management/post/addCategory', 'addCategory')->name('api.admin.site-management.post.addCategory');

        Route::post('/admin/site-management/post/updateCategory', 'updateCategory')->name('api.admin.site-management.post.updateCategory');

        Route::post('/admin/site-management/post/removeCategory', 'removeCategory')->name('api.admin.site-management.post.removeCategory');
    });

});
//----------End of Group Admin Controller with middleware adminUser---------- */
