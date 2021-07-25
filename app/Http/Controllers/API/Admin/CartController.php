<?php

    namespace App\Http\Controllers\API\Admin;

    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\User;
    use App\Models\Cart;
    use App\Models\CartUser;
    use App\Models\CartInventory;
    use App\Models\CartSubInventory;
    use App\Models\ItemInventory;
    use App\Models\ItemInventoryItem;
    use App\Models\SubItemInventory;
    use App\Models\SubItemInventoryItem;
    use Auth, DB, Validator, File;

    class CartController extends Controller{
        /** index */
            public function index(Request $request){
                $data = Cart::select('cart.id', 'u.name as user_name', 'cart.party_name', 'cart.party_address', 'cart.status')
                                    ->leftjoin('users as u', 'u.id', 'cart.user_id')
                                    ->where('cart.status', '!=', 'reach')
                                    ->orderBy('cart.id','desc')
                                    ->get();

                if($data->isNotEmpty()){
                    foreach($data as $row){
                        $cart_item = CartInventory::select(DB::Raw("COUNT(".'id'.") as count"))->where(['cart_id' => $row->id])->first();
                        $row->items_count = $cart_item->count;
                    }
                }

                if($data->isNotEmpty()){
                    foreach($data as $row){
                        $cart_sub_item = CartSubInventory::select(DB::Raw("COUNT(".'id'.") as count"))->where(['cart_id' => $row->id])->first();
                        $row->sub_items_count = $cart_sub_item->count;
                    }
                }

                if($data->isNotEmpty())
                    return response()->json(['status' => 200, 'message' => 'Data found', 'data' => $data]);
                else
                    return response()->json(['status' => 201, 'message' => 'No data found']);
            }
        /** index */

        /** single */
            public function single(Request $request, $id=''){
                if($id == '')
                    return response()->json(['status' => 201, 'message' => 'Something went wrong']);

                $data = Cart::select('cart.id', 'cart.user_id', 'cart.party_name', 'cart.party_address', 'u.name as user_name')
                            ->leftjoin('users as u', 'u.id', 'cart.user_id')
                            ->where(['cart.id' => $id])
                            ->first();

                if($data){
                    $sub_users = CartUser::select('u.name as name', 'u.id as user_id')
                                            ->leftjoin('users as u', 'u.id', 'cart_users.user_id')
                                            ->where(['cart_users.cart_id' => $data->id])
                                            ->get();

                    if($sub_users->isNotEmpty())
                        $data->sub_users = $sub_users;
                    else
                        $data->sub_users = collect();

                    $inventories = CartInventory::select('i.id', 'i.title')
                                                    ->leftjoin('items_inventories as i', 'i.id', 'cart_inventories.inventory_id')
                                                    ->where(['cart_inventories.cart_id' => $data->id])
                                                    ->get();

                    if($inventories->isNotEmpty()){
                        foreach($inventories as $row){
                            $inventories_items = ItemInventoryItem::where(['item_inventory_id' => $row->id])->count();
                            $row->item = $inventories_items;
                        }
                        $data->inventories = $inventories;
                    }else{
                        $data->inventories = collect();
                    }

                    $sub_inventories = CartSubInventory::select('i.id', 'i.title')
                                                            ->leftjoin('sub_items_inventories as i', 'i.id', 'cart_sub_inventories.sub_inventory_id')
                                                            ->where(['cart_sub_inventories.cart_id' => $data->id])
                                                            ->get();

                    if($sub_inventories->isNotEmpty()){
                        foreach($sub_inventories as $row){
                            $sub_inventories_items = SubItemInventoryItem::where(['sub_item_inventory_id' => $row->id])->count();
                            $row->item = $sub_inventories_items;
                        }
                        $data->sub_inventories = $sub_inventories;
                    }else{
                        $data->sub_inventories = collect();
                    }

                    return response()->json(['status' => 200, 'message' => 'Data found', 'data' => $data]);
                }else{
                    return response()->json(['status' => 201, 'message' => 'No data found']);                        
                }
            }
        /** single */

        /** insert */
        /** insert */

        /** update */
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

                $data = Cart::where(['id' => $request->id])->first();

                if(!empty($data)){
                    $delete = Cart::where(['id' => $request->id])->delete();
                    
                    if($delete){
                        return response()->json(['code' => 200, 'message' =>'Record deleted successfully']);
                    }else{
                        return response()->json(['code' => 201, 'message' =>'Faild to delete record']);
                    }
                }else{
                    return response()->json(['code' => 201, 'message' =>'Faild to delete record']);
                }
            }
        /** change-status */

        /** users */
            public function users(Request $request){
                $cart_id = $request->cart_id ?? null;
                $user_id = '';
                
                if($cart_id != null){
                    $cart = Cart::select('user_id')->where(['id' => $cart_id])->first();

                    if(!empty($cart))
                        $user_id = $cart->user_id;
                }

                $data = User::select('id', 'name')
                                ->where(['status' => 'active', 'is_admin' => 'n'])
                                ->whereNotIn('id', function($query) use ($cart_id) {
                                    $query->select('user_id')->from('cart')->where('status', '!=', 'reach')->where('id', '!=', $cart_id); 
                                })
                                ->whereNotIn('id', function($query) use ($cart_id) {
                                    $query->select('user_id')->from('cart_users')->where(['status' => 'active'])->where('cart_id', '!=', $cart_id); 
                                })
                                ->get();

                if($data->isNotEmpty()){
                    foreach($data as $row){
                        $row->selected = false;
                        
                        if(!empty($user_id) && $row->id == $user_id)
                            $row->selected = true;  
                    }

                    return response()->json(['status' => 200, 'message' => 'Data found', 'data' => $data]);
                }else{
                    return response()->json(['status' => 201, 'message' => 'No data found']);
                }
            }
        /** users */

        /** sub-users */
            public function sub_users(Request $request){
                $cart_id = $request->cart_id ?? NULL;
                $users_id = [];

                if(!empty($cart_id)){
                    $cartUsers = CartUser::select('user_id')->where(['cart_id' => $cart_id])->get();

                    if($cartUsers->isNotEmpty()){
                        foreach($cartUsers as $row){
                            $users_id[] = $row->user_id;
                        }
                    }
                }
                
                $data = User::select('id', 'name')
                            ->where(['status' => 'active', 'is_admin' => 'n'])
                            ->where('id', '!=', $request->id)
                            ->whereNotIn('id', function($query) use ($cart_id) {
                                $query->select('user_id')->from('cart')->where('status', '!=', 'reach')->where('id', '!=', $cart_id); 
                            })
                            ->whereNotIn('id', function($query) use ($cart_id) {
                                $query->select('user_id')->from('cart_users')->where(['status' => 'active'])->where('cart_id', '!=', $cart_id); 
                            })
                            ->get();

                if($data->isNotEmpty()){
                    foreach($data as $row){
                        $row->selected = false;
                        if(!empty($users_id) && in_array($row->id, $users_id)) 
                            $row->selected = true;
                    }

                    return response()->json(['status' => 200, 'message' => 'Data found', 'data' => $data]);
                }else{
                    return response()->json(['status' => 201, 'message' => 'No data found']);
                }
            }
        /** sub-users */

        /** inventories */
            public function inventories(Request $request){
                $cart_id = $request->cart_id ?? NULL;

                $collection = ItemInventory::select('items_inventories.id', 'items_inventories.title', 
                                                DB::Raw("(select COUNT(items_inventories_items.id) from items_inventories_items where items_inventories_items.item_inventory_id = items_inventories.id) as items")
                                            )
                                            ->where(['items_inventories.status' => 'active']);
                if($cart_id != null){
                    $collection->whereNotIn('items_inventories.id', function($query) use ($cart_id) {
                                    $query->select('inventory_id')->from('cart_inventories')->where('cart_id', '!=', $cart_id)->where('status', '!=', 'inactive'); 
                                });
                }else{
                    $collection->whereNotIn('items_inventories.id', function($query) {
                                    $query->select('inventory_id')->from('cart_inventories')->where('status', '!=', 'inactive'); 
                                });
                }

                $data = $collection->get();
                
                if($data->isNotEmpty())
                    return response()->json(['status' => 200, 'message' => 'Data found', 'data' => $data]);
                else
                    return response()->json(['status' => 201, 'message' => 'No data found']);
            }
        /** inventories */


    }