<?php    

    namespace App\Http\Controllers;

    use Illuminate\Http\Request;
    use App\Models\CartItem;
    use Auth, DB;

    class DashboardController extends Controller{

        /** index */
            public function index(Request $request){
                $users = DB::table('users as u')->select(DB::Raw("COUNT(".'u.id'.") as count"))->where(['u.status' => 'active', 'is_admin' => 'n'])->first();
               
                $data = ['users' => $users->count];

                return view('dashboard', ['data' => $data]);
            }
        /** index */
    }