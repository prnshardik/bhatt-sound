<?php

    namespace App\Http\Controllers\API;

    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\Cart;
    use App\Models\CartUser;
    use App\Models\CartInventory;
    use App\Models\CartSubInventory;
    use App\Models\Item;
    use App\Models\SubItem;
    use App\Models\User;
    use App\Models\Log;
    use Auth, DB, Validator, File ;

    class ProcessController extends Controller{
        /** scan */
            public function scan(Request $request){
                $rules = ['id' => 'required'];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                $data = _qrcode($request->id);

                if($data)
                    return response()->json(['status' => 200, 'message' => 'Record found']);
                else
                    return response()->json(['status' => 201, 'message' => 'No record found']);
            }
        /** scan */

        /** process */
            public function process(Request $request){
                $rules = ['id' => 'required', 'stage' => 'required'];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                if($request->stage == 'dispatch'){
                    $update = Cart::where(['id' => $request->id])->update(['status' => $request->stage, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth('sanctum')->user()->id]);

                    if($update)
                        return response()->json(['status' => 200, 'message' => 'Record status changed successfully']);
                    else
                        return response()->json(['status' => 201, 'message' => 'Something went wrong']);
                }elseif($request->stage == 'deliver'){
                    $update = Cart::where(['id' => $request->id])->update(['status' => $request->stage, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth('sanctum')->user()->id]);

                    if($update)
                        return response()->json(['status' => 200, 'message' => 'Record status changed successfully']);
                    else
                        return response()->json(['status' => 201, 'message' => 'Something went wrong']);
                }elseif($request->stage == 'return'){
                    $update = Cart::where(['id' => $request->id])->update(['status' => $request->stage, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth('sanctum')->user()->id]);

                    if($update)
                        return response()->json(['status' => 200, 'message' => 'Record status changed successfully']);
                    else
                        return response()->json(['status' => 201, 'message' => 'Something went wrong']);
                }elseif($request->stage == 'reach'){
                    DB::beginTransaction();
                    try {
                        $update = Cart::where(['id' => $request->id])->update(['status' => $request->stage, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth('sanctum')->user()->id]);

                        if($update){
                            $update_users = CartUser::where(['cart_id' => $request->id])->update(['status' => 'inactive', 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth('sanctum')->user()->id]);

                            if(!$update_users){
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Something went wrong']);
                            }

                            $update_inventories = CartInventory::where(['cart_id' => $request->id])->update(['status' => 'inactive', 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth('sanctum')->user()->id]);

                            if(!$update_inventories){
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Something went wrong']);
                            }

                            $update_sub_inventories = CartSubInventory::where(['cart_id' => $request->id])->update(['status' => 'inactive', 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth('sanctum')->user()->id]);

                            if(!$update_sub_inventories){
                                DB::rollback();
                                return response()->json(['status' => 201, 'message' => 'Something went wrong']);
                            }

                            DB::commit();
                            return response()->json(['status' => 200, 'message' => 'Record status changed successfully']);
                        }else{
                            DB::rollback();
                            return response()->json(['status' => 201, 'message' => 'Something went wrong']);
                        }
                    } catch (\Exception $e) {
                        DB::rollback();
                        return response()->json(['status' => 201, 'message' => 'Something went wrong']);
                    }
                }else{
                    return response()->json(['status' => 201, 'message' => 'Something went wrong']);
                }
            }
        /** process */
    }
