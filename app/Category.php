<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
    	'name',
    	'description',
    	'created_at'
    ];

    public function books()
    {
    	return $this->hasMany('App\Book');
    }
}
