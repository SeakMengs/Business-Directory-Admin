<?php

namespace App\Http\Controllers\auth;

use App\Models\AdminUser;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function loginView()
    {
        return view('login');
    }

    public function adminLogin(Request $request)
    {
        $validate = $request->validate(
            [
                'email' => 'required',
                'password' => 'required',
            ],
            [
                'email.required' => 'Email is required',
                'password.required' => 'Password is required',
            ]
        );

        $credentials = [
            'email' => $request->input('email'),
            'password' => $request->input('password')
        ];

        //! for creating admin user from database and the password hasn't been hashed
        // AdminUser::where('email', $request->input('email'))->update([
        //     'password' => bcrypt('admin123')
        // ]);

        if (Auth::guard('adminUser')->attempt($credentials)) {

            if (Auth::guard('adminUser')->user()->role == 'adminUser') {
                // https://stackoverflow.com/questions/33334927/laravel-generate-random-unique-token
                // generate api token for fetching data from api later
                /*
                 * Explanation: do at least one loop and generate the token. then we check if the database table of admin user has the token. if it does, then we generate another token and check again. if it doesn't, then we can use the token.
                 */
                do {
                    $token = Str::random(80);
                } while (AdminUser::where('api_token', $token)->first());

                // update the api token to the database
                $admin_id = Auth::guard('adminUser')->user()->admin_id;
                AdminUser::where('admin_id', $admin_id)->update([
                    'api_token' => $token
                ]);

                return redirect()->route('admin.dashboard');
            }

        } else {
            return redirect()->back()->withErrors(['error' => 'Credentials does not match']);
        }
    }
}
