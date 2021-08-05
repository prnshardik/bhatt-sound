<?php    
    namespace App\Http\Controllers;

    use Illuminate\Http\Request;
    use Illuminate\Support\Str;
    use App\Models\User;
    use App\Models\Item;
    use App\Models\ItemInventory;
    use App\Models\SubItem;
    use App\Models\SubItemInventory;

    use Auth, Validator, DB, Mail, DataTables, File;

    class PrintsController extends Controller{
        /** index */
            public function index(Request $request){
                if($request->ajax()){
                    $search = $request->search;
                    $option = $request->option;
                    $selected = json_decode($request->selected);

                    if($option == 'items'){
                        $collection = Item::select('id', 'name');

                        if($search != '')
                            $collection->where('name', 'like', '%'.$search.'%');
                    }elseif($option == 'subItems'){
                        $collection = SubItem::select('id', 'name');

                        if($search != '')
                            $collection->where('name', 'like', '%'.$search.'%');
                    }elseif($option == 'itemsInventories'){
                        $collection = ItemInventory::select('id', 'title as name');

                        if($search != '')
                            $collection->where('title', 'like', '%'.$search.'%');
                    }elseif($option == 'subItemsInventories'){
                        $collection = SubItemInventory::select('id', 'title as name');

                        if($search != '')
                            $collection->where('title', 'like', '%'.$search.'%');
                    }

                    $data = $collection->paginate(5);
                    
                    $view = view('prints.table', compact('data', 'selected'))->render();
                    $pagination = view('prints.pagination', compact('data'))->render();
                    
                    return response()->json(['success' => true, 'data' => $view, 'pagination' => $pagination]);

                }

                return view('prints.index');
            }
        /** index */        
    }