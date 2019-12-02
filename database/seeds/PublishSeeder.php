<?php

use App\Publish;
use Illuminate\Database\Seeder;

class PublishSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Publish::truncate();

        Publish::create(['type' => 'Public', 'description' => 'Public']);
        Publish::create(['type' => 'Team', 'description' => 'Team']);
        Publish::create(['type' => 'Private', 'description' => 'Private']);
    }
}
