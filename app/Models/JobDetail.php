<?php

namespace App\Models;

use Database\Factories\JobDetailFactory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JobDetail extends Model
{
    use HasFactory;

    protected $table = 'jobs_detail';
    protected $primaryKey = 'id_job_detail';

    protected $fillable = array(
        'id_job_detail',
        'base_salary',
        'bonus'
    );

    public function job()
    {
        return $this->hasOne(Job::class, 'id_job_detail');
    }

    protected static function newFactory()
    {
        return JobDetailFactory::new();
    }
    
}
