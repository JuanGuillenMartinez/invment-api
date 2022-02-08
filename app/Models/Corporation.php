<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Corporation extends Model
{
    use HasFactory;

    protected $table = 'corporations';
    protected $primaryKey = 'id_corporation';

    protected $fillable = array(
        'name',
        'rfc',
        'created_at',
        'updated_at',
    );

    // public function products() {
    //     return $this->hasMany(Product::class, 'id_corporation');
    // }

}
