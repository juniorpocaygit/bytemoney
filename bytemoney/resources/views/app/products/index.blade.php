@extends('app.layouts.main')

@section('titulo', 'Produtos')
@section('topo-conteudo')
  <div class="topo-fixed">
      <h2>Produtos</h2>
  </div>   
@endsection
@section('conteudo')
@if ($products->isEmpty()) 
  <h3 class="mt-4">Você ainda não cadastrou nenhum produto.</h3>
@else   
  <div class="container-fluid">
      <div class="row">
          <div class="col-md-12 d-flex justify-content-between align-items-center">
              <h2 class="mt-sm-4 mt-2 ms-sm-0 ms-4">Todos os produtos</h2>
              <div>
                  <a href="{{route('produtos.create')}}"><x-secondary-button>{{ __('criar produto') }}</x-secondary-button></a>
              </div>
          </div>
          <div class="table-responsive col-12">
              <table id="dataTable" class="table table-hover">
                  <thead>
                    <tr>
                      <th style="text-align: center;">Foto</th>
                      <th style="text-align: center;">Título</th>
                      <th style="text-align: center;">Categoria</th>
                      <th style="text-align: center;">Valor Produto</th>
                      <th style="text-align: center;">Comissão</th>
                      <th style="text-align: center;">Data Criação</th>
                      <th style="text-align: center;"></th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach ($products as $product)
                      <tr>
                        <td class="photo-list" style="vertical-align:middle; text-align: center"><img src="{{ asset('storage/img/products/'.$product->photo) }}" alt="{{$product->title}}"></td>
                        <td style="vertical-align:middle; text-align: center">{{$product->title}}</td>
                        <td style="vertical-align:middle; text-align: center">{{$product->category->name}}</td>
                        <td style="vertical-align:middle; text-align: center">R$ {{$product->price}}</td>
                        <td style="vertical-align:middle; text-align: center">R$ {{$product->price_productor}}</td>
                        <td style="vertical-align:middle; text-align: center">{{ date('d/m/Y', strtotime($product->created_at)) }}
                        </td>
                        <td style="vertical-align:middle; text-align: center">
                          <div class="d-flex justify-content-center">
                            <a href="{{ route('produtos.edit',['produto' => $product->id])}}"><i class="bi bi-pencil-square "></i></a>
                            <a href="{{ route('produtos.show',['produto' => $product->id])}}"><i class="bi bi-search"></i></a>
                            <form id="form_{{$product->id}}" action="{{route('produtos.destroy', ['produto'=>$product->id])}}" method="POST">
                              @csrf
                              @method('DELETE')
                              <a href="#" onclick="document.getElementById('form_{{$product->id}}').submit()"><i class="bi bi-trash"></i></a>
                            </form>
                          </div>
                        </td>
                      </tr>                      
                    @endforeach                 
                  </tbody>
              </table>
          </div>       
      </div>
  </div>
@endif
@endsection