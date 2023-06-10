<?php

namespace App\Http\Controllers;

use App\Models\AdminUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function dashboard()
    {
        if (Auth::guard('adminUser')->check()) {
            return view('dashboard', [
                'api_token' => Auth::guard('adminUser')->user()->api_token
            ]);
        }
    }
}
