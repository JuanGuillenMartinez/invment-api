<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    // Los resources son utilizados para desacoplar los atributos de los modelos de la información retornada por la API
    
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $request->id,
            'name' => $request->name,
            'email' => $request->email,
            'email_verified_at' => $request->email_verified_at,
            'password' => $request->password,
            'remember_token' => $request->remember_token,
            'created_at' => $request->created_at,
            'updated_at' => $request->updated_at,
        ];
    }
}
