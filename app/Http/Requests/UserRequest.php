<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Traits\FailedValidationRequest;

class UserRequest extends FormRequest
{
    // Las clases de Request se utilizan para validar la data recibida por la api antes de ingresar al controlador

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|string|max:200',
            'email' => 'required|string|max:70',
            'password' => 'required|string|min:8'
        ];
    }
}
