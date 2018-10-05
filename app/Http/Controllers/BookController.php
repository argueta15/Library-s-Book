<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Carbon\Carbon;
use App\Book;
use App\Category;


class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $books = Book::all();
        foreach ($books as $book) {
            $book->user = $book->users()->where('status', 1)->first();
            $book->category = $book->categories()->first();
        }
        $response = [
            'response' => $books
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
            'name' => 'required|unique:books|max:190',
            'author' => 'required|max:190',
            'category' => 'required|integer',
            'published' => 'required|date_format:Y-m-d'
        ]);

        $name = strip_tags(trim($request->input('name')));
        $author = strip_tags(trim($request->input('author')));
        $category = strip_tags(trim($request->input('category')));
        $published = strip_tags(trim($request->input('published')));

        $book = new Book([
            'name' => $name,
            'author' => $author,
            'category_id' => $category,
            'published_date' => Carbon::createFromFormat('Y-m-d', $published),
            'status' => 1
        ]);

        if ($book->save()) {
            $data = [
                "id" => $book->id,
                "name" => $book->name,
                "author" => $book->author,
                "category_id" => $book->category_id,
                "category" => $book->categories()->first(),
                "published_date" => $book->published_date->toDateString(),
                "status" => $book->status,
                "created_at" => $book->created_at->toDateTimeString(),
                "updated_at" => $book->updated_at->toDateTimeString()
            ];
            $message = [
                'msg' => 'Book created',
                'book' => $data
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
        $book = Book::find($id);
        if (empty($book)){
            $response = [
                'error' => 'Not Found.'
            ];

            return response()->json($response, 404);
        }
        $response = [
            'response' => $book
        ];
        return response()->json($response, 200);
    }

    public function updateStatus(Request $request, $id){
        $this->validate($request, [
            'status' => 'required|boolean',
            'user'   => 'required|integer'
        ]);

        $book = Book::find($id);
        if (empty($book)){
            $response = [
                'error' => 'Not Found.'
            ];

            return response()->json($response, 404);
        }

        $status = $request->input('status');
        $user = $request->input('user');
        if ($status == 1){
            $book->users()->sync([ $user => ['status' => 0] ]);
        } else if ($status == 0) {
            $book->users()->sync([ $user => ['status' => 1] ]);
        }
        $book->status = $status;
        if (!$book->update()) {
            return response()->json(['msg' => 'Error during updating'], 404);
        }
        $response = [
            'status' => true
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
        $book = Book::find($id);
        if (empty($book)){
            $response = [
                'error' => 'Not Found.'
            ];

            return response()->json($response, 404);
        }

        $name = strip_tags(trim($request->input('name')));
        $author = strip_tags(trim($request->input('author')));
        $category = strip_tags(trim($request->input('category')));
        $published = strip_tags(trim($request->input('published')));

        if ($request->has('name')) {
            $this->validate($request, [
                'name' => 'required|max:190',
            ]);
            $book->name = $name;
        }
        if ($request->has('author')) {
            $this->validate($request, [
                'author' => 'required|max:190',
            ]);
            $book->author = $author;
        }
        if ($request->has('category')) {
            $this->validate($request, [
                'category' => 'required|integer',
            ]);
            $book->category_id = $category;
        }
        if ($request->has('published')) {
            $this->validate($request, [
                'published' => 'required|date_format:Y-m-d',
            ]);
            $book->published_date = Carbon::createFromFormat('Y-m-d', $published);
        }

        if (!$book->update()) {
            return response()->json(['msg' => 'Error during updating'], 404);
        }

        $response = [
            'msg' => 'Book update',
            'status' => true,
            'service' => $book
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
        $book = Book::find($id);
        if (empty($book)){
            $response = [
                'error' => 'Not Found.'
            ];

            return response()->json($response, 404);
        }
        if (!$book->delete()) {
            return response()->json(['msg' => 'deletion failed'], 404);
        }

        $response = [
            'status' => true
        ];

        return response()->json($response, 200);
    }
}
