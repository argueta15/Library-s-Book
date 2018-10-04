<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $fillable = [
    	'name',
    	'author',
    	'category_id',
    	'published_date',
    	'status',
    	'created_at'
    ];

    public function users()
    {
        return $this->belongsToMany('App\User');
    }
    public function categories()
    {
        return $this->hasOne('App\Category');
    }
}
