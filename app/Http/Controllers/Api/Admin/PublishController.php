<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Resources\Publish as PublishResource;
use App\Http\Controllers\Controller;
use App\Publish;
use App\Traits\DataTrait;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class PublishController extends Controller
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
            $publishes = Publish::all();
        } else {
            $publishes = Publish::search(request()->search)->get();
        }

        return response([
            'publishes' => PublishResource::collection($publishes)
        ], Response::HTTP_OK);


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
        Publish::firstOrCreate([
            'type' => $request->type,
            'description' => $request->description,
        ]);

        return response([], Response::HTTP_OK);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Publish  $publish
     * @return \Illuminate\Http\Response
     */
    public function show(Publish $publish)
    {
        return response([
            'publish' => $publish
        ], Response::HTTP_OK);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Publish  $publish
     * @return \Illuminate\Http\Response
     */
    public function edit(Publish $publish)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Publish  $publish
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Publish $publish)
    {
        $publish->update($request->only('type', 'description'));

        return response([
            'publishes' => $this->publishes()
        ], Response::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Publish  $publish
     * @return \Illuminate\Http\Response
     */
    public function destroy(Publish $publish)
    {
        $publish->delete();

        return response([
            'publishes' => $this->publishes()
        ], Response::HTTP_OK);
    }
}
