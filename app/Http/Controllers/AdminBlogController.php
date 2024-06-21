<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\CategoryHasBlog;
use App\Models\TagHasBlog;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AdminBlogController extends Controller
{
    public function index()
    {
        $blogs = Blog::orderBy('id', 'desc')->get();
        return response()->json(["blogs" => $blogs]);
    }

    public function show(string $id)
    {
        $blog = Blog::where('id', $id)->first();
        return response()->json($blog);
    }

    public function update(Request $request, string $id)
    {
        try
        {
            $data = $request->except('image');
            $validations = Validator::make($request->all(), [
                'name' => 'required|unique:blogs,name,' . $id . ',id',
                'content' => 'required',
                'image' => 'required|mimes:png,jpg'
            ]);

            if($validations->fails())
            {
                return response()->json([
                    'message' => 'fail',
                    'errors' => $validations->errors()
                ]);
            }

            $data['slug'] = Str::slug($data['name']);
            Blog::where('id', $id)->update($data);
            $blog = Blog::find($id);

            if($request->has('image'))
            {
                $blog->clearMediaCollection('image');
                $blog->addMediaFromRequest('image')->toMediaCollection('blog');
            }

            return response()->json([
                'message' => 'success'
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

    public function delete($id)
    {
        CategoryHasBlog::where('blog_id', $id)->delete();
        TagHasBlog::where('blog_id', $id)->delete();
        Blog::where('id', $id)->delete();
        return response()->json([
            'message' => 'success'
        ]);
    }
}
