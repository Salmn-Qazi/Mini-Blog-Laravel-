<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminAuthController extends Controller
{
    public function login(Request $request)
    {
        $admin = Admin::where('email', $request->email)->first();
        if($admin && Hash::check($request->password, $admin->password))
        {
            $token = $admin->createToken('api-token')->plainTextToken;
            return response()->json(
                [
                   'message' => 'success',
                    'userId' => $admin->id,
                    'userToken' => $token,
                    'userName' => $admin->name,
                    'userRole' => 'admin'
                ]
            );
        }
        else
        {
            return response()->json(
                ['message' => 'fail']
            );
        }
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json('logout successful');
    }
}
