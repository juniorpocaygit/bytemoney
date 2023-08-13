@extends('app.layouts.main')

@section('titulo', 'Produtos')
@section('topo-conteudo')
    <div class="topo-fixed">
        <h2>Produtos Afiliados</h2>
        <div class="ms-md-0 ms-3">
            <a href="{{route('afiliate.allproducts')}}"><x-button-white>{{ __('produtos afiliação') }}</x-button-white></a>
        </div>
    </div> 
@endsection
@section('conteudo')
<div class="container-fluid">
    <div class="row mt-4"> 
        @if ($myProducts->isEmpty()) 
            <h3>Você ainda não se afiliou a nenhum produto.</h3>
        @endif       
        @foreach ($myProducts as $product)             
            <div class="card-container px-3 mb-4 col-md-3">
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
                                    <span>R$</span><h3 class="ms-1 floatValue">{{$product->price_afiliate}}</h3> 
                                </div>
                            </div>
                        </div>
                    </div>
                </a>            
            </div>                
        @endforeach              
    </div>
</div>
@endsection