<?php

    namespace App\Http\Controllers\API;

    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\Cart;
    use App\Models\User;
    use Auth, DB, Validator, File ;

    class MaintenanceController extends Controller{
        /** Index */
            public function index(Request $request){
                $rules = [
                    'user_id' => 'required',
                    'item_id' => 'required',
                    'type' => 'required'
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);
                if($request->type == 'item'){
                    $data = DB::table('items')->update('status','repairing')->where('id' , $request->item_id);
                    
                    if($data){
                        return response()->json(['status' => 200, 'message' => 'Record status change successfully']);
                    }else{                   
                        return response()->json(['status' => 201, 'message' => 'Faild to change record status']);
                    }
                }else{
                    $data = DB::table('sub_items')->update('status','repairing')->where('id' , $request->item_id);
                    
                    if($data){
                        return response()->json(['status' => 200, 'message' => 'Record status change successfully']);
                    }else{                   
                        return response()->json(['status' => 201, 'message' => 'Faild to change record status']);
                    }
                }

                

            }
        /** Index */   
    }
