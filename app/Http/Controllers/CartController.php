<?php    

    namespace App\Http\Controllers;

    use Illuminate\Http\Request;
    use Illuminate\Support\Str;
    use App\Models\User;
    use App\Models\Cart;
    use App\Models\CartUser;
    use App\Models\CartInventory;
    use App\Models\CartSubInventory;
    use App\Models\ItemInventory;
    use App\Models\SubItemInventory;
    use Auth, Validator, DB, Mail, DataTables;

    class CartController extends Controller{
        /** index */
            public function index(Request $request){
                if($request->ajax()){
                    $data = Cart::select('cart.id', 'u.name as user_name', 'cart.party_name', 'cart.status')
                                    ->leftjoin('users as u', 'u.id', 'cart.user_id')
                                    ->where('cart.status', '!=', 'reach')
                                    ->orderBy('cart.id','desc')
                                    ->get();

                    if($data->isNotEmpty()){
                        foreach($data as $row){
                            $cart_item = CartItem::select(DB::Raw("COUNT(".'id'.") as count"))->where(['cart_id' => $row->id])->first();
                            $row->count = $cart_item->count;
                        }
                    }

                    return Datatables::of($data)
                            ->addIndexColumn()
                            ->addColumn('action', function($data){
                                $return = '<div class="btn-group btn-sm">
                                            <a href="'.route('cart.view', ['id' => base64_encode($data->id)]).'" class="btn btn-default btn-xs">
                                                <i class="fa fa-eye"></i>
                                            </a>';
                                
                                if($data->status == 'assigned'){
                                    $return .= '<a href="'.route('cart.edit', ['id' => base64_encode($data->id)]).'" class="btn btn-default btn-xs">
                                                    <i class="fa fa-edit"></i>
                                                </a>';
                                }

                                $return .= '<a href="javascript:;" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                                <i class="fa fa-bars"></i>
                                            </a> 
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="javascript:;" onclick="change_status(this);" data-status="deleted" data-old_status="'.$data->status.'" data-id="'.base64_encode($data->id).'">Delete</a></li>
                                            </ul>
                                        </div>';
                                return $return;
                            })

                            ->editColumn('status', function($data) {
                                if($data->status == 'assigned')
                                    return '<span class="badge badge-pill badge-info">Assigned</span>';
                                else if($data->status == 'dispatch')
                                    return '<span class="badge badge-pill badge-info">Dispatch</span>';
                                else if($data->status == 'deliver')
                                    return '<span class="badge badge-pill badge-info">Deliver</span>';
                                else if($data->status == 'out')
                                    return '<span class="badge badge-pill badge-info">Out</span>';
                                else if($data->status == 'reach')
                                    return '<span class="badge badge-pill badge-info">Reach</span>';
                                else
                                    return '-';
                            })

                            ->rawColumns(['action', 'status'])
                            ->make(true);
                }
                return view('cart.index');
            }
        /** index */

        /** create */
            public function create(Request $request){
                $users = User::select('id', 'name')
                            ->where(['is_admin' => 'n', 'status' => 'active'])
                            ->whereNotIn('id', function($query) {
                                $query->select('user_id')->from('cart')->where('status', '!=', 'reach'); 
                            })
                            ->whereNotIn('id', function($query) {
                                $query->select('user_id')->from('cart_users')->where(['status' => 'active']); 
                            })
                            ->get();
                
                return view('cart.step', ['users' => $users, 'sub_users' => json_encode($users)]);
            }
        /** create */

        /** insert */
            public function insert(Request $request){
                if(!$request->ajax()){ return true; }

                $input = $request->obj;
                
                $validator = Validator::make($input,
                                    [
                                        'user_id' => 'required|array|min:1', 
                                        'sub_users' => 'required|array|min:1',
                                        'party_name' => 'required', 
                                        'party_address' => 'required',
                                        'inventories' => 'required|array|min:1', 
                                        'sub_items' => 'required|array|min:1',
                                    ]
                                );
                if($validator->fails()){
                    return response()->json($validator->errors(), 422);
                }else{
                    $user_id = array_keys($input['user_id']);
                    $user_id = $user_id[0];
                    $sub_users = array_keys($input['sub_users']);
                    $party_name = $input['party_name'];
                    $party_address = $input['party_address'];
                    $inventories = array_keys($input['inventories']);
                    $sub_items = [];
    
                    foreach($input['sub_items'] as $k => $v){
                        $ar = (array)$v;
                        $i = array_values($ar);
                        $sub_items[$k] = $i[0]; 
                    }

                    DB::beginTransaction();
                    try {
                        $crud = [
                                    'user_id' => $user_id,
                                    'party_name' => $party_name,
                                    'party_address' => $party_address,
                                    'status' => 'assigned',
                                    'created_at' => date('Y-m-d H:i:s'),
                                    'created_by' => auth()->user()->id,
                                    'updated_at' => date('Y-m-d H:i:s'),
                                    'updated_by' => auth()->user()->id
                                ];
                        
                        $last_id = Cart::insertGetId($crud);

                        if($last_id){
                            foreach($sub_users as $k => $v){
                                $sub_users_crud = [
                                    'cart_id' => $last_id,
                                    'user_id' => $v,
                                    'status' => 'active',
                                    'created_at' => date('Y-m-d H:i:s'),
                                    'created_by' => auth()->user()->id,
                                    'updated_at' => date('Y-m-d H:i:s'),
                                    'updated_by' => auth()->user()->id
                                ];

                                $cart_user_id = CartUser::insertGetId($sub_users_crud);

                                if(empty($cart_user_id)){
                                    DB::rollback();
                                    return response()->json(['code' => 201, 'message' => 'Cart sub users insert error, please try again later']);
                                }
                            }

                            foreach($inventories as $k => $v){
                                $inventories_crud = [
                                    'cart_id' => $last_id,
                                    'inventory_id' => $v,
                                    'status' => 'active',
                                    'created_at' => date('Y-m-d H:i:s'),
                                    'created_by' => auth()->user()->id,
                                    'updated_at' => date('Y-m-d H:i:s'),
                                    'updated_by' => auth()->user()->id
                                ];

                                $cart_inventory_id = CartItem::insertGetId($inventories_crud);

                                if(empty($cart_inventory_id)){
                                    DB::rollback();
                                    return response()->json(['code' => 201, 'message' => 'Cart inventory insert error, please try again later']);
                                }
                            }

                            $sub_item_crud = [
                                'cart_id' => $last_id,
                                'status' => 'active',
                                'created_at' => date('Y-m-d H:i:s'),
                                'created_by' => auth()->user()->id,
                                'updated_at' => date('Y-m-d H:i:s'),
                                'updated_by' => auth()->user()->id
                            ];

                            $sub_item_id = CartSubItem::insertGetId($sub_item_crud);

                            if(empty($sub_item_id)){
                                DB::rollback();
                                return response()->json(['code' => 201, 'message' => 'Cart sub item insert error, please try again later']);
                            }else{
                                $folder_to_upload = public_path().'/uploads/qrcodes/cart_sub_items';

                                if (!\File::exists($folder_to_upload))
                                    \File::makeDirectory($folder_to_upload, 0777, true, true);
                                
                                $qrname = 'qrcode_'.$sub_item_id.'.png';

                                \QrCode::size(500)->format('png')->generate($sub_item_id, public_path('uploads/qrcodes/cart_sub_items/'.$qrname));

                                CartSubItem::where(['id' => $sub_item_id])->update(['qrcode' => $qrname]);

                                foreach($sub_items as $k => $v){
                                    if($v != '' || $v != 0){
                                        $sub_items_crud = [
                                            'cart_sub_item_id' => $sub_item_id,
                                            'sub_item_id' => $k,
                                            'quantity' => $v,
                                            'status' => 'active',
                                            'created_at' => date('Y-m-d H:i:s'),
                                            'created_by' => auth()->user()->id,
                                            'updated_at' => date('Y-m-d H:i:s'),
                                            'updated_by' => auth()->user()->id
                                        ];
   
                                        $exst_sub = SubItem::where(['id' => $k])->first();
                                        
                                        SubItem::where(['id' => $k])->update(['quantity' => $exst_sub->quantity - $v, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth()->user()->id]);
    
                                        $sub_items_id = CartSubItems::insertGetId($sub_items_crud);                                    
    
                                        if(empty($sub_items_id)){
                                            DB::rollback();
                                            return response()->json(['code' => 201, 'message' => 'Cart sub items insert error, please try again later']);
                                        }                                    
                                    }
                                }
                            }

                            DB::commit();
                            return response()->json(['code' => 200, 'message' => 'Cart added successfully']);
                        }else{
                            DB::rollback();
                            return response()->json(['code' => 201, 'message' => 'Cart insert error, please try again later']);
                        }
                    } catch (\Exception $e) {
                        DB::rollback();
                        return response()->json(['code' => 201, 'message' => 'Something went wrong, please try again later']);
                    }
                }
            }
        /** insert */

        /** view */
            public function view(Request $request, $id=''){
                if($id == '')
                    return redirect()->back()->with('error', 'Something went wrong');

                $id = base64_decode($id);

                $data = Cart::select('cart.id', 'cart.user_id', 'cart.party_name', 'cart.party_address', 'u.name as user_name')
                                    ->leftjoin('users as u', 'u.id', 'cart.user_id')
                                    ->where(['cart.id' => $id])
                                    ->first();

                if($data){
                    $sub_users = CartUser::select('u.name as name')
                                            ->leftjoin('users as u', 'u.id', 'cart_users.user_id')
                                            ->where(['cart_users.cart_id' => $data->id])
                                            ->get();

                    if($sub_users->isNotEmpty())
                        $data->sub_users = $sub_users;
                    else
                        $data->sub_users = collect();

                    $inventories = CartItem::select('i.title as name')
                                            ->leftjoin('inventories as i', 'i.id', 'cart_items.inventory_id')
                                            ->where(['cart_items.cart_id' => $data->id])
                                            ->get();

                    if($inventories->isNotEmpty())
                        $data->inventories = $inventories;
                    else
                        $data->inventories = collect();

                    $sub_item = CartSubItem::select('id')
                                            ->where(['cart_id' => $data->id])
                                            ->first();

                    if(!empty($sub_item)){
                        $sub_items = CartSubItems::select('cart_sub_items.quantity as quantity', 'sub_items.name')
                                            ->leftjoin('sub_items', 'sub_items.id', 'cart_sub_items.sub_item_id')
                                            ->where(['cart_sub_items.cart_sub_item_id' => $sub_item->id])
                                            ->get();

                        if($sub_items->isNotEmpty())
                            $data->sub_items = $sub_items;
                        else
                            $data->sub_items = collect();
                    }else{
                        $data->sub_items = collect();
                    }
                                        
                        
                    return view('cart.view', ['data' => $data]);
                }else{
                    return redirect()->back()->with('error', 'No cart found');
                }
            }
        /** view */

        /** edit */ 
            public function edit(Request $request, $id=''){
                if($id == '')
                    return redirect()->back()->with('error', 'Something went wrong');

                $id = base64_decode($id);
                
                $data = Cart::select('id', 'user_id', 'party_name', 'party_address')->where(['id' => $id])->first();
                $cart_users = CartUser::select('id', 'user_id')->where(['cart_id' => $id])->get()->toArray();

                $cart_users_ids = array_map(function($row){
                                                return $row['user_id'];
                                            }, $cart_users);

                $users = User::select('id', 'name')
                            ->where(['is_admin' => 'n', 'status' => 'active'])
                            ->whereNotIn('id', function($query) use ($data){
                                $query->select('user_id')->from('cart')->whereIn('status', ['assigned', 'dispatch', 'deliver', 'out'])
                                        ->WhereNotIn('user_id', [$data->user_id]);
                            })
                            ->whereNotIn('id', function($query) use ($data, $id){
                                $query->select('user_id')->from('cart_users')->where('cart_id', '!=', $id);
                            })
                            ->get();

                return view('cart.step', ['users' => $users, 'sub_users' => json_encode($users), 'data' => $data, 'cart_users_ids' => $cart_users_ids]);
            }
        /** edit */ 

        /** update */
            public function update(Request $request){
                if(!$request->ajax()){ return true; }

                $input = $request->obj;
                
                $validator = Validator::make($input,
                                    [
                                        'cart_id' => 'required',
                                        'user_id' => 'required|array|min:1', 
                                        'sub_users' => 'required|array|min:1',
                                        'party_name' => 'required', 
                                        'party_address' => 'required',
                                        'inventories' => 'required|array|min:1', 
                                        'sub_items' => 'required|array|min:1',
                                    ]
                                );
                if($validator->fails()){
                    return response()->json($validator->errors(), 422);
                }else{
                    $cart_id = $input['cart_id'];
                    $user_id = array_keys($input['user_id']);
                    $user_id = $user_id[0];
                    $sub_users = array_keys($input['sub_users']);
                    $party_name = $input['party_name'];
                    $party_address = $input['party_address'];
                    $inventories = array_keys($input['inventories']);
                    $sub_items = [];
    
                    foreach($input['sub_items'] as $k => $v){
                        $ar = (array)$v;
                        $i = array_values($ar);
                        $sub_items[$k] = $i[0]; 
                    }

                    DB::beginTransaction();
                    try {
                        $crud = [
                                    'user_id' => $user_id,
                                    'party_name' => $party_name,
                                    'party_address' => $party_address,
                                    'updated_at' => date('Y-m-d H:i:s'),
                                    'updated_by' => auth()->user()->id
                                ];
                        
                        $update = Cart::where(['id' => $cart_id])->update($crud);

                        if($update){
                            CartUser::where(['cart_id' => $cart_id])->delete();

                            foreach($sub_users as $k => $v){
                                $sub_users_crud = [
                                    'cart_id' => $cart_id,
                                    'user_id' => $v,
                                    'status' => 'active',
                                    'created_at' => date('Y-m-d H:i:s'),
                                    'created_by' => auth()->user()->id,
                                    'updated_at' => date('Y-m-d H:i:s'),
                                    'updated_by' => auth()->user()->id
                                ];

                                $cart_user_id = CartUser::insertGetId($sub_users_crud);

                                if(empty($cart_user_id)){
                                    DB::rollback();
                                    return response()->json(['code' => 201, 'message' => 'Cart sub users insert error, please try again later']);
                                }
                            }

                            foreach($inventories as $k => $v){
                                $exst_inventory = CartItem::select('id')->where(['cart_id' => $cart_id, 'inventory_id' => $v])->first();

                                if(empty($exst_inventory)){
                                    $inventories_crud = [
                                        'cart_id' => $cart_id,
                                        'inventory_id' => $v,
                                        'status' => 'active',
                                        'created_at' => date('Y-m-d H:i:s'),
                                        'created_by' => auth()->user()->id,
                                        'updated_at' => date('Y-m-d H:i:s'),
                                        'updated_by' => auth()->user()->id
                                    ];

                                    $cart_inventory_id = CartItem::insertGetId($inventories_crud);

                                    if(empty($cart_inventory_id)){
                                        DB::rollback();
                                        return response()->json(['code' => 201, 'message' => 'Cart inventory insert error, please try again later']);
                                    }
                                }
                            }

                            $exst_cart_sub_item = CartSubItem::select('id')->where(['cart_id' => $cart_id])->first();

                            if(empty($exst_cart_sub_item)){
                                DB::rollback();
                                return response()->json(['code' => 201, 'message' => 'Cart sub item insert error, please try again later']);
                            }else{
                                foreach($sub_items as $k => $v){
                                    $exst_cart_sub_items = CartSubItems::select('id', 'quantity')->where(['cart_sub_item_id' => $exst_cart_sub_item->id, 'sub_item_id' => $k])->first();

                                    if(!empty($exst_cart_sub_items)){
                                        if($v != '' || $v != 0){
                                            $exst_sub = SubItem::where(['id' => $k])->first(); 

                                            $quantity = $exst_sub->quantity + $exst_cart_sub_items->quantity - $v;
                                            SubItem::where(['id' => $k])->update(['quantity' => $quantity, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth()->user()->id]);
                                         
                                            $sub_items_crud = [
                                                'quantity' => $v,
                                                'updated_at' => date('Y-m-d H:i:s'),
                                                'updated_by' => auth()->user()->id
                                            ];
               
                                            $sub_items_update = CartSubItems::where(['id' => $exst_cart_sub_items->id])->update(['quantity' => $v, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth()->user()->id]);                                    
        
                                            if(empty($sub_items_update)){
                                                DB::rollback();
                                                return response()->json(['code' => 201, 'message' => 'Cart sub items insert error, please try again later']);
                                            }
                                        }
                                    }else{
                                        if($v != '' || $v != 0){
                                            $sub_items_crud = [
                                                'cart_sub_item_id' => $exst_cart_sub_item->id,
                                                'sub_item_id' => $k,
                                                'quantity' => $v,
                                                'status' => 'active',
                                                'created_at' => date('Y-m-d H:i:s'),
                                                'created_by' => auth()->user()->id,
                                                'updated_at' => date('Y-m-d H:i:s'),
                                                'updated_by' => auth()->user()->id
                                            ];
       
                                            $exst_sub = SubItem::where(['id' => $k])->first();
                                            
                                            SubItem::where(['id' => $k])->update(['quantity' => $exst_sub->quantity - $v, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth()->user()->id]);
        
                                            $sub_items_id = CartSubItems::insertGetId($sub_items_crud);                                    
        
                                            if(empty($sub_items_id)){
                                                DB::rollback();
                                                return response()->json(['code' => 201, 'message' => 'Cart sub items insert error, please try again later']);
                                            }                                    
                                        }
                                    }
                                }
                            }

                            DB::commit();
                            return response()->json(['code' => 200, 'message' => 'Cart updated successfully']);
                        }else{
                            DB::rollback();
                            return response()->json(['code' => 201, 'message' => 'Cart insert error, please try again later']);
                        }
                    } catch (\Exception $e) {
                        DB::rollback();
                        return response()->json(['code' => 201, 'message' => 'Something went wrong, please try again later']);
                    }
                }
            }
        /** update */

        /** change-status */
            public function change_status(Request $request){
                if(!$request->ajax()){ exit('No direct script access allowed'); }

                if(!empty($request->all())){
                    $id = base64_decode($request->id);
                    $status = $request->status;

                    $data = Cart::where(['id' => $id])->first();

                    if(!empty($data)){
                        $delete = Cart::where(['id' => $id])->delete();
                        
                        if($delete){
                            DB::table('used_items')->where(['cart_id' => $id])->delete();

                            return response()->json(['code' => 200]);
                        }else{
                            return response()->json(['code' => 201]);
                        }
                    }else{
                        return response()->json(['code' => 201]);
                    }
                }else{
                    return response()->json(['code' => 201]);
                }
            }
        /** change-status */

        /** users */
            public function users(Request $request){
                $data = User::where(['status' => 'active', 'is_admin' => 'n'])->get();

                if($data->isNotEmpty()){
                    $users = '<option value="">Select user</option>';
                    foreach($data as $row){
                        $users .= "<option value='$row->id'>$row->name</option>";
                    }

                    return json_encode(['code' => 200, 'data' => $users]);
                }else{
                    return json_encode(['code' => 201]);
                }
            }
        /** users */

        /** sub-users */
            public function sub_users(Request $request){
                if($request->id == '')
                    return json_encode(['code' => 201]);
                
                $data = User::where(['status' => 'active', 'is_admin' => 'n'])->where('id', '!=', $request->id)->get();

                if($data->isNotEmpty()){
                    $users = '';
                    foreach($data as $row){
                        $users .= "<option value='$row->id'>$row->name</option>";
                    }

                    return json_encode(['code' => 200, 'data' => $users]);
                }else{
                    return json_encode(['code' => 201]);
                }
            }
        /** sub-users */

        /** inventories */
            public function inventories(Request $request){
                $search = $request->search;

                $collection = ItemInventory::select('items_inventories.id', 'items_inventories.title', 
                                                DB::Raw("(select COUNT(items_inventories_items.id) from items_inventories_items where items_inventories_items.item_inventory_id = items_inventories.id) as items")
                                            )
                                            ->where(['items_inventories.status' => 'active']);
                
                if($search != '')
                    $collection->where('items_inventories.title', 'like', '%'.$search.'%');

                $data = $collection->paginate(2);
                
                $view = view('cart.inventories_table', compact('data'))->render();
                $pagination = view('cart.inventories_pagination', compact('data'))->render();
                
                return response()->json(['success' => true, 'data' => $view, 'pagination' => $pagination]);
            }
        /** inventories */

        /** delete-inventories */
            public function delete_inventories(Request $request){
               
            }
        /** delete-inventories */

        /** sub-inventories */
            public function sub_inventories(Request $request){

            }
        /** sub-inventories */

        /** delete-sub-inventories */
            public function delete_sub_inventories(Request $request){

            }
        /** delete-sub-inventories */
    }