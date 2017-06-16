<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Events extends Model
{
   protected $fillable = [
   		'title','description','image_id','kitchenid',
   ];
   protected $hidden = [
   		'created_at','updated_at',
   ];
}
