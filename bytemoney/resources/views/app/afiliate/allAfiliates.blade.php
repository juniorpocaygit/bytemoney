@extends('app.layouts.main')

@section('titulo', 'Produtos')
@section('topo-conteudo')
    <div class="topo-fixed">
      <h2>Lista de Afiliados</h2>
  </div>
@endsection
@section('conteudo')
@if ($afiliateInfo->isEmpty()) 
    <h3 class="mt-4">Você ainda não possui nenhum afiliado.</h3>
@else 
    <div class="container-fluid">
        <div class="row mt-5">
            <table id="dataTable" class="table table-hover">
                <thead>
                    <tr>
                        <th style="text-align: center;">Foto</th>
                        <th style="text-align: center;">Nome</th>
                        <th style="text-align: center;">Email</th>
                        <th style="text-align: center;">Telefone</th>
                        <th style="text-align: center;">Prod. Vendidos</th>
                        <th style="text-align: center;">Receita</th>
                        <th style="text-align: center;">Total Vendas</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($afiliateInfo as $afiliate)
                        <tr>
                            <td class="photo-list" style="vertical-align:middle; text-align: center"><img src="{{ asset('storage/img/users/'.$afiliate->photo) }}" alt="{{$afiliate->name}}"></td>
                            <td style="vertical-align:middle; text-align: center">{{$afiliate->name}}</td>
                            <td style="vertical-align:middle; text-align: center">{{$afiliate->email}}</td>
                            <td style="vertical-align:middle; text-align: center">{{$afiliate->phone}}</td>
                            <td style="vertical-align:middle; text-align: center">{{$afiliate->total_products}}</td>
                            <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$afiliate->total_commission}}</span></td>
                            <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$afiliate->total_sales}}</span></td>
                        </tr>                  
                    @endforeach     
                </tbody>
            </table>    
        </div>
    </div>
@endif
@endsection