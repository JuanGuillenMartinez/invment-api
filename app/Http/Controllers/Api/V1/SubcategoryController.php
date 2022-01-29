<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\SubcategoryRequest;
use App\Models\Subcategory;
use Illuminate\Http\Request;

class SubcategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $subcategories = Subcategory::with('category')->get();
        return response()->json(array(
            'message' => 'Request succesfully processed', 
            'data' => $subcategories
        ));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(SubcategoryRequest $request)
    {
        //
        $subcategory = new Subcategory();
        $subcategory->id_category = $request->id_category;
        $subcategory->name = $request->name;
        $message = ($subcategory->save()) ? 'Subcategory saved successfully' : 'Error saving';
        return response()->json(array(
            'message' => $message
        ));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $subcategory = $this->find($id);
        return response()->json(array(
            'message' => 'Request succesfully processed', 
            'data' => $subcategory
        ));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Http\Response
     */
    public function update(SubcategoryRequest $request, $id)
    {
        //
        $subcategory = $this->find($id);
        $subcategory->id_category = $request->id_category;
        $subcategory->name = $request->name;
        $message = ($subcategory->save()) ? 'Subcategory updated successfully' : 'Error updating subcategory';
        return response()->json(array(
            'message' => $message
        ));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Subcategory  $subcategory
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $subcategory = $this->find($id);
        $message = ($subcategory->delete()) ? 'Subcategory deleted successfully' : 'Error removing subcategory';
        return response()->json(array(
            'message' => $message
        ));
    }

    protected function find($id) {
        return Subcategory::where('id_subcategory', $id)->first();
    }
}
