<?php

namespace App\Http\Controllers;

use App\Http\Resources\Post as PostResource;
use App\Post;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $search = request()->search == 'undefined' ? '' : request()->search;

        if (auth()->check()) {
            $data1 = Post::whereNotIn('publish_id', [2, 3])->search($search)->get();
            $data2 = Post::whereNotIn('publish_id', [3])->search($search)->whereHas('user', function ($query) {
                $query->whereUnitId(auth()->user()->unit->id);
            })->get();
            $posts = $data1->merge($data2);
        } else {
            $posts = Post::search($search)->wherePublishId(1)->get();
        }

        return response([
            'posts' => PostResource::collection($posts)
        ], Response::HTTP_ACCEPTED);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($post)
    {
        $post = Post::whereSlug($post)->first();
        $post->view()->firstOrCreate(['viewable_id' => $post->id])->increment('count');

        return response([
            'post' => new PostResource($post)
        ], Response::HTTP_ACCEPTED);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
