<?php

    namespace Database\Seeders;
    use App\Models\SubItem;

    use Illuminate\Database\Seeder;

    class SubItems extends Seeder{

        public function run(){
            for($i=1; $i < 16; $i++){
                SubItem::create([
                    'category_id' => 1,
                    'name' => "Item $i",
                    'description' => 'Lorem ipsum de tenor',
                    'status' => 'active',
                    'created_at' => date('Y-m-d H:i:s'),
                    'created_by' => 1,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'updated_by' => 1
                ]);
            }
        }
    }
