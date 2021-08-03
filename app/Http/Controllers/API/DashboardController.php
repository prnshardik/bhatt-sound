<?php

    namespace App\Http\Controllers\API;

    use App\Http\Controllers\Controller;
    use Illuminate\Http\Request;
    use App\Models\Cart;
    use App\Models\CartUser;
    use App\Models\CartInventory;
    use App\Models\CartSubInventory;
    use App\Models\User;
    use Auth, DB, Validator, File ;

    class DashboardController extends Controller{
        /** Index */
            public function index(Request $request){
                $data = Cart::select('id', 'party_name', 'party_address')
                                ->where(['user_id' => auth('sanctum')->user()->id])
                                ->where('status', '!=', 'reach')
                                ->first();

                if($data){
                    $data->user_id = auth('sanctum')->user()->id; 
                    $data->user_name = auth('sanctum')->user()->name; 

                    $cart_users = CartUser::select('cart_users.user_id', 'users.name as user_name')
                                                ->leftjoin('users', 'users.id', 'cart_users.user_id')
                                                ->where(['cart_users.cart_id' => $data->id])
                                                ->get();

                    if($cart_users->isNotEmpty())
                        $data->users = $cart_users;
                    else
                        $data->users = collect();

                    $cart_inventories = CartInventory::select('cart_inventories.inventory_id', 'items_inventories.title')
                                                    ->leftjoin('items_inventories', 'items_inventories.id', 'cart_inventories.inventory_id')
                                                    ->where(['cart_inventories.cart_id' => $data->id])
                                                    ->get();

                    if($cart_inventories->isNotEmpty())
                        $data->inventories = $cart_inventories;
                    else
                        $data->inventories = collect();

                    $cart_sub_inventories = CartSubInventory::select('cart_sub_inventories.sub_inventory_id', 'sub_items_inventories.title')
                                                                ->leftjoin('sub_items_inventories', 'sub_items_inventories.id', 'cart_sub_inventories.sub_inventory_id')
                                                                ->where(['cart_sub_inventories.cart_id' => $data->id])
                                                                ->get();

                    if($cart_sub_inventories->isNotEmpty())
                        $data->sub_inventories = $cart_sub_inventories;
                    else
                        $data->sub_inventories = collect();

                    return response()->json(['status' => 200, 'message' => 'Record found', 'data' => $data]);
                }else{
                    return response()->json(['status' => 201, 'message' => 'No record found']);
                }                
            }
        /** Index */   
    }
