<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Validation\Rule;
use Carbon\Carbon;
use App\User;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::where('type', 'guest')->get();
        $response = [
            'response' => $users
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
            'name' => 'required|max:190',
            'email' => 'required|unique:users|email|max:190',
            'phone' => 'required|numeric|max:9999999999'
        ]);

        $name = strip_tags(trim($request->input('name')));
        $email = strip_tags(trim($request->input('email')));
        $phone = strip_tags(trim($request->input('phone')));
        $password = "Aa12345678";

        $user = new User([
            'name' => $name,
            'email' => $email,
            'password' => bcrypt($password),
            'phone' => $phone,
        ]);

        if ($user->save()) {
            $message = [
                'msg' => 'USer created',
                'user' => $user
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
        $user = User::find($id);
        if (empty($user)){
            $response = [
                'error' => 'Not Found.'
            ];

            return response()->json($response, 404);
        }
        $response = [
            'response' => $user
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
        $user = User::find($id);
        if (empty($user)){
            $response = [
                'error' => 'Not Found.'
            ];

            return response()->json($response, 404);
        }

        $name = strip_tags(trim($request->input('name')));
        $email = strip_tags(trim($request->input('email')));
        $phone = strip_tags(trim($request->input('phone')));

        if ($request->has('name')) {
            $this->validate($request, [
                'name' => 'required|max:190',
            ]);
            $user->name = $name;
        }
        if ($request->has('email')) {
            $this->validate($request, [
                'email' => [
                    'required',
                    Rule::unique('users')->ignore($user->id),
                    'email',
                    'max:190'
                ]
            ]);
            $user->email = $email;
        }
        if ($request->has('phone')) {
            $this->validate($request, [
                'phone' => 'required|numeric|max:9999999999'
            ]);
            $user->phone = $phone;
        }

        if (!$user->update()) {
            return response()->json(['msg' => 'Error during updating'], 404);
        }

        $response = [
            'msg' => 'user update',
            'status' => true,
            'user' => $user
        ];
        return response()->json($response, 200);
    }
}
