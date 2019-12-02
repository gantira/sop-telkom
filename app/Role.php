<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;
use Cesargb\Database\Support\CascadeDelete;

class Role extends Model
{
    use Searchable, CascadeDelete;

    protected $guarded = [];

    public function users()
    {
        return $this->morphedByMany(User::class, 'roleable');
    }

    public function roles()
    {
        return $this->morphToMany(Role::class, 'roleable');
    }
}
