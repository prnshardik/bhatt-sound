<?php

    namespace App\Http\Controllers\API;

    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\Cart;
    use App\Models\Item;
    use App\Models\SubItem;
    use App\Models\User;
    use App\Models\Log;
    use Auth, DB, Validator, File ;

    class ProcessController extends Controller{
       /** Scan */
            public function scan(Request $request){
                $rules = ['id' => 'required'];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);
                
                $where = [
                            ['cart.id', '=', $request->id]
                ];

                $cart = Cart::select('id', 'party_name')->where($where)->first();

                if(empty($cart)){
                    return response()->json(['status' => 201, 'message' => 'May item not available or not exist in system, Please scan proper QR code']);
                }else{
                    $data = Cart::select('cart.id', 'cart.party_name', 'users.name AS user_name' ,'cart.party_address', 'cart.status')
                                        ->leftJoin('users' ,'cart.user_id' ,'users.id')
                                        ->where($where)
                                        ->first();

                    if(!empty($data) && $data->status == 'assigned'){
                        $message = 'Item assigned to '.$data->user_name;
                    }elseif(!empty($data) && $data->status == 'dispatch'){
                        $message = 'Item dispatch to '.$data->party_name;
                    }elseif(!empty($data) && $data->status == 'deliver'){
                        $message = 'Item deliver to '.$data->party_name;
                    }elseif(!empty($data) && $data->status == 'return'){
                        $message = 'Item renturn from' .$data->party_name;
                    }else{
                        $message = 'Item available at offie';
                    }

                    return response()->json(['status' => 200, 'message' => $message, 'data' => $data]);
                }
            } 
       /** Scan */ 

       /** dispatch */
            public function pickup(Request $request){
                $rules = [
                    'cart_id' => 'required',
                    'user_id' => 'required'
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                $where = [
                    ['cart.id' ,'=' ,$request->cart_id],
                    ['cart.user_id' ,'=' ,$request->user_id],
                    ['cart.status' ,'!=' ,'reach']
                ];

                $cart = Cart::select('id')->where($where)->first();
                
                if(empty($cart)){
                    return response()->json(['status' => 201, 'message' => 'May item not available or not exist in system, Please scan proper QR code']);
                }else{   
                    $crud = [
                        'status' => 'dispatch',
                        'updated_at' => date('Y-m-d H:i:s'),
                        'updated_by' => auth('sanctum')->user()->id
                    ];

                    DB::beginTransaction();
                    try {
                        $last_id = Cart::where(['id' => $request->cart_id])->update($crud);

                        if($last_id){
                            $log_crud = [
                                'item_id' => $request->cart_id,
                                'type' => 'order',
                                'item_type' => 'cart',
                                'status' => 'dispatch',
                                'created_at' => date('Y-m-d H:i:s'),
                                'created_by' => auth('sanctum')->user()->id,
                                'updated_at' => date('Y-m-d H:i:s'),
                                'updated_by' => auth('sanctum')->user()->id
                            ];

                            $log_id = Log::insertGetId($log_crud);
                            
                            if($log_id){
                                DB::commit();
                                return response()->json(['status' => 200, 'message' => 'Cart dispatch successfully']);
                            }else{
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Faild to dispatch cart, please try again']);
                            }
                        }else{
                            DB::rollback();
                            return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again 1']);
                        }
                    }catch (\Exception $e) {
                        DB::rollback();
                        return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again 2']);
                    }
                }
            }
        /** dispatch */ 

        /** deliver */
            public function deliver(Request $request){
                $rules = [
                    'cart_id' => 'required',
                    'user_id' => 'required'
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                $where = [
                    ['cart.id' ,'=' ,$request->cart_id],
                    ['cart.user_id' ,'=' ,$request->user_id],
                    ['cart.status' ,'!=' ,'reach']
                ];

                $cart = Cart::select('id')->where($where)->first();
                
                if(empty($cart)){
                    return response()->json(['status' => 201, 'message' => 'May item not available or not exist in system, Please scan proper QR code']);
                }else{   
                    $crud = [
                        'status' => 'deliver',
                        'updated_at' => date('Y-m-d H:i:s'),
                        'updated_by' => auth('sanctum')->user()->id
                    ];

                    DB::beginTransaction();
                    try {
                        $last_id = Cart::where(['id' => $request->cart_id])->update($crud);

                        if($last_id){
                            $log_crud = [
                                'item_id' => $request->cart_id,
                                'type' => 'order',
                                'item_type' => 'cart',
                                'status' => 'deliver',
                                'created_at' => date('Y-m-d H:i:s'),
                                'created_by' => auth('sanctum')->user()->id,
                                'updated_at' => date('Y-m-d H:i:s'),
                                'updated_by' => auth('sanctum')->user()->id
                            ];
                            
                            $log_id = Log::insertGetId($log_crud);
                            
                            if($log_id){
                                DB::commit();
                                return response()->json(['status' => 200, 'message' => 'Cart deliver successfully']);
                            }else{
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Faild to deliver cart, please try again']);
                            }
                        }else{
                            DB::rollback();
                            return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again 1']);
                        }
                    }catch (\Exception $e) {
                        DB::rollback();
                        return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again 2']);
                    }
                }
            }
        /** deliver */

        /** return */
            public function return(Request $request){
                $rules = [
                    'cart_id' => 'required',
                    'user_id' => 'required'
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                $where = [
                    ['cart.id' ,'=' ,$request->cart_id],
                    ['cart.user_id' ,'=' ,$request->user_id],
                    ['cart.status' ,'!=' ,'reach']
                ];

                $cart = Cart::select('id')->where($where)->first();
                
                if(empty($cart)){
                    return response()->json(['status' => 201, 'message' => 'May item not available or not exist in system, Please scan proper QR code']);
                }else{   
                    $crud = [
                        'status' => 'return',
                        'updated_at' => date('Y-m-d H:i:s'),
                        'updated_by' => auth('sanctum')->user()->id
                    ];

                    DB::beginTransaction();
                    try {
                        $last_id = Cart::where(['id' => $request->cart_id])->update($crud);

                        if($last_id){
                            // dd('hi');
                            $log_crud = [
                                'item_id' => $request->cart_id,
                                'item_type' => 'cart',
                                'type' => 'order',
                                'status' => 'return',
                                'created_at' => date('Y-m-d H:i:s'),
                                'created_by' => auth('sanctum')->user()->id,
                                'updated_at' => date('Y-m-d H:i:s'),
                                'updated_by' => auth('sanctum')->user()->id
                            ];
                                
                            $log_id = Log::insertGetId($log_crud);

                            if($log_id){
                                DB::commit();
                                return response()->json(['status' => 200, 'message' => 'Cart return successfully']);
                            }else{
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Faild to return cart, please try again']);
                            }
                        }else{
                            DB::rollback();
                            return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again 1']);
                        }
                    }catch (\Exception $e) {
                        DB::rollback();
                        return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again 2']);
                    }
                }
            }
        /** return */ 

        /** reach */
            public function reach(Request $request){
                $rules = [
                    'cart_id' => 'required',
                    'user_id' => 'required'
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);
                
                $where = [
                    ['cart.id' ,'=' ,$request->cart_id],
                    ['cart.user_id' ,'=' ,$request->user_id],
                    ['cart.status' ,'!=' ,'reach']
                ];

                $cart = Cart::select('id')->where($where)->first();
                
                if(empty($cart)){
                    return response()->json(['status' => 201, 'message' => 'May item not available or not exist in system, Please scan proper QR code']);
                }else{   
                    $crud = [
                        'status' => 'reach',
                        'updated_at' => date('Y-m-d H:i:s'),
                        'updated_by' => auth('sanctum')->user()->id
                    ];

                    DB::beginTransaction();
                    try {
                        $last_id = Cart::where(['id' => $request->cart_id])->update($crud);

                        if($last_id){

                            $log_crud = [
                                'item_id' => $request->cart_id,
                                'item_type' => 'cart',
                                'type' => 'order',
                                'status' => 'reach',
                                'created_at' => date('Y-m-d H:i:s'),
                                'created_by' => auth('sanctum')->user()->id,
                                'updated_at' => date('Y-m-d H:i:s'),
                                'updated_by' => auth('sanctum')->user()->id
                            ];

                            $log_id = Log::insertGetId($log_crud);
                            
                            if($log_id){
                                DB::commit();
                                return response()->json(['status' => 200, 'message' => 'Cart reach successfully']);
                            }else{
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Faild to reach cart, please try again']);
                            }
                        }else{
                            DB::rollback();
                            return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again 1']);
                        }
                    }catch (\Exception $e) {
                        DB::rollback();
                        return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again 2']);
                    }
                }
            }
        /** reach */


        /** Maintenance */
            public function maintenance(Request $request){
                $rules = [
                    'item_id' => 'required',
                    'type' => 'required'
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                if($request->type == 'item'){                     
                    $item = Item::select('status')->where('id', $request->item_id)->first();

                    if($item->status == 'repairing'){
                        $crud = [
                            'status' => 'active',
                            'updated_at' => date('Y-m-d H:i:s'),
                            'updated_by' => auth('sanctum')->user()->id
                        ];

                        DB::beginTransaction();
                        try {
                            $data = Item::where(['id' => $request->item_id])->update($crud);
                        
                            if($data){
                                $log_crud = [
                                    'item_id' => $request->item_id,
                                    'item_type' => $request->type,
                                    'type' => 'repair',
                                    'status' => 'reach'
                                ];

                                $log = Log::insertGetId($log_crud);
                                
                                if($log){
                                    DB::commit();
                                    return response()->json(['status' => 200, 'message' => 'Record status change successfully']);
                                }else{
                                    DB::rollback();
                                    return response()->json(['status' => 201, 'message' => 'Faild to create log']);
                                }
                            }else{                   
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Faild to change record status']);
                            }
                        }catch (\Exception $e) {
                            DB::rollback();
                            return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again']);
                        }
                    }else{
                        $crud = [
                            'status' => 'repairing',
                            'updated_at' => date('Y-m-d H:i:s'),
                            'updated_by' => auth('sanctum')->user()->id
                        ];
                        
                        DB::beginTransaction();
                        try {
                            $data = Item::where(['id' => $request->item_id])->update($crud);
                        
                            if($data){
                                $log_crud = [
                                    'item_id' => $request->item_id,
                                    'item_type' => $request->type,
                                    'type' => 'repair',
                                    'status' => 'deliver'
                                ];

                                $log = Log::insertGetId($log_crud);
                                
                                if($log){
                                    DB::commit();
                                    return response()->json(['status' => 200, 'message' => 'Record status change successfully']);
                                }else{
                                    DB::rollback();
                                    return response()->json(['status' => 201, 'message' => 'Faild to create log']);
                                }
                            }else{                   
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Faild to change record status']);
                            }
                        }catch (\Exception $e) {
                            DB::rollback();
                            return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again']);
                        }
                    }
                }else{
                    $sub_item = SubItem::select('status')->where('id' ,$request->item_id)->first();
                    
                    if($sub_item->status == 'repairing'){
                        $crud = [
                            'status' => 'active',
                            'updated_at' => date('Y-m-d H:i:s'),
                            'updated_by' => auth('sanctum')->user()->id
                        ];
                        
                        DB::beginTransaction();
                        try {
                            $data = SubItem::where(['id' => $request->item_id])->update($crud);
                        
                            if($data){
                                $log_crud = [
                                    'item_id' => $request->item_id,
                                    'item_type' => $request->type,
                                    'type' => 'repair',
                                    'status' => 'reach'
                                ];

                                $log = Log::insertGetId($log_crud);
                                
                                if($log){
                                    DB::commit();
                                    return response()->json(['status' => 200, 'message' => 'Record status change successfully']);
                                }else{
                                    DB::rollback();
                                    return response()->json(['status' => 201, 'message' => 'Faild to create log']);
                                }
                            }else{                   
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Faild to change record status']);
                            }
                        }catch (\Exception $e) {
                            DB::rollback();
                            return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again']);
                        }
                    }else{
                        $crud = [
                            'status' => 'repairing',
                            'updated_at' => date('Y-m-d H:i:s'),
                            'updated_by' => auth('sanctum')->user()->id
                        ];
                        
                        DB::beginTransaction();
                        try {
                            $data = SubItem::where(['id' => $request->item_id])->update($crud);
                        
                            if($data){
                                $log_crud = [
                                    'item_id' => $request->item_id,
                                    'item_type' => $request->type,
                                    'type' => 'repair',
                                    'status' => 'deliver'
                                ];

                                $log = Log::insertGetId($log_crud);
                                
                                if($log){
                                    DB::commit();
                                    return response()->json(['status' => 200, 'message' => 'Record status change successfully']);
                                }else{
                                    DB::rollback();
                                    return response()->json(['status' => 201, 'message' => 'Faild to create log']);
                                }
                            }else{                   
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Faild to change record status']);
                            }
                        }catch (\Exception $e) {
                            DB::rollback();
                            return response()->json(['status' => 201, 'message' => 'Something went wrong, please try again']);
                        }
                    }
                }
            }
        /** Maintenance */   
    }
