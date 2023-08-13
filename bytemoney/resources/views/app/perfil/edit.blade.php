@extends('app.layouts.main')

@section('titulo', 'Perfil')
@section('topo-conteudo')
    <div class="topo-fixed">
        <h2 class="">Perfil do usuário</h2>
    </div>
@endsection
@section('conteudo')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 mt-4">
            <div class="w-100">
                @include('app.perfil.partials.update-perfil-information-form')
            </div>
        </div>
        <div class="col-md-6 mt-4">
            <div class="w-100">
                @include('app.perfil.partials.update-password-form')
            </div>
        </div>
    </div>    
    <div class="row">
        <div class="col-md-6">
            <div class="w-100">
                @include('app.perfil.partials.delete-user-form')
            </div>
        </div>
    </div>
</div>
@endsection