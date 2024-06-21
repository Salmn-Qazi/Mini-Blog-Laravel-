<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\CategoryHasBlog;
use Illuminate\Http\Request;

class GetCategoriesController extends Controller
{
    public function getCategories()
    {
        $categories = Category::orderBy('id', 'desc')->get();
        return response()->json(["categories" => $categories]);
    }

    public function getSelectedCategory(string $id)
    {
        $category = "";
        $category = CategoryHasBlog::where('blog_id', $id)->value('category_id');
        return response()->json(["category" => $category]);
    }
}
