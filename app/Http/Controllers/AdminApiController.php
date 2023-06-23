<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\Category;
use App\Models\AdminUser;
use App\Models\NormalUser;
use App\Models\CompanyUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

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
        $banByAdminId = $request->query('banByAdminId') ?? null;

        if ($this->userData) {

            if ($banByAdminId == null) {
                $normalUsers = NormalUser::where([[$searchBy, 'like', '%' . $query . '%']])->orderBy('created_at', $sortOrderBy)->get();
            } else {
                $normalUsers = NormalUser::where([[$searchBy, 'like', '%' . $query . '%'], ['ban_by_admin_id', $banByAdminId]])->orderBy('created_at', $sortOrderBy)->get();
            }

            if ($normalUsers) {
                return response()->json([
                    'users' => $normalUsers
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'No users found'
                ], 400);
            }
        }
    }
    public function getCompanyUsers(Request $request)
    {
        // for debug purpose
        // return response()->json($request, 200);

        $sortOrderBy = $request->query('sortOrderBy');
        $searchBy = $request->query('searchBy');
        $query = $request->query('query');
        $banByAdminId = $request->query('banByAdminId') ?? null;

        if ($this->userData) {

            if ($banByAdminId == null) {
                $companyUser = CompanyUser::where($searchBy, 'like', '%' . $query . '%')->orderBy('created_at', $sortOrderBy)->get();
            } else {
                $companyUser = CompanyUser::where([[$searchBy, 'like', '%' . $query . '%'], ['ban_by_admin_id', $banByAdminId]])->orderBy('created_at', $sortOrderBy)->get();
            }

            if ($companyUser) {
                return response()->json([
                    'users' => $companyUser
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'No users found'
                ], 400);
            }
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
        $banByAdminId = $request->query('banByAdminId') ?? null;

        if ($this->userData) {

            if ($banByAdminId == null) {
                $companies = Company::with('reports.reportBy', 'companyUser')
                    ->withCount('reports as report_count')
                    ->where($searchBy, 'like', '%' . $query . '%')->orderBy($sortBy, $sortOrderBy)->get();
            } else {
                $companies = Company::with('reports.reportBy', 'companyUser')
                    ->withCount('reports as report_count')
                    ->where([[$searchBy, 'like', '%' . $query . '%'], ['ban_by_admin_id', $banByAdminId]])->orderBy($sortBy, $sortOrderBy)->get();
            }
            // $companies = Company::with('reports.reportBy', 'companyUser')
            //     ->withCount('reports as report_count')
            //     ->where($searchBy, 'like', '%' . $query . '%')->orderBy($sortBy, $sortOrderBy)->get();

            if ($companies) {
                return response()->json([
                    'companies' => $companies
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'No companies found'
                ], 400);
            }
        }
    }

    public function banCompany(Request $request)
    {
        $company_id = $request->input('company_id');
        $banReason = $request->input('ban_reason');
        $company_user_id = $request->input('company_user_id');

        if ($this->userData->ban_access || $this->userData->access_everything) {
            // ban entire companies owned by this user
            $banCompany = Company::where('company_user_id', $company_user_id)->update([
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

            if ($banCompany && $banCompanyUser) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Company has been banned'
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to ban company'
                ], 400);
            }
        }
    }

    public function banCompanyUser(Request $request)
    {
        $banReason = $request->input('ban_reason');
        $company_user_id = $request->input('company_user_id');

        if ($this->userData->ban_access || $this->userData->access_everything) {
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

            // there is a chance that the company user has no company
            if ($banCompanyUser || $banCompany) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Company user has been banned'
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to ban company user'
                ], 400);
            }
        }
    }

    public function banNormalUser(Request $request)
    {
        $banReason = $request->input('ban_reason');
        $normal_user_id = $request->input('normal_user_id');

        if ($this->userData->ban_access || $this->userData->access_everything) {
            $banNormalUser = NormalUser::where('normal_user_id', $normal_user_id)->update([
                'is_banned' => true,
                'ban_reason' => $banReason,
                'ban_by_admin_id' => $this->userData->admin_id,
                'unban_by_admin_id' => null,
            ]);

            if ($banNormalUser) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Normal user has been banned'
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to ban normal user'
                ], 400);
            }
        }
    }

    public function unBanCompanyUser(Request $request)
    {
        $company_user_id = $request->input('company_user_id');

        if ($this->userData->ban_access || $this->userData->access_everything) {
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

            // there is a chance that the company user has no company
            if ($unBanCompanyUser || $unBanAllRelatedCompanies) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Company user has been unbanned'
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to unban company user'
                ], 400);
            }
        }
    }

    public function unBanNormalUser(Request $request)
    {
        $normal_user_id = $request->input('normal_user_id');

        if ($this->userData->ban_access || $this->userData->access_everything) {
            $unBanNormalUser = NormalUser::where('normal_user_id', $normal_user_id)->update([
                'is_banned' => false,
                'ban_reason' => null,
                'ban_by_admin_id' => null,
                'unban_by_admin_id' => $this->userData->admin_id,
            ]);

            if ($unBanNormalUser) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Normal user has been unbanned'
                ], 200);
            }
        }
    }

    public function getCategory(Request $request)
    {
        $sortOrderBy = $request->query('sortOrderBy');
        $searchBy = $request->query('searchBy');
        $query = $request->query('query');
        $add_by_admin_id = $request->query('add_by_admin_id') ?? null;

        if ($this->userData) {
            if ($add_by_admin_id == null) {
                $categories = Category::where($searchBy, 'like', '%' . $query . '%')->orderBy('created_at', $sortOrderBy)->get();
            } else {
                $categories = Category::where([[$searchBy, 'like', '%' . $query . '%'], ['add_by_admin_id', $add_by_admin_id]])->orderBy('created_at', $sortOrderBy)->get();
            }

            if ($categories) {
                return response()->json($categories, 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to get categories'
                ], 400);
            }
        }
    }

    public function addCategory(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['unique:category,name'],
            'logo_url' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Category name already exist or logo url is empty'
            ], 400);
        }

        if ($this->userData->access_everything || $this->userData->access_category) {
            $newCategoryName = $request->input('name');
            $newCategoryIcon = $request->input('logo_url');
            $saveNewCategory = Category::create([
                'name' => $newCategoryName,
                'logo_url' => $newCategoryIcon,
                'add_by_admin_id' => $this->userData->admin_id,
            ]);

            if ($saveNewCategory) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'New category has been added'
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to add new category'
                ], 400);
            }
        }
    }

    public function updateCategory(Request $request)
    {
        $category_id = $request->input('category_id');
        $category_name = $request->input('name');
        $category_icon = $request->input('logo_url');

        $validator = Validator::make($request->all(), [
            // make sure the name is unique except for the current category name
            'name' => ['unique:category,name,' . $category_id . ',category_id'],
            'logo_url' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Category name already exist or logo url is empty'
            ], 400);
        }

        if ($this->userData->access_everything || $this->userData->access_category) {
            $updateCategory = Category::where('category_id', $category_id)->update([
                'name' => $category_name,
                'logo_url' => $category_icon,
                'edit_by_admin_id' => $this->userData->admin_id,
            ]);

            if ($updateCategory) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Category has been updated'
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to update category'
                ], 400);
            }
        }
    }

    public function removeCategory(Request $request)
    {
        $category_id = $request->input('category_id');

        if ($category_id) {
            if ($this->userData->access_everything || $this->userData->access_category) {
                // get one company in this category if it exist we don't allow to remove the category
                $checkCompanyInCategory = Company::where('category_id', $category_id)->get();

                if ($checkCompanyInCategory && count($checkCompanyInCategory) > 0) {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'There are companies in this category, we cannot remove it'
                    ], 400);
                }

                $removeCategory = Category::where('category_id', $category_id)->delete();

                if ($removeCategory) {
                    return response()->json([
                        'status' => 'success',
                        'message' => 'Category has been removed'
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Failed to remove category'
                    ], 400);
                }
            }
        }
    }

    public function createAdmin(Request $request)
    {
        if ($this->userData) {
            $validator = Validator::make($request->all(), [
                'email' => ['unique:admin_user,email'],
                'password' => ['required', 'min:8'],
                'name' => ['required', 'unique:admin_user,name'],
                'ban_access' => 'required',
                'add_category' => 'required',
                'access_everything' => 'required',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Credentials already exist or required fields are empty'
                ], 400);
            }

            if ($this->userData->access_everything) {
                $newAdmin = AdminUser::create([
                    'email' => $request->input('email'),
                    'name' => $request->input('name'),
                    'password' => $request->input('password'),
                    'ban_access' => $request->input('ban_access'),
                    'add_category' => $request->input('add_category'),
                    'access_everything' => $request->input('access_everything'),
                ]);

                if ($newAdmin) {
                    return response()->json([
                        'status' => 'success',
                        'message' => 'New admin has been added'
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Failed to add new admin'
                    ], 400);
                }
            }
        }
    }

    public function getAdmins(Request $request)
    {
        $sortOrderBy = $request->query('sortOrderBy');
        $searchBy = $request->query('searchBy');
        $query = $request->query('query');

        if ($this->userData) {
            $admins = AdminUser::where($searchBy, 'like', '%' . $query . '%')->orderBy('created_at', $sortOrderBy)->get();

            if ($admins) {
                return response()->json($admins, 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'No admins found'
                ], 400);
            }
        }
    }

    public function updateAdmin(Request $request)
    {
        $admin_id = $request->input('admin_id');

        $validator = Validator::make($request->all(), [
            'name' => ['unique:admin_user,name,' . $admin_id . ',admin_id'],
            'add_category' => 'required',
            'ban_access' => 'required',
            'access_everything' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Name already exist or required fields are missing'
            ], 400);
        }

        if ($this->userData) {
            // check if the admin id exist so that we can update the admin data
            // and check if the current user has the privilege update admin account data
            if ($admin_id && $this->userData->access_everything) {
                $updateAdmin = AdminUser::where('admin_id', $admin_id)->update([
                    'name' => $request->input('name'),
                    'add_category' => $request->input('add_category'),
                    'ban_access' => $request->input('ban_access'),
                    'access_everything' => $request->input('access_everything'),
                ]);

                if ($updateAdmin) {
                    return response()->json([
                        'status' => 'success',
                        'message' => 'Admin has been updated'
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Failed to update admin'
                    ], 400);
                }
            }
        }
    }

    public function removeAdmin(Request $request)
    {
        $admin_id = $request->input('admin_id');

        if ($this->userData) {
            if ($admin_id && $this->userData->access_everything) {
                $removeAdmin = AdminUser::where('admin_id', $admin_id)->delete();

                if ($removeAdmin) {
                    return response()->json([
                        'status' => 'success',
                        'message' => 'Admin has been removed'
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Failed to remove admin'
                    ], 400);
                }
            }
        }
    }

    public function resetDefaultAdminPassword(Request $request)
    {
        $admin_id = $request->input('admin_id');

        if ($this->userData) {
            if ($admin_id && $this->userData->access_everything) {
                $validator = Validator::make($request->all(), [
                    'password' => ['required', 'min:8'],
                ]);

                if ($validator->fails()) {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Password must be at least 8 characters long'
                    ], 400);
                }

                $resetPassword = AdminUser::where('admin_id', $admin_id)->update([
                    'password' => bcrypt('admin123')
                ]);

                if ($resetPassword) {
                    return response()->json([
                        'status' => 'success',
                        'message' => 'Admin password has been reset'
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'Failed to reset admin password'
                    ], 400);
                }
            }
        }
    }

    public function updateAdminProfile(Request $request)
    {
        $admin_id = $request->input('admin_id');

        // make sure the current user that request to update profile is the owner of the account
        if ($this->userData->admin_id == $admin_id) {
            $validator = Validator::make(
                $request->all(),
                [
                    'name' => ['unique:admin_user,name,' . $admin_id . ',admin_id'],
                    'email' => ['unique:admin_user,email,' . $admin_id . ',admin_id'],
                    // make sure it match the password in the database
                    'password' => [
                        'required',
                        'min:8',
                    ],
                ],
                [
                    'password.min' => 'Password must be at least 8 characters long',
                    'password.required' => 'Password is required',
                    'name.unique' => 'Name already exist',
                    'email.unique' => 'Email already exist',
                ]
            );

            if ($validator->fails()) {
                return response()->json([
                    'status' => 'error',
                    'message' => $validator->errors()->first()
                ], 400);
            }

            // check password match the current user or not
            // https://laracasts.com/discuss/channels/laravel/how-to-decrypt-bcrypt-password
            if (!Hash::check($request->input('password'), $this->userData->password)) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Password is incorrect'
                ], 400);
            }

            $updateData = [
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'profile_url' => $request->input('profile_url'),
            ];

            // if the new password is not empty then update the password
            if ($request->input('new_password')) {
                $validator = Validator::make($request->all(), [
                    'new_password' => ['required', 'min:8'],
                ]);

                if ($validator->fails()) {
                    return response()->json([
                        'status' => 'error',
                        'message' => 'New password must be at least 8 characters long'
                    ], 400);
                }

                $updateData['password'] = bcrypt($request->input('new_password'));
            }

            $updateProfile = AdminUser::where('admin_id', $admin_id)->update($updateData);

            if ($updateProfile) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Profile has been updated'
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Failed to update profile'
                ], 400);
            }
        }
    }
}
