<?php

namespace App\Traits;

use App\User;
use App\Post;
use App\Tag;
use App\Publish;
use App\Role;
use App\Unit;

trait DataTrait
{
    public function posts()
    {
        return Post::all();
    }

    public function tags()
    {
        return Tag::all();
    }

    public function publishes()
    {
        return Publish::all();
    }

    public function units()
    {
        return Unit::all();
    }

    public function roles()
    {
        return Role::all();
    }

    public function users()
    {
        return User::all();
    }
}
