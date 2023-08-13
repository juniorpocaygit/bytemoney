<x-guest-layout>
    <div class="sale-product-header w-100 text-center d-flex justify-content-center align-items-center flex-column">
        <div class="w-100 sale-product-text">
            <h5>Você está comprando o produto:</h5>
        </div>
        <div class="sale-product-photo">
            <img class="img-fluid" src="{{ asset('storage/img/products/'.$afiliate->afilprod->photo) }}" alt="{{$afiliate->afilprod->title}}">
        </div>
        <div class="sale-product-title mt-2">
            <h4>{{$afiliate->afilprod->title}}</h4>
        </div>
        <div class="sale-product-price d-flex justify-content-center align-items-end mb-2">
            <p class="pb-2">R$</p>
            <h3>{{$afiliate->afilprod->price}}</h3>
        </div>
    </div>
    @php
        $url = request()->url();
        $segments = explode('/', $url);
        $link = last($segments);
    @endphp
    <form method="POST" action="{{ route('sale.post', ['link' => $link]) }}">
        @csrf

        <!-- Name -->
        <div class="d-flex flex-column">
            <x-input-label for="name" :value="__('nome')" />
            <x-text-input id="name" type="text" name="name" :value="old('name')" required autofocus autocomplete="name" />
            <x-input-error :messages="$errors->get('name')" class="mt-2" />
        </div>

        <!-- Email Address -->
        <div class="d-flex flex-column mt-4">
            <x-input-label for="email" :value="__('e-mail')" />
            <x-text-input id="email" type="email" name="email" :value="old('email')" required autocomplete="username" />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>
   
        <!-- Password -->
        <div class="d-flex flex-column mt-4">
            <x-input-label for="password" :value="__('senha')" />

            <x-text-input id="password" 
                            type="password"
                            name="password"
                            required autocomplete="new-password" />

            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>

        <!-- Confirm Password -->
        <div class="d-flex flex-column mt-4">
            <x-input-label for="password_confirmation" :value="__('confirmação de senha')" />
            <x-text-input id="password_confirmation" 
                            type="password"
                            name="password_confirmation" required autocomplete="new-password" />

            <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
        </div>

      
        <div class="d-flex flex-column justify-content-center align-items-center">
            <x-primary-button class="mt-4 mb-4">
                {{ __('finalizar compra') }}
            </x-primary-button>
        </div>

    </form>
</x-guest-layout>
