<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Requests\UserRequest;
use App\Http\Controllers\Controller;
use App\Http\Requests\user\LoginRequest;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(UserRequest $request)
    {
        $data = array(
            'name' => $request->name, 
            'password' => Hash::make($request->password), 
            'email' => $request->email
        );
        $user = new User($data);
        if($user->save()) {
            $response = array(
                'token' => $user->createToken('auth')->plainTextToken,
                'name' => $user->name
            );
            return $this->sendResponse($response, 'Usuario registrado correctamente');
        }
        return $this->sendError('Hubo un error al registrar');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function login(LoginRequest $request)
    {
        $credentials = array(
            'email' => $request->email, 
            'password' => $request->password
        );
        if(Auth::attempt($credentials)) {
            $authUser = Auth::user();
            $response = array(
                'token' => $authUser->createToken('auth')->plainTextToken,
                'user' => $authUser
            );
            return $this->sendResponse($response, 'Inicio de sesión correctamente');
        }
        return $this->sendError('Credenciales incorrectas');
    }

    public function show(Request $request) {
        return $request->user();
    }
}
