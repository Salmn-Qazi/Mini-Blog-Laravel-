<?php

namespace Database\Seeders;

use App\Models\Tag;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TagSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Tag::insert([
            ["name" => "Cricket"],
            ["name" => "Football"],
            ["name" => "Tennis"],
            ["name" => "Laravel Developer"],
            ["name" => "Vue JS Developer"],
            ["name" => "Data Entry Operatpr"],
            ["name" => "Weather"],
            ["name" => "Sports"],
            ["name" => "Educational"],
        ]);
    }
}
