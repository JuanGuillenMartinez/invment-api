<?php

namespace App\Http\Requests;

use App\Traits\FailedValidationRequest;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;

class UserRequest extends FormRequest
{
    use FailedValidationRequest;
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
            'email' => 'email|required|string|max:70',
            'password' => 'required|string|min:8'
        ];
    }

    public function failedValidation(Validator $validator) {
        $this->failedValidationApi($validator);        
    }
}
