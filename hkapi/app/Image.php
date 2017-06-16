<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    protected $fillable = [
    	'type','path',
    ];
    protected $hidden = [
         'created_at','updated_at',
    ];
}
