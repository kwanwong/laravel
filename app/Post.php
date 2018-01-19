<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = [
        'title', 'summary', 'thumb', 'content', 'created_at', 'updated_at'
    ];

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('views', function(Builder $builder){
            $builder->where('views', '>=', 0);
        });
    }

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
