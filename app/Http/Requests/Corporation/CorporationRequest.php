<?php

namespace App\Http\Requests\Corporation;

use App\Traits\FailedValidationRequest;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;

class CorporationRequest extends FormRequest
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
            'name' => 'required|string|max:200',
            'rfc' => 'required|string|max:16',
        );
    }

    public function failedValidation(Validator $validator) {
        $this->failedValidationApi($validator);
    }
}
