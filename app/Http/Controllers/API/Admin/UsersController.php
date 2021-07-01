<?php

    namespace App\Http\Controllers\API\Admin;

    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\User;
    use Auth, DB, Validator, File;

    class UsersController extends Controller{
        /** users */
            public function users(Request $request){
                $data = User::select('id', 'name', 'phone', 'email', 'is_admin', 'status', 'device_id')->where(['status' => 'active'])->get();

                if($data->isNotEmpty())
                    return response()->json(['status' => 200, 'message' => 'Users found', 'data' => $data]);
                else
                    return response()->json(['status' => 201, 'message' => 'No users found']);
            }
        /** users */

        /** user */
            public function user(Request $request, $id=''){
                if($id == '')
                    return response()->json(['status' => 201, 'message' => 'Something went wrong']);

                $data = User::select('id', 'name', 'phone', 'email', 'is_admin', 'status', 'device_id')->where(['id' => $id])->first();

                if($data)
                    return response()->json(['status' => 200, 'message' => 'User found', 'data' => $data]);
                else
                    return response()->json(['status' => 201, 'message' => 'No user found']);                        
            }
        /** user */

        /** create */
            public function create(Request $request){
                $rules = [
                    'name' => 'required',
                    'email' => 'required|email|unique:users,email',
                    'phone' => 'required|numeric|unique:users,phone',
                    'password' => 'required|min:7'
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                $crud = [
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'password' => bcrypt($request->password),
                    'is_admin' => 'n',
                    'status' => 'active',
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s'),
                    'created_by' => auth('sanctum')->user()->id,
                    'updated_by' => auth('sanctum')->user()->id
                ];

                $last_id = User::insertGetId($crud);

                if($last_id)
                    return response()->json(['status' => 200, 'message' => 'User created successfully']);
                else
                    return response()->json(['status' => 201, 'message' => 'Faild to create user']);
            }
        /** create */

        /** update */
            public function update(Request $request){
                $rules = [
                    'id' => 'required',
                    'name' => 'required',
                    'email' => 'required|email|unique:users,email,'.$request->id,
                    'phone' => 'required|numeric|unique:users,phone,'.$request->id
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                $crud = [
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'updated_by' => auth('sanctum')->user()->id
                ];

                $update = User::where(['id' => $request->id])->update($crud);

                if($update)
                    return response()->json(['status' => 200, 'message' => 'User updated successfully']);
                else
                    return response()->json(['status' => 201, 'message' => 'Faild to update user']);
            }
        /** update */

        /** change-status */
            public function status_change(Request $request){
                $rules = [
                    'id' => 'required',
                    'status' => 'required'
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                $data = User::where(['id' => $request->id])->first();

                if(!empty($data)){
                    if($request->status == 'deleted'){
                        $update = User::where(['id' => $request->id])->delete();
                        if($update)
                            return response()->json(['code' => 200, 'message' =>'User deleted successfully']);
                        else
                            return response()->json(['code' => 201, 'message' =>'Faild to delete user']);
                    }else{
                        $update = User::where(['id' => $request->id])->update(['status' => $request->status, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth()->user()->id]);
                    }
                    
                    if($update)
                        return response()->json(['code' => 200 , 'message' =>'Status change successfully']);
                    else
                        return response()->json(['code' => 201 , 'message' =>'Faild to change status']);
                }else{
                    return response()->json(['code' => 201, 'message' =>'No user found']);
                }
            }
        /** change-status */
    }