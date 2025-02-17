<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia; 

class Blog extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;
    protected $guarded = ['id'];

    public function category()
    {
        return $this->belongsTo(CategoryHasBlog::class);
    }

    public function tags()
    {
        return $this->belongsToMany(TagHasBlog::class);
    }
}
