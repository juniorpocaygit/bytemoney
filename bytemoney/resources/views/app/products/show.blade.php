@extends('app.layouts.main')

@section('titulo', 'Produtos')
@section('topo-conteudo')
    <div class="topo-fixed">
        <h2>Produtos</h2>
    </div>
@endsection
@section('conteudo')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 d-flex justify-content-between align-items-center">
            <h3 class="subtitle-show mt-sm-4 mt-2 ms-sm-0 ms-4">Produto: {{Str::limit($product->title, 35);}}</h3>
            <div>
                @if (auth()->user()->accessLevel->level == 80)
                    <a href="{{route('afiliate.allproducts')}}"><x-secondary-button>{{ __('ver produtos') }}</x-secondary-button></a>
                @else
                    <a href="{{route('produtos.index')}}"><x-secondary-button>{{ __('ver produtos') }}</x-secondary-button></a>
                @endif
            </div>
        </div>
        <div class="col-12 mt-4">
            <div class="product-details-header">
                <div class="product-details-content">
                    <div class="product-details-photo">
                        <img src="{{ asset('storage/img/products/'.$product->photo) }}" alt="{{$product->title}}">
                    </div>
                    <div class="ps-sm-4 d-flex flex-column justify-content-center alig-items-center w-auto">
                        <h3>{{$product->title}}</h3>
                        <div class="product-detail-price">
                            <div class="product-price d-flex flex-column justify-content-center">
                                <p>preço produto</p>
                                <div class="d-flex justify-content-center">
                                    <span class="mt-2">R$</span>
                                    <h3 class="floatValue">{{$product->price}}</h3>
                                </div>
                            </div>
                            <div class="product-commision ms-4 d-flex flex-column justify-content-center">
                                <p>comissão</p>
                                @if (auth()->user()->accessLevel->level == '80')
                                    <div class="d-flex justify-content-center">
                                        <span class="mt-2">R$</span>
                                        <h3 class="commission-price floatValue">{{$product->price_afiliate}}</h3>
                                    </div>                              
                                @else
                                    <div class="d-flex justify-content-center">
                                        <span class="mt-2">R$</span>
                                        <h3 class="commission-price floatValue">{{$product->price_productor}}</h3>
                                    </div>                                     
                                @endif                            
                            </div>
                        </div>
                        <h4 class="mb-3">{{$product->category->name}}</h4>                   
                       

                        @if (auth()->user()->accessLevel->level != '90')
                            @php
                                $id = null;
                                $link = null;
                                foreach ($product->afiliates as $affiliate) {
                                    if ($affiliate->pivot->user_id == auth()->user()->id && $affiliate->pivot->products_id == $product->id) {
                                        $id = $affiliate->pivot->id;
                                        $link = $affiliate->pivot->link;
                                    }
                                }
                            @endphp

                            @if ($id && $link)
                                <form id="form_{{$id}}" action="{{route('desfiliate.products', ['id' => $id])}}" method="POST">
                                    @csrf
                                    @method('DELETE')
                                    <a href="#" onclick="document.getElementById('form_{{$id}}').submit()"><x-button-danger>{{ __('desafiliar-se') }}</x-button-danger></a>
                                </form>
                                <a href="{{ url('/vendas/'.$link)}}" target="blank">
                                    <h4 class="mt-3"><span class="sale-link">Link de venda</span></h4>
                                </a>
                            @else    
                                <a href="{{route('afiliate.products', ['id' => $product->id])}}"><x-secondary-button>{{ __('afiliar-se') }}</x-secondary-button></a>
                            @endif                           
                        @endif
                    </div>                  
                </div>
                <div class="product-details-sold d-flex flex-column justify-content-center alig-items-center text-center">
                    <h5>Foram vendidos</h5>
                    <h1>{{$salesProduct->sales_product ?? 0}}</h1>
                    <h5>deste produto.</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9 product-details-body mt-4 mb-sm-5 mb-3 ps-sm-5">
                <h3>Regras de Afiliação:</h3>
                <p>{{$product->afiliate_rules}}</p>
                <h3 class="mt-4">Descrição do Produto:</h3>
                <p>{{$product->afiliate_rules}}</p>
                </div>
                <div class="col-md-3 product-details-productor d-flex flex-column align-items-start justify-content-start mt-sm-4 mb-5 ps-sm-4">
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