@extends('app.layouts.main')

@section('titulo', 'Dashboard')
@section('topo-conteudo')
<div class="row w-100 mt-lg-2 mt-4 ">
    @foreach ($mostSoldProducts as $product)             
        <div class="card-container px-3 mb-4  col-xl-3 col-md-6">
          <a href="{{ route('produtos.show',['produto' => $product->id])}}">
              <div class="card-products">
                  <div class="photo-product">
                      <img class="img-fluid" src="{{ asset('storage/img/products/'.$product->photo) }}" alt="">
                  </div>
                  <div class="title-product">
                      <p>{{$product->title}}</p>
                  </div>
                  <div class="price-commission">
                      <div class="price-product">
                          <div class="title-price"><p>venda</p></div>
                          <div class="d-flex flex-row justify-content-center align-items-center">
                              <span>R$</span><h3 class="ms-1 floatValue">{{$product->price}}</h3> 
                          </div>
                      </div>
                      <div class="commission-product mt-1 mb-2">
                          <div class="commission-price"><p>comissão</p></div>
                          <div class="d-flex flex-row justify-content-center align-items-center">
                            @if (auth()->user()->accessLevel->level == '80')
                                <span>R$</span><h3 class="ms-1 floatValue">{{$product->price_afiliate}}</h3> 
                            @else
                                <span>R$</span><h3 class="ms-1 floatValue">{{$product->price_productor}}</h3> 
                            @endif
                          </div>
                      </div>
                  </div>
              </div>
          </a>            
      </div>                
    @endforeach
</div>    
@endsection 
@section('conteudo')
@if ($lastSales->isEmpty())
    <h3 class="mt-4">Você ainda não realizou nenhuma venda.</h3>
@else
    <div class="container-dashboard row">
        <div class="content-tables table-responsive col-xl-6 col-lg-12 px-4 mt-3">
            <h4 class="subtitle mb-3">últimas vendas realizadas</h4>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th style="text-align: center;">Foto</th>
                        <th style="text-align: center;">Produto</th>
                        <th style="text-align: center;">Comissão</th>
                        <th style="text-align: center;">Valor de vendas</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($lastSales as $sale)
                        <tr>
                            <td class="photo-list" style="vertical-align:middle; text-align: center"><img src="{{ asset('storage/img/products/'.$sale->photo) }}" alt="{{$sale->title}}"></td>
                            <td style="vertical-align:middle; text-align: center">{{$sale->title}}</td>
                            @if (auth()->user()->accessLevel->level == '80')
                                <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$sale->price_afiliate}}</span></td>
                            @else 
                                <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$sale->price_productor}}</span></td>                            
                            @endif
                            <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$sale->price}}</span></td>
                        </tr>                      
                    @endforeach
                </tbody>
            </table>            
        </div>
        @if (auth()->user()->accessLevel->level == 80)
            <div class="table-responsive col-xl-6 col-lg-12 mt-3">
                <h4 class="subtitle mb-3">ranking de produtos mais vendidos</h4>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="text-align: center;">Foto</th>
                            <th style="text-align: center;">Produto</th>
                            <th style="text-align: center;">Qtde. Vendas</th>
                            <th style="text-align: center;">Comissão</th>
                            <th style="text-align: center;">Vendas Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($productRanking as $product)
                            <tr>
                                <td class="photo-list" style="vertical-align:middle; text-align: center"><img src="{{ asset('storage/img/products/'.$product->photo) }}" alt="{{$product->title}}"></td>
                                <td style="vertical-align:middle; text-align: center">{{$product->title}}</td>
                                <td style="vertical-align:middle; text-align: center">{{$product->total_products}}</td>
                                <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$product->total_commission}}</span></td>
                                <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$product->total_sales}}</span></td>
                            </tr>                      
                        @endforeach
                    </tbody>
                </table>
            </div>            
        @else
            <div class="table-responsive col-xl-6 col-lg-12 mt-3">
                <h4 class="subtitle mb-3">ranking de afiliados por vendas</h4>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="text-align: center;">Foto</th>
                            <th style="text-align: center;">Nome</th>
                            <th style="text-align: center;">Comissão</th>
                            <th style="text-align: center;">Total de vendas</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($rankingAfiliates as $afiliates)
                            <tr>
                                <td class="photo-list" style="vertical-align:middle; text-align: center"><img src="{{ asset('storage/img/users/'.$afiliates->photo) }}" alt="{{$afiliates->name}}"></td>
                                <td style="vertical-align:middle; text-align: center">{{$afiliates->name}}</td>
                                <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$afiliates->total_commission}}</span></td>
                                <td style="vertical-align:middle; text-align: center">R$ <span class="floatValue">{{$afiliates->total_sales}}</span></td>
                            </tr>                      
                        @endforeach
                    </tbody>
                </table>
            </div>            
        @endif
    </div>
@endif
@endsection
