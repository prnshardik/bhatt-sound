<?php    

    namespace App\Http\Controllers;

    use Illuminate\Http\Request;
    use App\Models\User;
    use App\Models\Item;
    use App\Models\ItemCategory;
    use App\Models\ItemInventory;
    use App\Models\SubItem;
    use App\Models\SubItemCategory;
    use App\Models\SubItemInventory;
    use Auth, DB;

    class DashboardController extends Controller{

        /** index */
            public function index(Request $request){
                $users = User::where(['status' => 'active', 'is_admin' => 'n'])->count();

                $itemsCategories = ItemCategory::where(['status' => 'active'])->count();
                $items = Item::where(['status' => 'active'])->count();
                $itemsInventories = ItemInventory::where(['status' => 'active'])->count();

                $subItemsCategories = SubItemCategory::where(['status' => 'active'])->count();
                $subItems = SubItem::where(['status' => 'active'])->count();
                $subItemsInventories = SubItemInventory::where(['status' => 'active'])->count();

                $cart = 0;

                $data = ['users' => $users, 'itemsCategories' => $itemsCategories, 'items' => $items, 'itemsInventories' => $itemsInventories,
                        'cart' => $cart, 'subItemsCategories' => $subItemsCategories, 'subItems' => $subItems, 'subItemsInventories' => $subItemsInventories];

                return view('dashboard', ['data' => $data]);
            }
        /** index */
    }