<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\AdminUser;
use App\Models\Category;
use App\Models\NormalUser;
use App\Models\CompanyUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminApiController extends Controller
{
    protected $userData;

    public function __construct(Request $request)
    {
        // This check is for fetching data from api using api_token
        if ($request->header('Authorization')) {
            $api_token = $request->header('Authorization');

            // for debug
            // return response()->json([
            //     'api_token' => $token
            // ], 200);

            $adminData = AdminUser::where('api_token', $api_token)->first();

            if ($adminData) {
                $this->userData = $adminData;
            }
        }
    }

    public function getUser() {
        if ($this->userData) {
            return response()->json($this->userData, 200);
        }
    }

    // public function getDetail()
    // {
    //     $totalUser = NormalUser::all()->count();
    //     $totalCompanyUser = CompanyUser::all()->count();
    //     $totalAdmin = AdminUser::all()->count();
    //     $totalCompany = Company::all()->count();
    //     $totalCategory = Category::all()->count();
    //     if ($this->userData) {
    //         return response()->json([
    //                 'user' => $this->userData,
    //                 'total' => [
    //                     'normalUsers' => $totalUser,
    //                     'companyUsers' => $totalCompanyUser,
    //                     'admins' => $totalAdmin,
    //                     'companies' => $totalCompany,
    //                     'categories' => $totalCategory,
    //                 ],
    //         ],200);
    //     }
    // }

    // public function getWebsiteDetail()
    // {
    //     if ($this->userData) {
    //         $totalUser = NormalUser::all()->count();
    //         $totalCompanyUser = CompanyUser::all()->count();
    //         $totalAdmin = AdminUser::all()->count();
    //         $totalCompany = Company::all()->count();
    //         $totalCategory = Category::all()->count();

    //         return response()->json([
    //             'total' => [
    //                 'normalUsers' => $totalUser,
    //                 'companyUsers' => $totalCompanyUser,
    //                 'admins' => $totalAdmin,
    //                 'companies' => $totalCompany,
    //                 'categories' => $totalCategory,
    //             ]
    //         ], 200);
    //     }
    // }
}
