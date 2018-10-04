<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Carbon\Carbon;
use App\Category;
use Auth;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        $response = [
            'response' => $categories
        ];
        return response()->json($response, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|unique:categories|max:190',
            'description' => 'required|max:190'
        ]);

        $name = strip_tags(trim($request->input('name')));
        $description = strip_tags(trim($request->input('description')));

        $category = new category([
            'name' => $name,
            'description' => $description,
        ]);

        if ($category->save()) {
            $data = [
                "id" => $category->id,
                "name" => $category->name,
                "description" => $category->author,
                "created_at" => $category->created_at->toDateTimeString(),
                "updated_at" => $category->updated_at->toDateTimeString()
            ];
            $message = [
                'msg' => 'category created',
                'category' => $data
            ];
            return response()->json($message, 201);
        }

        $response = [
            'error' => 'Error during creation'
        ];

        return response()->json($response, 404);   
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $category = Category::find($id);
        if (empty($category)){
            $response = [
                'error' => 'Not Found.'
            ];

            return response()->json($response, 404);
        }
        $response = [
            'response' => $category
        ];
        return response()->json($response, 200);
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
        $category = Category::find($id);
        if (empty($category)){
            $response = [
                'error' => 'Not Found.'
            ];

            return response()->json($response, 404);
        }

        $name = strip_tags(trim($request->input('name')));
        $description = strip_tags(trim($request->input('description')));

        if ($request->has('name')) {
            $this->validate($request, [
                'name' => 'required|max:190',
            ]);
            $category->name = $name;
        }
        if ($request->has('description')) {
            $this->validate($request, [
                'description' => 'required|max:190',
            ]);
            $category->description = $description;
        }

        if (!$category->update()) {
            return response()->json(['msg' => 'Error during updating'], 404);
        }

        $response = [
            'msg' => 'category update',
            'status' => true,
            'category' => $category
        ];
        return response()->json($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::find($id);
        if (empty($category)){
            $response = [
                'error' => 'Not Found.'
            ];

            return response()->json($response, 404);
        }
        if (!$category->delete()) {
            return response()->json(['msg' => 'deletion failed'], 404);
        }

        $response = [
            'status' => true
        ];

        return response()->json($response, 200);
    }
}
