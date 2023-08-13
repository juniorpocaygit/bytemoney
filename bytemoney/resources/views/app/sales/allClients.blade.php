@extends('app.layouts.main')

@section('titulo', 'Todas as Vendas')
@section('topo-conteudo')
    <div class="topo-fixed">
        <h2>Todas as Vendas</h2>
    </div>
@endsection
@section('conteudo')
@if ($salesInfo->isEmpty())
    <h3 class="mt-4">Você ainda não realizou nenhuma venda.</h3>
@else
    <div class="container-fluid">
        <div class="table-responsive row mt-5">
            <table id="dataTable" class="table table-hover">
                <thead>
                    <tr>
                        <th style="text-align: center;">Nome</th>
                        <th style="text-align: center;">Produto</th>
                        <th style="text-align: center;">Categoria</th>
                        <th style="text-align: center;">Data Venda</th>
                        <th style="text-align: center;">Comissão</th>
                        <th style="text-align: center;">Valor de Venda</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($salesInfo as $sale)
                        <tr>
                            <td style="vertical-align:middle; text-align: center">{{$sale->client_name}}</td>
                            <td style="vertical-align:middle; text-align: center">{{$sale->title}}</td>
                            <td style="vertical-align:middle; text-align: center">{{$sale->category_name}}</td>
                            <td style="vertical-align:middle; text-align: center">{{date('d/m/Y', strtotime($sale->created_at))}}</td>
                            <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$sale->price_afiliate}}</span></td>
                            <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$sale->price}}</span></td>
                        </tr>                  
                    @endforeach     
                </tbody>
            </table>    
        </div>
    </div>
@endif    
@endsection