<?php    
    namespace App\Http\Controllers;

    use Illuminate\Http\Request;
    use Illuminate\Support\Str;
    use App\Models\Item;
    use App\Models\SubItemCategory;
    use App\Http\Requests\SubItemRequest;
    use Auth, Validator, DB, Mail, DataTables, File;

    class DemoController extends Controller{
        /** index */
            public function index(Request $request){
                $users = Item::all();
                $usersUnique = $users->unique(['name']);
                $userDuplicates = $users->diff($usersUnique);
                echo "<pre>";
                dd($userDuplicates->toArray());
            }
        /** index */


   
    }