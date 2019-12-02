<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Resources\Post as PostResource;
use App\Http\Controllers\Controller;
use App\Image;
use App\Post;
use App\ImageTemp;
use App\Traits\DataTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\Response;

class PostController extends Controller
{
    use DataTrait;

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['index', 'show']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (request()->search == 'undefined' || request()->search == '') {
            $posts = Post::all();
        } else {
            $posts = Post::search(request()->search)->get();
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        return response([
            'post' => new PostResource($post)
        ], Response::HTTP_OK);
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
     * @param  int  $id
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
            'posts' => PostResource::collection($this->posts())
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
}
