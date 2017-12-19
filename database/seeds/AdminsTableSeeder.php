<?php

use Illuminate\Database\Seeder;

class AdminsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [];
        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 10; $i ++) {
            $data[] = [
                'name' => $faker->userName,
                'email' => $faker->email,
                'password' => bcrypt('123456'),
                'is_active' => random_int(0, 1),
                'token' => $faker->sha1,
                'created_at' => \Carbon\Carbon::now()->toDateTimeString(),
                'updated_at' => \Carbon\Carbon::now()->toDateTimeString(),
            ];
        }

        DB::table('admins')->insert($data);
    }
}
