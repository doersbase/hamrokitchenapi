<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    protected $fillable = [
    	'user_id','kitchen_id','rating','review',
    ];
    protected $hidden  = [

    ];
}
