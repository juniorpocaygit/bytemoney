<x-guest-layout>
    <div class="guest-header mb-4">
        <h1>Cadastro</h1>
    </div>
    <form method="POST" action="{{ route('register') }}">
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
     
        <!-- Email Address -->
        <div class="d-flex flex-column mt-4">
            <x-input-label for="phone" :value="__('telefone')" />
            <x-text-input id="phone" type="text" name="phone" :value="old('phone')"  onkeyup="mascara(this, mtel)" />
            <x-input-error :messages="$errors->get('phone')" class="mt-2" />
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

        <!-- Nível de acesso -->
        <div class="d-flex justify-content-around my-4">
            <div>
                <label class="small me-4">
                    <input type="radio" name="access_level_id" value="1" checked>
                    Produtor
                </label>
                <label class="small">
                    <input type="radio" name="access_level_id" value="2">
                    Afiliado
                </label>
            </div>

        </div>
        <div class="d-flex flex-column justify-content-center align-items-center">
            <x-primary-button class="mt-4 mb-4">
                {{ __('criar conta') }}
            </x-primary-button>
            <a class="mt-1" href="{{ route('login') }}">
                {{ __('Já possui conta? Clique aqui.') }}
            </a>
        </div>

    </form>
</x-guest-layout>
