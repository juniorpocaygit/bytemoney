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
        
        // Adicione uma nova coluna com o novo nome
            Schema::table('afiliate_products', function (Blueprint $table) {
                $table->dropForeign('afiliate_products_afiliate_id_foreign');
               
                $table->unsignedBigInteger('user_id')->nullable()->after('id');
            });    
            
            DB::table('afiliate_products')->update(['user_id' => DB::raw('afiliate_id')]);

            Schema::table('afiliate_products', function (Blueprint $table) {
                $table->foreign('user_id')->references('id')->on('users')->nullable();

                $table->dropColumn('afiliate_id');
            });
   
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('afiliate_products', function (Blueprint $table) {
            $table->dropForeign('afiliate_products_user_id_foreign');
           
            $table->unsignedBigInteger('afiliate_id')->nullable();
        });    
        
        DB::table('afiliate_products')->update(['afiliate_id' => DB::raw('user_id')]);

        Schema::table('afiliate_products', function (Blueprint $table) {
            $table->foreign('afiliate_id')->references('id')->on('users')->nullable();
           
            $table->dropColumn('user_id');
        });
    }
};
