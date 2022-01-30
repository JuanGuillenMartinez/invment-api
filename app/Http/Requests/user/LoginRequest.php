<?php

namespace App\Http\Requests\user;

use App\Traits\FailedValidationRequest;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;

class LoginRequest extends FormRequest
{
    use FailedValidationRequest;
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email' => 'required|string|max:70',
            'password' => 'required|string|min:8'
        ];
    }

    public function failedValidation(Validator $validator) {
        $this->failedValidationApi($validator);
    }
}
