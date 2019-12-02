<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;
use Cesargb\Database\Support\CascadeDelete;

class Publish extends Model
{
    use Searchable, CascadeDelete;

    protected $guarded = [];

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

}
