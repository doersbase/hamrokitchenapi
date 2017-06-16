<?php

namespace App\Http\Controllers;
use App\Image;
use App\Gallery;
use Illuminate\Http\Request;

class GalleryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Gallery::all();
        $gallery=array();
        foreach ($data as $row) {
            $gallery['id']=$row->id;
            $gallery['title']=$row->title;
            $gallery['imageid']=$row->imageid;
            $gallery['path']=Image::find($gallery['imageid']);
            $gallery['kitchenid']=$row->kitchenid;

        }
        return response()->json($gallery);
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
            'image'=>'required |mimes:jpeg,jpg,png,gif|required',
            'kitchen'=>'required',
        ]);
         $image = $request->file('image');
        $fileName = $image->getClientOriginalName();
         date_default_timezone_set ('Asia/Kathmandu');
        $date = strtotime(date("Y-m-d H:i:s"));
        $newname = $date.'-'.$request['kitchen_id'].'-'.$fileName;
        $image->move('images/',$newname);
        $path = url('/').'/images'.'/'.$newname;
        $type= "gallery";
        $imageData = Image::create([
            'type'=>$type,
            'path'=>$path,
        ]);
        $imageId = $imageData->id;
        return Gallery::create([
            'title'=>$request['title'],
            'imageid'=>$imageId,
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
          $row =  Gallery::find($id);
            $data['id']=$row->id;
            $data['title']= $row->title;
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
        $data = Gallery::find($id);
        $this->validate($request,[
             'title'=>'string|required',
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
         $type= "gallery";
         $imageData = Image::create([
             'type'=>$type,
             'path'=>$path,
         ]);
         $imageId = $imageData->id;
         $data->title= $request['title'];
         $data->image_id=$imageId;
         $data->kitchenid=$request['kitchenid'];
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
       $data= Gallery::find($id);
       $data->delete();
       return response()->json("Deleted successfully!!");
    }
    public function kitchenGallery($id){
        $data =  Gallery::all();
        $filterGallery = $data->where('kitchenid',$id);
        return $filterGallery->all();
    }
    public function specificGallery($kid,$gid){
        $data = Gallery::all();
        $row = $data->where('kitchenid',$kid)
                    ->where('id',$gid);
        foreach ($row as $filterGallery) {
            $array['id']= $filterGallery->id;
            $array['title']=$filterGallery->title;
            $imageId = $filterGallery->imageid;
            $imagePath = Image::find($imageId);
            $array['imageurl']=$imagePath->path;
        }

        return $array;
    }
}
