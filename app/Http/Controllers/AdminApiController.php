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

    public function getUser()
    {
        if ($this->userData) {
            return response()->json($this->userData, 200);
        }
    }

    public function getWebsiteOverview()
    {
        if ($this->userData) {
            $totalUser = NormalUser::count();
            $totalCompanyUser = CompanyUser::count();
            $totalAdmin = AdminUser::count();
            $totalCompany = Company::count();
            $totalCategory = Category::count();

            return response()->json([
                'total' => [
                    'normalUsers' => $totalUser,
                    'companyUsers' => $totalCompanyUser,
                    'admins' => $totalAdmin,
                    'companies' => $totalCompany,
                    'categories' => $totalCategory,
                ]
            ], 200);
        }
    }

    public function getNormalUsers(Request $request)
    {
        // for debug purpose
        // return response()->json($request, 200);

        $sortOrderBy = $request->query('sortOrderBy');
        $searchBy = $request->query('searchBy');
        $query = $request->query('query');

        if ($this->userData) {
            $normalUsers = NormalUser::where($searchBy, 'like', '%' . $query . '%')->orderBy('created_at', $sortOrderBy)->get();

            return response()->json([
                'users' => $normalUsers
            ], 200);
        }
    }
    public function getCompanyUsers(Request $request)
    {
        // for debug purpose
        // return response()->json($request, 200);

        $sortOrderBy = $request->query('sortOrderBy');
        $searchBy = $request->query('searchBy');
        $query = $request->query('query');

        if ($this->userData) {
            $normalUsers = CompanyUser::where($searchBy, 'like', '%' . $query . '%')->orderBy('created_at', $sortOrderBy)->get();

            return response()->json([
                'users' => $normalUsers
            ], 200);
        }
    }

    public function getCompanies(Request $request)
    {
        // for debug purpose
        // return response()->json($request, 200);

        $sortOrderBy = $request->query('sortOrderBy');
        $sortBy = $request->query('sortBy');
        $searchBy = $request->query('searchBy');
        $query = $request->query('query');

        if ($this->userData) {
            $normalUsers = Company::with('reports.reportBy', 'companyUser')
                ->withCount('reports as report_count')
                ->where($searchBy, 'like', '%' . $query . '%')->orderBy($sortBy, $sortOrderBy)->get();

            return response()->json([
                'companies' => $normalUsers
            ], 200);
        }
    }

    public function banCompany(Request $request)
    {
        $companyId = $request->input('company_id');
        $banReason = $request->input('ban_reason');
        $company_user_id = $request->input('company_user_id');


        // return response()->json(
        //     [
        //         'status' => 'success',
        //         'company_id' => $companyId,
        //         'ban_reason' => $banReason,
        //         'company_user_id' => $company_user_id,
        //     ],
        //     200
        // );
        if ($this->userData) {
            $banCompany = Company::where('company_id', $companyId)->update([
                'is_banned' => true,
                'ban_reason' => $banReason,
                'ban_by_admin_id' => $this->userData->admin_id,
            ]);

            $banCompanyUser = CompanyUser::where('company_user_id', $company_user_id)->update([
                'is_banned' => true,
                'ban_reason' => "One of the company owned by this user has been banned",
                'ban_by_admin_id' => $this->userData->admin_id,
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Company has been banned'
            ], 200);
        }
    }
}
