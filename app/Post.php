<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = [
        'title', 'summary', 'thumb', 'content', 'created_at', 'updated_at'
    ];

    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->diffForHumans();
    }

    public function setCreatedAtAttribute($value)
    {
        $this->attributes['created_at'] = !empty($value) ? $value : time();
    }

    public function setUpdatedAtAttribute($value)
    {
        $this->attributes['updated_at'] = !empty($value) ? $value : time();
    }
}
