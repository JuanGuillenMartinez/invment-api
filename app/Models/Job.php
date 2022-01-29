<?php

namespace App\Models;

use App\Models\JobDetail;
use Database\Factories\JobFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Job extends Model
{
    
    use HasFactory;

    protected $table = 'Jobs';
    protected $primaryKey = 'id_job';

    protected $fillable = array(
        'id_job', 
        'id_job_detail',
        'description'
    );

    public function detail() {
        return $this->belongsTo(JobDetail::class, 'id_job_detail');
    }

    protected static function newFactory()
    {
        return JobFactory::new();
    }

}
