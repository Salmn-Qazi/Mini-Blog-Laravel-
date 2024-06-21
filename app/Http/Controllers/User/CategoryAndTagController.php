<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\CategoryHasBlog;
use App\Models\TagHasBlog;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryAndTagController extends Controller
{
    public function getBlogName(string $id)
    {
        $blogName = Blog::where('id', $id)->pluck('name');
        return response()->json(["name" => $blogName]);
    }

    public function assignCategoryAndTags(Request $request, string $id)
    {
        try
        {
            $validations = Validator::make($request->all(), [
                'category' => 'required',
                'tags' => 'required'
            ]);

            if($validations->fails())
            {
                return response()->json([
                    'message' => 'fails',
                    'errors' => $validations->errors()
                ]);
            }

            CategoryHasBlog::where('blog_id', $id)->delete();
            TagHasBlog::where('blog_id', $id)->delete();

            CategoryHasBlog::create([
                'category_id' => $request->category,
                'blog_id' => $id
            ]);
    
            foreach($request->tags as $tagId)
            {
                TagHasBlog::create([
                    'tag_id' => $tagId,
                    'blog_id' => $id
                ]);
            }

            return response()->json([
                'message' => 'success'
            ]);
        }
        catch(Exception $e)
        {
            return response()->json([
                'message' => 'fail',
                'error' => $e->getMessage()
            ]);
        }
    }
}
