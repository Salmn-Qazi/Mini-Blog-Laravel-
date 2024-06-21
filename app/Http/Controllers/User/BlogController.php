<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Mail\BlogNotification;
use App\Models\Admin;
use App\Models\Blog;
use App\Models\Category;
use App\Models\CategoryHasBlog;
use App\Models\Tag;
use App\Models\TagHasBlog;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BlogController extends Controller
{
    public function index($id)
    {
        $blogs = Blog::with('media')->where('user_id', $id)->orderBy('id', 'desc')->get();
        return response()->json([
            'message' => 'success',
            'blogs' => $blogs
        ]);
    }

    public function store(Request $request)
    {
        try
        {
            $data = $request->except('image');
            $validations = Validator::make($request->all(),
            [
                'name' => 'required|unique:blogs,name',
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
            
            $blog = Blog::create($data);
            if($request->has('image'))
            {
                $blog->addMediaFromRequest('image')->toMediaCollection('blog');
            }

            $admins = Admin::get();
            $email = new BlogNotification();
            foreach($admins as $admin)
            {
                Mail::to($admin->email)->send($email);
            }

            return response()->json([
                'message' => 'success',
            ]);
        }
        catch(Exception $e)
        {
            return response()->json([
                'error' => $e->getMessage()
            ]);
        }
    }

    public function show($id)
    {
        $blog = Blog::with('media')->find($id);
        return response()->json($blog);
    }

    public function update(Request $request, string $id)
    {
        try
        {
            $data = $request->except('image');
            $validations = Validator::make($request->all(),
            [
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
            $blog = Blog::where('id', $id)->update($data);
            $blog = Blog::find($id);

            if($request->has('image'))
            {
                $blog->clearMediaCollection('blog');
                $blog->addMediaFromRequest('image')->toMediaCollection('blog');
            }

            return response()->json([
                'message' => 'success',
            ]);
        }
        catch(Exception $e)
        {
            return response()->json([
                'error' => $e->getMessage()
            ]);
        }
    }

    public function delete($id)
    {
        Blog::where('id', $id)->delete();
        return response()->json([
            'message' => 'success',
        ]);
    }

    public function getBlogDetails(string $id)
    {
        $blog = Blog::with('media')->find($id);
        $categoryHasBlog = CategoryHasBlog::where('blog_id', $id)->first();
        $tagsHasBlog = TagHasBlog::where('blog_id', $id)->get('tag_id');

        if($categoryHasBlog && isset($categoryHasBlog->category_id))
        {
            $category = Category::where('id', $categoryHasBlog->category_id)->get('name');
        }
        else
        {
            $category = "No category Assign";
        }

        if(isset($tagsHasBlog))
        {
            $tags = Tag::whereIn('id', $tagsHasBlog)->get('name');
        }
        else
        {
            $tags = [];
        }
       

        return response()->json([
            'blog' => $blog,
            'category' => $category,
            'tags' => $tags
        ]);
    }
}
