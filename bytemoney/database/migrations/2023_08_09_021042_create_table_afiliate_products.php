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
        Schema::create('afiliate_products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('afiliate_id');
            $table->unsignedBigInteger('products_id');
            $table->timestamps();

            $table->foreign('afiliate_id')->references('id')->on('users')->nullable();
            $table->foreign('products_id')->references('id')->on('products')->nullable(); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $table->dropForeign('afiliate_products_afiliate_id_foreign');
        $table->dropForeign('afiliate_products_products_id_foreign');
        Schema::dropIfExists('afiliate_products');
    }
};
