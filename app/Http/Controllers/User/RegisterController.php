<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function register(Request $request)
    {
        try
        {
            
            $data = $request->all();
            $validations = Validator::make($data, [
                'name' => 'required|unique:users,name',
                'email' => 'required|email|unique:users,email',
                'password' =>  'required'
            ]);

            if($validations->fails())
            {
                return response()->json([
                    'message' => 'fail',
                    'errors' => $validations->errors()
                ]);
            }

            $user = User::create($data);
            $token = $user->createToken('api-token')->plainTextToken;
            return response()->json([
                'message' => 'success',
                'userId' => $user->id,
                'userName' => $user->name,
                'userToken' => $token,
                'userRole' => 'User'
            ]);
        }
        catch(Exception $e)
        {
            return response()->json([
                'message' => 'fail',
                'error' => $e
            ]);
        }
    }
}
