<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
       $user = User::where('email', $request->email)->first();
       if($user && Hash::check($request->password, $user->password))
       {
            $token = $user->createToken('api-token')->plainTextToken;
            return response()->json(
                [
                    'message' => 'success',
                    'userId' => $user->id,
                    'userToken' => $token,
                    'userName' => $user->name,
                    'userRole' => 'user'
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
