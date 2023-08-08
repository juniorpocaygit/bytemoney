@extends('app.layouts.main')

@section('titulo', 'Home')
@section('topo-conteudo')
   <h2 class="text-white  mt-sm-4 mt-2 ms-sm-3 ms-4">Dashboard</h2>
@endsection
@section('conteudo')
    <h2>Bem-vindo, {{ auth()->user()->name }}!</h2>
  
    
@endsection