<?php

namespace App\Http\Controllers;
use App\RegisterKitchen;
use Illuminate\Http\Request;

class KitchenRegisterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return RegisterKitchen::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name'=> 'string|required',
            'contact'=>'numeric|min:10',
            'address'=>'string|required',
            'email'=>'string|email|required',
            'expirydate'=>'required',
            'user_id'=>'required',
        ]);
        $expirytime = strtotime($request['expirydate']);
        return RegisterKitchen::create([
            'user_id'=>$request['user_id'],
            'name'=>$request['name'],
            'contact'=>$request['contact'],
            'address'=>$request['address'],
            'email'=>$request['email'],
            'website'=>$request['website'],
            'path'=>$request['path'],
            'expirytime'=>$expirytime,
            'expirydate'=>$request['expirydate'],
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
