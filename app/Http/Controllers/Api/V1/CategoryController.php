<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryRequest;
use App\Http\Resources\CategoryResource;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = CategoryResource::collection(Category::all());
        return ($categories) ? $this->sendResponse($categories, 'Datos obtenidos correctamente') : $this->sendError('Hubo un fallo');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $attributes = array(
            'name' => $request->name
        );
        $category = new Category($attributes);
        return ($category->save()) ? $this->sendResponse($category, 'Registro guardado correctamente') : $this->sendError('Hubo un error'); 
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $categoryResource = new CategoryResource(Category::find($id));
        return $this->sendResponse($categoryResource, 'Datos obtenidos correctamente');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $category = Category::find($id);
        $category->name = $request->name;
        return ($category->save()) ? $this->sendResponse($category, 'Correcto') : $this->sendError('Ocurrio un error');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::find($id);
        return ($category->delete()) ? $this->sendResponse([], 'Eliminado correctamente') : $this->sendError('Ocurrio un error');
    }
}
