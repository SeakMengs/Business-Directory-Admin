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
        $company_id = $request->input('company_id');
        $banReason = $request->input('ban_reason');
        $company_user_id = $request->input('company_user_id');


        // return response()->json(
        //     [
        //         'status' => 'success',
        //         'company_id' => $company_id,
        //         'ban_reason' => $banReason,
        //         'company_user_id' => $company_user_id,
        //     ],
        //     200
        // );
        if ($this->userData) {
            $banCompany = Company::where('company_id', $company_id)->update([
                'is_banned' => true,
                'ban_reason' => $banReason,
                'ban_by_admin_id' => $this->userData->admin_id,
                'unban_by_admin_id' => null,
            ]);

            $banCompanyUser = CompanyUser::where('company_user_id', $company_user_id)->update([
                'is_banned' => true,
                'ban_reason' => "One of the company owned by this user has been banned",
                'ban_by_admin_id' => $this->userData->admin_id,
                'unban_by_admin_id' => null,
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Company has been banned'
            ], 200);
        }
    }

    public function banCompanyUser(Request $request)
    {
        $banReason = $request->input('ban_reason');
        $company_user_id = $request->input('company_user_id');

        if ($this->userData) {
            $banCompanyUser = CompanyUser::where('company_user_id', $company_user_id)->update([
                'is_banned' => true,
                'ban_reason' => $banReason,
                'ban_by_admin_id' => $this->userData->admin_id,
                'unban_by_admin_id' => null,
            ]);

            // ban all company owned by this user
            $banCompany = Company::where('company_user_id', $company_user_id)->update([
                'is_banned' => true,
                'ban_reason' => "The account of this listed company has been banned",
                'ban_by_admin_id' => $this->userData->admin_id,
                'unban_by_admin_id' => null,
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Company user has been banned'
            ], 200);
        }
    }

    public function banNormalUser(Request $request)
    {
        $banReason = $request->input('ban_reason');
        $normal_user_id = $request->input('normal_user_id');

        if ($this->userData) {
            $banNormalUser = NormalUser::where('normal_user_id', $normal_user_id)->update([
                'is_banned' => true,
                'ban_reason' => $banReason,
                'ban_by_admin_id' => $this->userData->admin_id,
                'unban_by_admin_id' => null,
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Normal user has been banned'
            ], 200);
        }
    }

    public function unBanCompanyUser(Request $request)
    {
        $company_user_id = $request->input('company_user_id');

        if ($this->userData) {
            $unBanCompanyUser = CompanyUser::where('company_user_id', $company_user_id)->update([
                'is_banned' => false,
                'ban_reason' => null,
                'ban_by_admin_id' => null,
                'unban_by_admin_id' => $this->userData->admin_id,
            ]);

            $unBanAllRelatedCompanies = Company::where('company_user_id', $company_user_id)->update([
                'is_banned' => false,
                'ban_reason' => null,
                'ban_by_admin_id' => null,
                'unban_by_admin_id' => $this->userData->admin_id,
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Company user has been unbanned'
            ], 200);
        }
    }

    public function unBanNormalUser(Request $request)
    {
        $normal_user_id = $request->input('normal_user_id');

        if ($this->userData) {
            $unBanNormalUser = NormalUser::where('normal_user_id', $normal_user_id)->update([
                'is_banned' => false,
                'ban_reason' => null,
                'ban_by_admin_id' => null,
                'unban_by_admin_id' => $this->userData->admin_id,
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Normal user has been unbanned'
            ], 200);
        }
    }

    public function getCategory(Request $request)
    {
        $sortOrderBy = $request->query('sortOrderBy');
        $searchBy = $request->query('searchBy');
        $query = $request->query('query');

        if ($this->userData) {
            $categories = Category::where($searchBy, 'like', '%' . $query . '%')->orderBy('created_at', $sortOrderBy)->get();

            return response()->json($categories, 200);
        }
    }

    public function addCategory(Request $request) {

        $newCategoryName = $request->input('name');
        $newCategoryIcon = $request->input('logo_url');

        if ($this->userData) {
            $saveNewCategory = Category::create([
                'name' => $newCategoryName,
                'logo_url' => $newCategoryIcon,
                'add_by_admin_id' => $this->userData->admin_id,
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'New category has been added'
            ], 200);
        }
    }
}
