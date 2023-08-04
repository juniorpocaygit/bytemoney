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
        Schema::create('access_level', function (Blueprint $table) {
            $table->id();
            $table->string('name', 100);
            $table->integer('level');
            $table->timestamps();
        });
      
        Schema::table('users', function (Blueprint $table) {
            
            //Inserir um registro de fornecedor para estabelecer o relacionamento
            $level_id = DB::table('access_level')->insertGetId([
                'name'=>'produtor',
                'level'=> 90,
            ]);
            
            $table->unsignedBigInteger('access_level_id')->default($level_id)->after('remember_token');
            $table->string('phone', 16)->after('access_level_id');
            $table->timestamp('deleted_at')->nullable();
            $table->foreign('access_level_id')->references('id')->on('access_level');
        });

    }
    
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            
            $table->dropForeign('users_access_level_id_foreign');
                        
            $table->dropColumn('access_level_id');
            $table->dropColumn('phone');
            $table->dropColumn('deleted_at')->nullable();
        });

        Schema::dropIfExists('access_level');
    }
};
