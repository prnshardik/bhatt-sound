<?php

    namespace App\Http\Controllers\API;

    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\Cart;
    use App\Models\User;
    use Auth, DB, Validator, File ;

    class DashboardController extends Controller{
        /** Index */
            public function index(Request $request){
                $rules = [
                    'user_id' => 'required'
                ];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);
                DB::enableQueryLog();
               $data = DB::table('cart')
                                ->select('cart.id' ,'cart.user_id' ,'cart.party_name' ,'cart.party_address'
                                )

                                ->leftJoin('cart_users as cu' , 'cart.id' ,'cu.cart_id')
                                ->whereRaw("(`cart`.`user_id` = $request->user_id AND `cart`.`status` != 'reach') OR (`cu`.`user_id` = $request->user_id AND `cart`.`status` != 'reach') ")
                                ->first();
                // dd(DB::getQueryLog());
                if($data){
                    return response()->json(['status' => 200, 'message' => 'Record found' , $data]);
                }else{                   
                    return response()->json(['status' => 201, 'message' => 'No record found']);
                }

            }
        /** Index */   
    }
