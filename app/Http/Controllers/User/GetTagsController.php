<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Tag;
use App\Models\TagHasBlog;
use Illuminate\Http\Request;

class GetTagsController extends Controller
{
    public function getTags()
    {
        $tags = Tag::orderBy('id', 'desc')->get();
        return response()->json(["tags" => $tags]);
    }

    public function getSelectedTags(string $id)
    {
        $tags = "";
        $tags = TagHasBlog::where('blog_id', $id)->pluck('tag_id');
        return response()->json(["tags" => $tags]);
    }
}
