@extends('app.layouts.main')

@section('titulo', 'Produtos')
@section('topo-conteudo')
    <h2 class="text-white mt-sm-4 mt-2 ms-sm-3 ms-4">Produtos</h2>
@endsection
@section('conteudo')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <h2 class="mt-sm-4 mt-2 ms-sm-0 ms-4">Criar Produto</h2>
            <form method="post" action="{{ route('produtos.store') }}" enctype="multipart/form-data" class="mt-4">
                @csrf

                <select name="category_id">
                    <option>Selecione uma categoria</option>
                    @foreach ($categories as $category)
                        <option value="{{$category->id}}" {{old('category_id')}}>{{$category->name}}</option>
                    @endforeach
                </select>
                <x-input-error class="mt-2" :messages="$errors->get('category_id')" />
    
                <input type="hidden" id="productor_id" name="productor_id" value="{{auth()->user()->id}}">
       
                <div>
                    <x-input-label for="title" :value="__('título do produto')" class="mt-4"/>
                    <x-text-input id="title" name="title" type="text" :value="old('title')" autofocus autocomplete="title" />
                    <x-input-error class="mt-2" :messages="$errors->get('title')" />
                </div>
                
                <div>
                    <x-input-label for="price" :value="__('valor do produto')" class="mt-3"/>
                    <x-text-input id="price" name="price" type="text" :value="old('price')" autofocus autocomplete="price" />
                    <x-input-error class="mt-2" :messages="$errors->get('price')" />
                </div>
            
                <div>
                    <x-input-label for="afiliate_rules" :value="__('regras de afiliação')" class="mt-3"/>
                    <x-text-area id="afiliate_rules" name="afiliate_rules" type="text" :value="old('afiliate_rules')" autofocus autocomplete="value" />
                    <x-input-error class="mt-2" :messages="$errors->get('afiliate_rules')" />
                </div>
             
                <div>
                    <x-input-label for="description" :value="__('descrição do produto')" class="mt-3"  />
                    <x-text-area id="description" name="description" type="text" :value="old('description')" autofocus autocomplete="description" />
                    <x-input-error class="mt-2" :messages="$errors->get('description')" />
                </div>
    
                <div>
                    <x-input-label for="photo" :value="__('foto do produto')" class="mt-3" />
                    <x-text-input id="photo" name="photo" type="file" :value="old('photo')" autofocus autocomplete="photo" />
                    <x-input-error class="mt-2" :messages="$errors->get('photo')" />
                </div>           
        
                <div class="mt-4 d-flex justify-content-start">
                    <x-button-small>{{ __('criar produto') }}</x-button-small>
        
                    @if (session('status') === 'product-add')
                        <h5
                            x-data="{ show: true }"
                            x-show="show"
                            x-transition
                            x-init="setTimeout(() => show = false, 2000)"
                            class="ms-3 mt-2"
                        >{{ __('produto adicionado com sucesso!') }}</h5>
                    @endif
                </div>
            </form>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="header-last-products d-flex justify-content-between aling-items-center mt-4">
                    <div class="col-lg-6 col-5 d-flex align-items-center">
                        <h6>últimos produtos cadastrados</h6>
                    </div>
                    <div class="col-lg-6 col-7 d-flex justify-content-end">
                        <a href="{{route('produtos.index')}}"><x-secondary-button>{{ __('ver produtos') }}</x-secondary-button></a>
                    </div>
                </div>
                <div class="row mt-4 pe-0">
                    @if ($products->isEmpty())
                        <div class="d-flex justify-content-center text-warning font-bold text-center">
                            <h2>Você ainda não cadastrou nenhum produto!</h2>
                        </div>
                    @else 
                        @foreach ($products as $product )
                            <div class="card-container px-3 mb-4 col-md-6">
                                <a href="{{ route('produtos.edit',['produto' => $product->id])}}">
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
                                                    <span>R$</span><h3 class="ms-1">{{$product->price}}</h3> 
                                                </div>
                                            </div>
                                            <div class="commission-product mt-1 mb-2">
                                                <div class="commission-price"><p>comissão</p></div>
                                                <div class="d-flex flex-row justify-content-center align-items-center">
                                                    <span>R$</span><h3 class="ms-1">{{$product->price_productor}}</h3> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection