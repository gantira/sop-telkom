<?php

namespace App\Http\Controllers\Api\Admin;

use App\Unit;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Unit as UnitResource;
use App\Traits\DataTrait;
use Symfony\Component\HttpFoundation\Response;

class UnitController extends Controller
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
            $units = Unit::all();
        } else {
            $units = Unit::search(request()->search)->get();
        }

        return response([
            'units' => UnitResource::collection($units)
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
        Unit::firstOrCreate([
            'name' => $request->name
        ]);

        return response([], Response::HTTP_OK);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Unit  $units
     * @return \Illuminate\Http\Response
     */
    public function show(Unit $unit)
    {
        return response([
            'unit' => $unit
        ], Response::HTTP_OK);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Unit  $units
     * @return \Illuminate\Http\Response
     */
    public function edit(Unit $units)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Unit  $units
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Unit $unit)
    {
        $unit->update($request->all());

        return response([
            'units' => UnitResource::collection($this->units())
        ], Response::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Unit  $units
     * @return \Illuminate\Http\Response
     */
    public function destroy(Unit $units)
    {
        $units->delete();

        return response([
            'units' => $this->units()
        ], Response::HTTP_OK);
    }
}
