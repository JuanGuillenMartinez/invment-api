<?php

namespace App\Http\Requests;

use App\Traits\FailedValidationRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;

class CategoryRequest extends FormRequest
{
    use FailedValidationRequest;
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return array(
            'name' => 'required|string|max:200'
        );
    }

    public function failedValidation(Validator $validator) {
        $this->failedValidationApi($validator);
    }
}