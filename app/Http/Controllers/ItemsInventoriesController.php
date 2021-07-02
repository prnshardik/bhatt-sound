<?php    
    namespace App\Http\Controllers;

    use Illuminate\Http\Request;
    use Illuminate\Support\Str;
    use App\Models\Item;
    use App\Models\ItemInventory;
    use App\Models\ItemInventoryItem;
    use App\Http\Requests\ItemInventoryRequest;
    use Auth, Validator, DB, Mail, DataTables, File;

    class ItemsInventoriesController extends Controller{
        /** index */
            public function index(Request $request){
                if($request->ajax()){
                    $data = ItemInventory::select('id', 'title', 'qrcode', 'image', 'status')->get();

                    if($data->isNotEmpty()){
                        foreach($data as $row){
                            $inventory_items = ItemInventoryItem::where(['item_inventory_id' => $row->id, 'status' => 'active'])->count();
                            $row->items = $inventory_items;
                        }
                    }

                    return Datatables::of($data)
                            ->addIndexColumn()
                            ->addColumn('action', function($data){
                                return ' <div class="btn-group btn-sm">
                                                <a href="'.route('items.inventories.view', ['id' => base64_encode($data->id)]).'" class="btn btn-default btn-xs">
                                                    <i class="fa fa-eye"></i>
                                                </a> 
                                                <a href="'.route('items.inventories.edit', ['id' => base64_encode($data->id)]).'" class="btn btn-default btn-xs">
                                                    <i class="fa fa-edit"></i>
                                                </a>  
                                                <a href="javascript:;" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                                    <i class="fa fa-bars"></i>
                                                </a> 
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="javascript:;" onclick="change_status(this);" data-status="active" data-old_status="'.$data->status.'" data-id="'.base64_encode($data->id).'">Active</a></li>
                                                    <li><a class="dropdown-item" href="javascript:;" onclick="change_status(this);" data-status="inactive" data-old_status="'.$data->status.'" data-id="'.base64_encode($data->id).'">Inactive</a></li>
                                                    <li><a class="dropdown-item" href="javascript:;" onclick="change_status(this);" data-status="deleted" data-old_status="'.$data->status.'" data-id="'.base64_encode($data->id).'">Delete</a></li>
                                                </ul>
                                            </div>';
                            })

                            ->editColumn('status', function($data) {
                                if($data->status == 'active')
                                    return '<span class="badge badge-pill badge-success">Active</span>';
                                else if($data->status == 'inactive')
                                    return '<span class="badge badge-pill badge-warning">Inactive</span>';
                                else if($data->status == 'deleted')
                                    return '<span class="badge badge-pill badge-danger">Delete</span>';
                                else
                                    return '-';
                            })

                            ->editColumn('image', function($data) {
                                if($data->image != null || $data->image != '')
                                    $image = url('uploads/items_inventory').'/'.$data->image;
                                else
                                    $image = url('uploads/items_inventory').'/default.png';
                                
                                return "<img src='$image' style='height: 30px; width: 30px'>";
                            })

                            ->editColumn('qrcode', function($data) {
                                if($data->qrcode != null || $data->qrcode != '')
                                    $image = url('uploads/qrcodes/items_inventory').'/'.$data->qrcode;
                                else
                                    $image = '';
                                
                                return "<img src='$image' style='height: 30px; width: 30px'>";
                            })

                            ->rawColumns(['action', 'status', 'image', 'qrcode'])
                            ->make(true);
                }
                return view('items.inventories.index');
            }
        /** index */

        /** create */
            public function create(Request $request){
                return view('items.inventories.create');
            }
        /** create */

        /** insert */
            public function insert(ItemInventoryRequest $request){
                if($request->ajax()){ return true; }

                if(!empty($request->all())){
                    $file_to_upload = public_path().'/uploads/items_inventory/';
                    if (!File::exists($file_to_upload))
                        File::makeDirectory($file_to_upload, 0777, true, true);

                    $qr_to_upload = public_path().'/uploads/qrcodes/items_inventory/';
                    if (!File::exists($qr_to_upload))
                        File::makeDirectory($qr_to_upload, 0777, true, true);

                    $crud = [
                        'title' => ucfirst($request->title),
                        'description' => $request->description ?? NULL,
                        'status' => 'active',
                        'created_at' => date('Y-m-d H:i:s'),
                        'created_by' => auth()->user()->id,
                        'updated_at' => date('Y-m-d H:i:s'),
                        'updated_by' => auth()->user()->id
                    ];

                    if(!empty($request->file('image'))){
                        $file = $request->file('image');
                        $filenameWithExtension = $request->file('image')->getClientOriginalName();
                        $filename = pathinfo($filenameWithExtension, PATHINFO_FILENAME);
                        $extension = $request->file('image')->getClientOriginalExtension();
                        $filenameToStore = time()."_".$filename.'.'.$extension;

                        $crud["image"] = $filenameToStore;
                    }else{
                        $crud["image"] = 'default.png';
                    }

                    DB::beginTransaction();
                    try {
                        $last_id = ItemInventory::insertGetId($crud);

                        if($last_id){
                            $qrname = 'qrcode_'.$last_id.'.png';

                            \QrCode::size(500)->format('png')->merge('/public/qr_logo.png', .3)->generate($last_id, public_path('uploads/qrcodes/items_inventory/'.$qrname));

                            $update = ItemInventory::where(['id' => $last_id])->update(['qrcode' => $qrname]);

                            if($update){
                                $items_id = $request->items_id;

                                for($i=0; $i<count($items_id); $i++){
                                    $ivti_crud = [
                                        'item_inventory_id' => $last_id,
                                        'item_id' => $items_id[$i],
                                        'status' => 'active',
                                        'created_at' => date('Y-m-d H:i:s'),
                                        'created_by' => auth()->user()->id,
                                        'updated_at' => date('Y-m-d H:i:s'),
                                        'updated_by' => auth()->user()->id
                                    ];

                                    ItemInventoryItem::insertGetId($ivti_crud);
                                }

                                if(!empty($request->file('image')))
                                    $file->move($file_to_upload, $filenameToStore);

                                DB::commit();
                                return redirect()->route('items.inventories')->with('success', 'Record added successfully');
                            }else{
                                DB::rollback();
                                return redirect()->back()->with('error', 'Faild to add record')->withInput();
                            }
                        }else{
                            DB::rollback();
                            return redirect()->back()->with('error', 'Faild to add record')->withInput();
                        }
                    } catch (\Exception $e) {
                        DB::rollback();
                        return redirect()->back()->with('error', 'Faild to add record')->withInput();
                    }
                }else{
                    return redirect()->back()->with('error', 'Something went wrong')->withInput();
                }
            }
        /** insert */

        /** view */
            public function view(Request $request, $id=''){
                if($id == '')
                    return redirect()->back()->with('error', 'Something went wrong');

                $id = base64_decode($id);
                $path = URL('/uploads/users').'/';

                $data = User::select('id', 'name', 'email', 'phone', 'status',
                                        DB::Raw("CASE
                                        WHEN ".'image'." != '' THEN CONCAT("."'".$path."'".", ".'image'.")
                                        ELSE CONCAT("."'".$path."'".", 'default.png')
                                        END as image")
                                    )
                            ->where(['id' => $id])
                            ->first();
                
                if($data)
                    return view('users.view')->with('data', $data);
                else
                    return redirect()->back()->with('error', 'No record found');
            }
        /** view */

        /** edit */
            public function edit(Request $request, $id=''){
                if($id == '')
                    return redirect()->back()->with('error', 'Something went wrong');

                $id = base64_decode($id);
                $path = URL('/uploads/users').'/';

                $data = User::select('id', 'name', 'email', 'phone', 'status',
                                        DB::Raw("CASE
                                        WHEN ".'image'." != '' THEN CONCAT("."'".$path."'".", ".'image'.")
                                        ELSE CONCAT("."'".$path."'".", 'default.png')
                                        END as image")
                                    )
                            ->where(['id' => $id])
                            ->first();

                if($data)
                    return view('users.edit')->with('data', $data);
                else
                    return redirect()->back()->with('error', 'No record found');
            }
        /** edit */ 

        /** update */
            public function update(UsersRequest $request){
                if($request->ajax()){ return true; }

                if(!empty($request->all())){
                    $exst_record = User::where(['id' => $request->id])->first(); 
                    $folder_to_upload = public_path().'/uploads/users/';

                    $crud = [
                        'name' => ucfirst($request->name),
                        'email' => $request->email,
                        'phone' => $request->phone ?? NULL,
                        'updated_at' => date('Y-m-d H:i:s'),
                        'updated_by' => auth()->user()->id
                    ];

                    if(!empty($request->file('image'))){
                        $file = $request->file('image');
                        $filenameWithExtension = $request->file('image')->getClientOriginalName();
                        $filename = pathinfo($filenameWithExtension, PATHINFO_FILENAME);
                        $extension = $request->file('image')->getClientOriginalExtension();
                        $filenameToStore = time()."_".$filename.'.'.$extension;

                        if (!File::exists($folder_to_upload))
                            File::makeDirectory($folder_to_upload, 0777, true, true);

                        $crud["image"] = $filenameToStore;
                    }else{
                        $crud["image"] = $exst_record->image;
                    }
                    
                    if(isset($request->password) && !empty($request->password))
                        $crud['password'] = bcrypt($request->password);

                    $update = User::where(['id' => $request->id])->update($crud);

                    if($update){
                        if(!empty($request->file('image')))
                            $file->move($folder_to_upload, $filenameToStore);

                        if($exst_record->image != null || $exst_record->image != ''){
                            $file_path = public_path().'/uploads/users/'.$exst_record->image;

                            if(File::exists($file_path) && $file_path != ''){
                                if($exst_record->image != 'default.png')
                                    @unlink($file_path);
                            }
                        }

                        return redirect()->route('users')->with('success', 'Record updated successfully');
                    }else{
                        return redirect()->back()->with('error', 'Faild to update record')->withInput();
                    }
                }else{
                    return redirect()->back()->with('error', 'Something went wrong')->withInput();
                }
            }
        /** update */

        /** change-status */
            public function change_status(Request $request){
                if(!$request->ajax()){ exit('No direct script access allowed'); }

                if(!empty($request->all())){
                    $id = base64_decode($request->id);
                    $status = $request->status;

                    $data = User::where(['id' => $id])->first();

                    if(!empty($data)){
                        if($status == 'deleted')
                            $update = User::where('id',$id)->delete();
                        else
                            $update = User::where(['id' => $id])->update(['status' => $status, 'updated_at' => date('Y-m-d H:i:s'), 'updated_by' => auth()->user()->id]);
                        
                        if($update){
                            if($status == 'deleted'){
                                $file_path = public_path().'/uploads/users/'.$data->image;

                                if(File::exists($file_path) && $file_path != ''){
                                    if($data->image != 'default.png')
                                        @unlink($file_path);
                                }
                            }
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

        /** remove-image */
            public function remove_image(Request $request){
                if(!$request->ajax()){ exit('No direct script access allowed'); }

                if(!empty($request->all())){
                    $id = base64_decode($request->id);
                    $data = User::find($id);

                    if($data){
                        if($data->image != ''){
                            $file_path = public_path().'/uploads/users/'.$data->image;

                            if(File::exists($file_path) && $file_path != ''){
                                if($data->image != 'default.png')
                                    @unlink($file_path);
                            }

                            $update = User::where(['id' => $id])->limit(1)->update(['image' => null]);

                            if($update)
                                return response()->json(['code' => 200]);
                            else
                                return response()->json(['code' => 201]);
                        }else{
                            return response()->json(['code' => 200]);
                        }
                    }else{
                        return response()->json(['code' => 201]);
                    }
                }else{
                    return response()->json(['code' => 201]);
                }
            }
        /** remove-image */

        /** items */
            public function items(Request $request){
                $search = $request->search;
                $items = json_decode($request->items);

                $collection = Item::select('id', 'name', 'description')
                                    ->where(['status' => 'active']);

                if($search != '')
                    $collection->where('name', 'like', '%'.$search.'%');
                
                $collection->whereNotIn('id', function($query) {
                    $query->select('item_id')->from('items_inventories_items')->where(['status' => 'active']); 
                });

                $data = $collection->paginate(5);

                $view = view('items.inventories.items', compact('data', 'items'))->render();
                $pagination = view('items.inventories.items_pagination', compact('data'))->render();
                
                return response()->json(['success' => true, 'data' => $view, 'pagination' => $pagination]);
            }
        /** items */
    }