<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;
use Cesargb\Database\Support\CascadeDelete;
use Illuminate\Support\Str;
use Cviebrock\EloquentSluggable\Sluggable;

class Tag extends Model
{
    use Searchable, CascadeDelete, Sluggable;

    protected $cascadeDeleteMorph = ['posts'];

    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'name'
            ]
        ];
    }

    protected $guarded = [];

    public function posts()
    {
        return $this->morphedByMany(Post::class, 'taggable');
    }

    public function videos()
    {
        return $this->morphedByMany(Video::class, 'taggable');
    }

    public function setNameAttribute($value)
    {
        $this->attributes['name'] = Str::title($value);
    }
}
