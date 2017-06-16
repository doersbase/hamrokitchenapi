<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRegisterKitchensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('register_kitchens', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('contact');
            $table->string('address');
            $table->string('path')->nullable();
            $table->string('email');
            $table->string('website')->nullable();
            $table->string('expirydate');
            $table->string('expirytime')->nullable();
            $table->integer('user_id')->unsigned();
            $table->timestamps();
        });
        Schema::table('register_kitchens', function($table) {
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('register_kitchens');
    }
}
