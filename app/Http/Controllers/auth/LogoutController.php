<?php

namespace App\Http\Controllers\auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\AdminUser;
use Illuminate\Support\Facades\Auth;

class LogoutController extends Controller
{
    public function adminLogout()
    {
        // clear api_token from database first
        $admin_id = Auth::guard('adminUser')->user()->admin_id;
        AdminUser::where('admin_id', $admin_id)->update([
            'api_token' => null
        ]);

        // logout the user
        Auth::guard('adminUser')->logout();

        // redirect to login page
        return redirect()->route('login');
    }
}
