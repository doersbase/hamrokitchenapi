<?php

namespace App\Http\Controllers;
use App\Dish;
Use App\Image;
use Illuminate\Http\Request;

class DishController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Dish::all();
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
            'kitchen_id'=>'integer|required',
            'image'=>'required |mimes:jpeg,jpg,png,gif|required'
        ]);
        $image = $request->file('image');
        $fileName = $image->getClientOriginalName();
         date_default_timezone_set ('Asia/Kathmandu');
        $date = strtotime(date("Y-m-d H:i:s"));
        $newname = $date.'-'.$request['kitchen_id'].'-'.$fileName;
        $image->move('images/',$newname);
        $path = url('/').'/images'.'/'.$newname;
        $type= "dish";
        $imageData = Image::create([
            'type'=>$type,
            'path'=>$path,
        ]);
        $imageId = $imageData->id;
        return Dish::create([
            'title'=>$request['title'],
            'description'=>$request['description'],
            'imageid'=>$imageId,
            'kitchenid'=>$request['kitchen_id'],
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
        return Dish::find($id);
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
        $data = Dish::find($id);
        $this->validate($request,[
            'title'=>'string|required',
            'description'=>'required',
            'kitchen_id'=>'integer|required',
            'image'=>'required |mimes:jpeg,jpg,png,gif|required'
        ]);
        $image = $request->file('image');
        $fileName = $image->getClientOriginalName();
         date_default_timezone_set ('Asia/Kathmandu');
        $date = strtotime(date("Y-m-d H:i:s"));
        $newname = $date.'-'.$request['kitchen_id'].'-'.$fileName;
        $image->move('images/',$newname);
        $path = url('/').'/images'.'/'.$newname;
        $type= "dish";
        $imageData = Image::create([
            'type'=>$type,
            'path'=>$path,
        ]);
        $imageId = $imageData->id;
        $data->title=$request['title'];
        $data->description= $request['description'];
        $data->imageid=$imageId;
        $data->kitchenid=$request['kitchen_id'];
        $data->save();
        return response()->json([$data->id,$data->title,$data->description,$data->imageid,$data->kitchen_id,"updated sucessfully!!"]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Dish::find($id);
        $data->delete();
        return response()->json("Record Deleted Successfully!!");
    }
    public function kitchenDish($id){
        $data =  Dish::all();
        $filterKitchen = $data->where('kitchenid',$id);
        return $filterKitchen->all();
    }
     public function specificDish($kid,$gid){
        $data = Dish::all();
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
