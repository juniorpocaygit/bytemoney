@extends('app.layouts.main')

@section('titulo', 'Produtos')
@section('topo-conteudo')
    <h2 class="text-white mt-sm-4 mt-2 ms-sm-3 ms-4">Produtos</h2>
@endsection
@section('conteudo')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 d-flex justify-content-between align-items-center">
            <h3 class="mt-sm-4 mt-2 ms-sm-0 ms-4">Produto: {{Str::limit($product->title, 35);}}</h3>
            <div>
                <a href="{{route('produtos.index')}}"><x-secondary-button>{{ __('ver produtos') }}</x-secondary-button></a>
            </div>
        </div>
        <div class="col-12 mt-4">
              <div class="product-details-header d-flex justify-content-between alig-items-center">
                <div class="d-flex flex-row">
                  <div class="product-details-photo">
                    <img src="{{ asset('storage/img/products/'.$product->photo) }}" alt="{{$product->title}}">
                  </div>
                  <div class="ps-4 d-flex flex-column justify-content-center alig-items-center w-auto">
                    <h3>{{$product->title}}</h3>
                    <div class="product-detail-price d-flex justify-content-start align-items-center text-center">
                      <div class="product-price d-flex flex-column justify-content-center">
                        <p>preço produto</p>
                        <h3><span>R$</span>{{$product->price}}</h3>
                      </div>
                      <div class="product-commision ms-4 d-flex flex-column justify-content-center">
                        <p>comissão</p>
                        <h3 class="commission-price"><span>R$</span>{{$product->price_productor}}</h3>
                      </div>
                    </div>
                    <h4 class="mb-3">{{$product->category->name}}</h4>
                    @if ($product->productor->accessLevel->level == 80)
                      <a href="{{route('produtos.create')}}"><x-secondary-button>{{ __('afiliar-se') }}</x-secondary-button></a>  
                    @endif
                  </div>                  
                </div>
                  <div class="product-details-sold d-flex flex-column justify-content-center alig-items-center text-center">
                    <h5>Foram vendidos</h5>
                    <h1>253</h1>
                    <h5>deste produto.</h5>
                  </div>
              </div>
              <div class="row">
                <div class="col-md-9 product-details-body mt-4 mb-5 ps-5">
                  <h3>Regras de Afiliação:</h3>
                  <p>{{$product->afiliate_rules}}</p>
                  <h3 class="mt-4">Descrição do Produto:</h3>
                  <p>{{$product->afiliate_rules}}</p>
                </div>
                <div class="col-md-3 product-details-productor d-flex flex-column align-items-start justify-content-start mt-4 ps-4">
                    <h3>Produtor:</h3>
                    <div class="aside-photo-user mb-2">
                        <x-photo :photo="$product->productor->photo" :alt="$product->productor->name"/>
                    </div>
                    <p>{{ $product->productor->name }}</p>
                    <p class="cargo">{{ $product->productor->accessLevel->name }}</p>
                </div>
              </div>            
        </div>       
    </div>
</div>
@endsection