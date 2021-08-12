<?php    
    namespace App\Http\Controllers;

    use Illuminate\Http\Request;
    use Illuminate\Support\Str;
    use App\Models\Item;
    use App\Models\SubItem;
    use App\Http\Requests\SubItemRequest;
    use Auth, Validator, DB, Mail, DataTables, File;

    class DemoController extends Controller{
        /** index */
            public function item(Request $request){
                $results = DB::select("SELECT DISTINCT name FROM items");

                if(!empty($results)){
                    foreach($results as $result){
                        $uniq = Item::select('id', 'name')->where('name', 'like', '%' . $result->name . '%')->get();
                        
                        $i = 1;

                        if($uniq->isNotEMpty()){
                            foreach($uniq as $row){
                                $name = $row->name;
                                if($name != $row->name){
                                    $i == 1;
                                }
                                
                                $str = substr($row->name, -5);

                                if (strstr($str, ' - ')) {
                                    // $name = preg_replace('/'." - *".'/', '', $str);
                                    // dd($str, $name);
                                    $name = preg_replace('/ - *./', '', $row->name);
                                }else{
                                    $name = $row->name;
                                }
                                
                                $crud["name"] = $i .' - '.$name;
                                $update = Item::where(['id' => $row->id])->update($crud);
                                if($update){
                                    echo "success<br/>";
                                }else{
                                    echo "fail<br/>";
                                }
                                $i++;   
                            }
                        }
                    }
                }

                // $i = 1;

                // foreach($userDuplicates AS $row){
                //     $name = $row->name;
                //     if($name != $row->name){
                //         $i == 1;
                //     }
                //     $crud["name"] = $i .' - '.$row->name;
                //     $update = Item::where(['id' => $row->id])->update($crud);
                //     if($update){
                //         echo 'success';
                //     }else{
                //         echo 'fail';
                //     }
                //     $i++;
                // }
            }
        /** index */


        public function subitem(Request $request){
                $results = DB::select("SELECT DISTINCT name FROM sub_items");

                if(!empty($results)){
                    foreach($results as $result){
                        $uniq = SubItem::select('id', 'name')->where('name', 'like', '%' . $result->name . '%')->get();
                        
                        $i = 1;

                        if($uniq->isNotEMpty()){
                            foreach($uniq as $row){
                                $name = $row->name;
                                if($name != $row->name){
                                    $i == 1;
                                }
                                
                                $crud["name"] = $i .' - '.$row->name;
                                $update = SubItem::where(['id' => $row->id])->update($crud);
                                if($update){
                                    echo "success<br/>";
                                }else{
                                    echo "fail<br/>";
                                }
                                $i++;   
                            }
                        }
                    }
                }

             
            }

   
    }