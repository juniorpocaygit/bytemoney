<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('productor_id');
            $table->unsignedBigInteger('category_id');
            $table->string('title', 150);
            $table->float('value', 8,2);
            $table->text('afiliate_rules');
            $table->text('description');
            $table->timestamps();

            $table->foreign('productor_id')->references('id')->on('users')->nullable();
            $table->unique('productor_id');
            $table->foreign('category_id')->references('id')->on('category')->nullable();
            $table->unique('category_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropForeign('products_category_id_foreign');
            $table->dropForeign('products_productor_id_foreign');
        });

        Schema::dropIfExists('products');
    }
};
