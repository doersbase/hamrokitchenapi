<?php

namespace App\Http\Controllers\Auth;
use Illuminate\Http\Request;
use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(Request $request)
    {   
        $this->validate($request, [
            'name' => 'required|max:255',
            'email' => 'required|unique:users',
            'contact'=>'required',
            'password'=>'required',
            'role'=>'required',
        ]);
        // $image=$request->file('image');
        // $fileName=$image->getClientOriginalName();
        // $image->move('images/',$fileName);
        return User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'contact'=>$request['contact'],
            'password' => bcrypt($request['password']),
            'role'=>$request['role'],
        ]);
    }
    public function uploadprofile(Request $request,$id){
        $data = User::find($id);
        $this->validate($request,[
             'image' => 'required',
             'user_id'=> 'required',
        ]);
        date_default_timezone_set ('Asia/Kathmandu');
        $date = strtotime(date("Y-m-d H:i:s"));
        $image = $request->file('image');
        $user_id = $request->user_id;
        $fileName = $image->getClientOriginalName();
        $newName= $date.'-'.$user_id.'-'.$fileName;
        $image->move('images/',$newName);
        $data->image = url('/').''.'/images'.'/'.$newName;
        $data->save();
        return $data->image;
    }
}
