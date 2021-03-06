<?php

namespace App\Models;

use Database\Factories\CategoryFactory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $table = 'categories';
    protected $primaryKey = 'id_category';

    protected $fillable = array(
        'name'
    );

    public function subcategories()
    {
        return $this->hasMany(Subcategory::class, 'id_category');
    }

}
