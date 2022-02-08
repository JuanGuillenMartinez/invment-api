<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\Corporation\CorporationRequest;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\CorporationResource;
use App\Models\Category;
use App\Models\Corporation;
use Illuminate\Http\Request;

class CorporationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $corporations = $this->corporationArrayToCollection(Corporation::all());
        return $this->sendResponse($corporations);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CorporationRequest $request)
    {
        $attributes = [
            'name' => $request->name,
            'rfc' => $request->rfc, 
        ];
        $corporation = new Corporation($attributes);
        return $corporation->save() ? $this->sendResponse($this->corporationToResource($corporation), 'Registro guardado correctamente') : $this->sendError();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Corporation  $corporation
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $corporation = $this->corporationToResource(Corporation::find($id));
        return ( $corporation ) ? $this->sendResponse($corporation, 'Registro obtenido correctamente') : $this->sendError();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Corporation  $corporation
     * @return \Illuminate\Http\Response
     */
    public function update(CorporationRequest $request, $id)
    {
        $corporation = Corporation::find($id);
        $corporation->name = $request->name;
        $corporation->rfc = $request->rfc;
        return $corporation->save() ? $this->sendResponse($this->corporationToResource($corporation), 'Petición hecha correctamente') : $this->sendError();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Corporation  $corporation
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $corporation = Corporation::find($id);
        return $corporation->delete() ? $this->sendResponse([], 'Registro eliminado correctamente') : $this->sendError();
    }

    protected function corporationToResource($category) {
        return new CorporationResource($category);
    }

    protected function corporationArrayToCollection($categoryArray) {
        return CorporationResource::collection($categoryArray);
    }
}
