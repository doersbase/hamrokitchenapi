<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Dish extends Model
{
    protected $fillable = [
    	'title','description','imageid','kitchenid',
    ];
    protected $hidden = [
    	'created_at','updated_at',
    ];
}
