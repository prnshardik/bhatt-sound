<?php

    namespace App\Http\Controllers\API\Admin;

    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\ItemCategory;
    use App\Models\Item;
    use Auth, DB, Validator, File;

    class ItemsController extends Controller{
        /** items */
            public function items(Request $request){
                $image = URL('/uploads/items').'/';
                $qrcode = URL('/uploads/qrcodes/items').'/';

                $data = Item::select('items.id', 'items.name', 'items.description', 'items.status', 
                                        DB::Raw("CASE
                                            WHEN ".'items.image'." != '' THEN CONCAT("."'".$image."'".", ".'items.image'.")
                                            ELSE CONCAT("."'".$image."'".", 'default.png')
                                        END as image"),
                                        DB::Raw("CASE
                                            WHEN ".'items.qrcode'." != '' THEN CONCAT("."'".$qrcode."'".", ".'items.qrcode'.")
                                            ELSE ''
                                        END as qrcode"),
                                        'items_categories.id as category_id', 'items_categories.title as category_title'
                                    )
                                ->leftjoin('items_categories', 'items_categories.id', 'items.category_id')
                                ->get();

                if($data->isNotEmpty())
                    return response()->json(['status' => 200, 'message' => 'Data found', 'data' => $data]);
                else
                    return response()->json(['status' => 201, 'message' => 'No data found']);
            }
        /** items */

        /** item */
            public function item(Request $request, $id=''){
                if($id == '')
                    return response()->json(['status' => 201, 'message' => 'Something went wrong']);

                $image = URL('/uploads/items').'/';
                $qrcode = URL('/uploads/qrcodes/items').'/';

                $data = Item::select('items.id', 'items.name', 'items.description', 'items.status', 
                                        DB::Raw("CASE
                                            WHEN ".'items.image'." != '' THEN CONCAT("."'".$image."'".", ".'items.image'.")
                                            ELSE CONCAT("."'".$image."'".", 'default.png')
                                        END as image"),
                                        DB::Raw("CASE
                                            WHEN ".'items.qrcode'." != '' THEN CONCAT("."'".$qrcode."'".", ".'items.qrcode'.")
                                            ELSE ''
                                        END as qrcode"),
                                        'items_categories.id as category_id', 'items_categories.title as category_title'
                                    )
                                ->leftjoin('items_categories', 'items_categories.id', 'items.category_id')
                                ->where(['items.id' => $id])
                                ->first();

                if($data)
                    return response()->json(['status' => 200, 'message' => 'Data found', 'data' => $data]);
                else
                    return response()->json(['status' => 201, 'message' => 'No data found']);                        
            }
        /** item */

        /** insert */
            public function insert(Request $request){
                $rules = ['category_id' => 'required', 'name'];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                $file_to_uploads = public_path().'/uploads/items/';
                if (!File::exists($file_to_uploads))
                    File::makeDirectory($file_to_uploads, 0777, true, true);

                $qr_to_uploads = public_path().'/uploads/qrcodes/items/';
                if (!File::exists($qr_to_uploads))
                    File::makeDirectory($qr_to_uploads, 0777, true, true);
                
                $crud = [
                    'title' => ucfirst($request->title),
                    'description' => $request->description ?? NULL,
                    'status' => 'active',
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s'),
                    'created_by' => auth('sanctum')->user()->id,
                    'updated_by' => auth('sanctum')->user()->id
                ];

                $last_id = ItemCategory::insertGetId($crud);

                if($last_id)
                    return response()->json(['status' => 200, 'message' => 'Record added successfully']);
                else
                    return response()->json(['status' => 201, 'message' => 'Faild to add record']);
            }
        /** insert */

        /** update */
            public function update(Request $request){
                $rules = ['id' => 'required', 'title' => 'required'];

                $validator = Validator::make($request->all(), $rules);

                if($validator->fails())
                    return response()->json(['status' => 422, 'message' => $validator->errors()]);

                $crud = [
                    'title' => ucfirst($request->title),
                    'description' => $request->description ?? NULL,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'updated_by' => auth('sanctum')->user()->id
                ];

                $update = ItemCategory::where(['id' => $request->id])->update($crud);

                if($update)
                    return response()->json(['status' => 200, 'message' => 'Record updated successfully']);
                else
                    return response()->json(['status' => 201, 'message' => 'Faild to update record']);
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

                $data = ItemCategory::where(['id' => $request->id])->first();

                if(!empty($data)){
                    if($request->status == 'deleted')
                        $update = ItemCategory::where(['id' => $request->id])->delete();
                    else
                        $update = ItemCategory::where(['id' => $request->id])->update(['status' => $request->status, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth('sanctum')->user()->id]);
                    
                    if($update)
                        return response()->json(['code' => 200 , 'message' =>'Status change successfully']);
                    else
                        return response()->json(['code' => 201 , 'message' =>'Faild to change status']);
                }else{
                    return response()->json(['code' => 201, 'message' =>'No record found']);
                }
            }
        /** change-status */
    }