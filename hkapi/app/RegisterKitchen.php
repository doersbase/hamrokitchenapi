<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RegisterKitchen extends Model
{
    protected $fillable = [
      'name','contact','address','path','email','website','expirydate','expirytime','user_id',
    ];
    protected $hidden = [
    	'path','website','expirytime','user_id','created_at','updated_at',
    ];
}
