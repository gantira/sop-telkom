<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Post;
use App\Image;
use App\ImageTemp;
use Illuminate\Http\Request;
use App\Http\Resources\Post as PostResource;
use App\Traits\DataTrait;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    use DataTrait;

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['show']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $search = request()->search == 'undefined' ? '' : request()->search;

        if (auth()->check()) {
            $posts = auth()->user()->posts()->get();
        } else {
            $posts = Post::search(request()->search)->where('unit_id', auth()->user()->unit->id)->get();
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
        $request->validate([
            'title' => 'required',
            'body' => 'required',
            'publish_id' => 'required',
        ]);

        $post = request()->user()->posts()->create($request->except('tags'));

        $tagsTemp = array_map(function($item){ return $item['id']; }, $request->tags);
        $post->tags()->attach($tagsTemp);

        $imagetemp = ImageTemp::whereVisitor(request()->ip())->get();
        foreach ($imagetemp as $value) {
            $post->image()->create(['url' => $value->url]);
        }

        ImageTemp::whereVisitor(request()->ip())->delete();

        return response([
            'posts' => PostResource::collection($this->posts())
        ], Response::HTTP_OK);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show($post)
    {
        $post = Post::whereSlug($post)->first();
        $post->view()->firstOrCreate(['viewable_id' => $post->id], ['count' => 0])->increment('count');

        return response([
            'post' => new PostResource($post)
        ], Response::HTTP_ACCEPTED);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        $post->update($request->only('title', 'body', 'publish_id'));

        $tagsTemp = array_map(function($item){ return $item['id']; }, $request->tags);
        $post->tags()->sync($tagsTemp);

        $imagetemp = ImageTemp::whereVisitor(request()->ip())->get();
        foreach ($imagetemp as $value) {
            $post->image()->create(['url' => $value->url]);
        }

        ImageTemp::whereVisitor(request()->ip())->delete();

        return response([
            'posts' => $request->all()
        ], Response::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        $post->delete();

        foreach ($post->image()->get() as $key => $value) {
            Image::destroy($value->id);
            Storage::disk('public')->delete($value->url);
        }

        return response()->json([
            'posts' => PostResource::collection(auth()->user()->posts()->get())
        ], Response::HTTP_OK);
    }

    public function imageAdd(Request $request)
    {
        $path = Storage::disk('public')->putFile('images', $request->file('image'));
        $url = Storage::disk('public')->url($path);

        ImageTemp::create([
            'visitor' => request()->ip(),
            'url' => $path
        ]);

        return response()->json([
            'url' => $url
        ], Response::HTTP_OK);
    }

    public function imageRemove(Request $request)
    {
        $image = explode("/" , $request->image);
        Storage::disk('public')->delete($image[6].'/'.$image[7]);
        ImageTemp::whereUrl($image[6].'/'.$image[7])->delete();

        return response()->json([], Response::HTTP_OK);
    }

    public function comment(Request $request, Post $post)
    {
        $request->validate([
            'body' => 'required|max: 255',
        ]);

        $post->comments()->create(['body' => $request->body, 'user_id' => auth()->user()->id]);

        return response()->json([], Response::HTTP_OK);
    }

    public function deleteComment(Comment $comment)
    {
        $comment->delete();

        return response()->json([], Response::HTTP_OK);
    }
}
