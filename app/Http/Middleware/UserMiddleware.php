<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\AdminUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserMiddleware
{
    protected $guard;

    public function __construct()
    {
        if (Auth::guard('adminUser')->check()) {
            $this->guard = 'adminUser';
        } else {
            $this->guard = null;
        }
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
    //  * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    // role is the middleware parameter
    public function handle(Request $request, Closure $next, $role)
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
                return $next($request);
            }
        }

        if ($this->guard) {
            // if the middleware parameter passed equal to the current user role then proceed next request
            if (Auth::guard('adminUser')->user()->role == $role) {
                return $next($request);
            }
        }

        // if they have no access show them forbidden message
        return response()->json(
            [
                'message' => 'you do not have access to this page.'
            ],
            403
        );
    }
}
