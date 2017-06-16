<?php

namespace App\Http\Controllers;
Use App\Events;
Use App\Image;
use Illuminate\Http\Request;

class EventsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $eventData =  Events::all();
        foreach ($eventData as $row) {
            $data['id']=$row->id;
            $data['title']= $row->title;
            $data['description']= $row->description;
            $data['imageid']=$row->image_id;
            $data['path'] = Image::find($data['imageid']);
            $data['kitchenid']=$row->kitchenid;
        }
        return response()->json($data);

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
            'title'=>'string|required',
            'description'=>'required',
            'image'=>'required |mimes:jpeg,jpg,png,gif|required',
            'kitchen'=>'required'
        ]);
         $image = $request->file('image');
        $fileName = $image->getClientOriginalName();
         date_default_timezone_set ('Asia/Kathmandu');
        $date = strtotime(date("Y-m-d H:i:s"));
        $newname = $date.'-'.$request['kitchen_id'].'-'.$fileName;
        $image->move('images/',$newname);
        $path = url('/').'/images'.'/'.$newname;
        $type= "event";
        $imageData = Image::create([
            'type'=>$type,
            'path'=>$path,
        ]);
        $imageId = $imageData->id;
        return Events::create([
            'title'=>$request['title'],
            'description'=>$request['description'],
            'image_id'=>$imageId,
            'kitchenid'=>$request['kitchen'],
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
        $row =  Events::find($id);
            $data['id']=$row->id;
            $data['title']= $row->title;
            $data['description']= $row->description;
            $data['imageid']=$row->image_id;
            $data['path'] = Image::find($data['imageid']);
            $data['kitchenid']=$row->kitchenid;
        return response()->json($data);
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
       $data = Events::find($id);
       $this->validate($request,[
            'title'=>'string|required',
            'description'=>'required',
            'image'=>'required |mimes:jpeg,jpg,png,gif|required',
            'kitchen'=>'required'
        ]);
         $image = $request->file('image');
        $fileName = $image->getClientOriginalName();
         date_default_timezone_set ('Asia/Kathmandu');
        $date = strtotime(date("Y-m-d H:i:s"));
        $newname = $date.'-'.$request['kitchen_id'].'-'.$fileName;
        $image->move('images/',$newname);
        $path = url('/').'/images'.'/'.$newname;
        $type= "event";
        $imageData = Image::create([
            'type'=>$type,
            'path'=>$path,
        ]);
        $imageId = $imageData->id;
        $data->title= $request['title'];
        $data->description = $request['description'];
        $data->image_id=$imageId;
        $data->kitchenid=$request['kitchen_id'];
        $data->save();
        return respone()->json("updated successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       $data= Events::find($id);
       $data->delete();
       return response()->json("Deleted successfully!!");
    }
    public function kitchenEvents($id){
        $data =  Events::all();
        $filterKitchen = $data->where('kitchenid',$id);
        return $filterKitchen->all();
    }
    public function specificEvent($kid,$gid){
        $data = Events::all();
        $row = $data->where('kitchenid',$kid)
                    ->where('id',$gid);
        foreach ($row as $filterGallery) {
            $array['id']= $filterGallery->id;
            $array['title']=$filterGallery->title;
            $imageId = $filterGallery->image_id;
            $imagePath = Image::find($imageId);
            $array['imageurl']=$imagePath->path;
        }
        return $array;
    }
}
