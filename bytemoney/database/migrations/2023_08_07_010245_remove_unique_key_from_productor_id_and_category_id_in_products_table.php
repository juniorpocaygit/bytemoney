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
        Schema::table('products', function (Blueprint $table) {
            $table->dropForeign('products_category_id_foreign');
            $table->dropForeign('products_productor_id_foreign');
            $table->dropUnique('products_productor_id_unique');
            $table->dropUnique('products_category_id_unique');
            $table->foreign('productor_id')->references('id')->on('users')->nullable();
            $table->foreign('category_id')->references('id')->on('category')->nullable();            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $table->dropForeign('products_productor_id_foreign');
        $table->dropForeign('products_category_id_foreign');
        $table->dropForeign(['productor_id', 'category_id']);
        $table->unique('productor_id');
        $table->unique('category_id');
        $table->foreign('productor_id')->references('id')->on('users');
        $table->foreign('category_id')->references('id')->on('category');
    }
};
