<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class AdminUserController extends Controller
{
    public function index()
    {
        $users = User::orderBy('id', 'desc')->get();
        return response()->json([
            'users' => $users
        ]);
    }
}
