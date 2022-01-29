<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Database\Factories\SubcategoryFactory;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Subcategory extends Model
{
    use HasFactory;

    protected $table = 'subcategories';
    protected $primaryKey = 'id_subcategory';

    protected $fillable = array(
        'id_category'
    );

    public function category() {
        return $this->hasOne(Category::class, 'id_category');
    }

    protected static function newFactory()
    {
        return SubcategoryFactory::new();
    }
}
