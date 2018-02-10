<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Factory;
use Carbon\Carbon;

class PostsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [];
        $faker = Factory::create();

        $userIds = DB::table('users')->pluck('id')->toArray();

        for($i=0; $i<100; $i++){
            $data[] = [
                'user_id' => array_rand($userIds),
                'title' => $faker->sentence,
                'summary' => substr($faker->paragraph, 0, 250),
                'thumb' => $faker->imageUrl(120, 120),
                'content' => $faker->text,
                'created_at' => Carbon::now()->toDateTimeString(),
                'updated_at' => Carbon::now()->toDateTimeString(),
            ];
        }
        if(!empty($data) && is_array($data)){
            DB::table('posts')->insert($data);
        }
    }
}
