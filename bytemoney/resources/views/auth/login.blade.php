<x-guest-layout>
    <div class="guest-header mb-4">
        <h1>Login</h1>
    </div>
    <!-- Session Status -->
    <x-auth-session-status class="mb-4" :status="session('status')" />

    <form method="POST" action="{{ route('login') }}">
        @csrf

        <!-- Email Address -->
        <div>
            <x-input-label for="email" :value="__('e-mail')" />
            <x-text-input id="email" type="email" name="email" :value="old('email')" required autofocus autocomplete="username" />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <!-- Password -->
        <div class="mt-4">
            <x-input-label for="password" :value="__('senha')" />

            <x-text-input id="password"                             
                            type="password"
                            name="password"
                            required autocomplete="current-password" />

            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>
        <div class="d-flex flex-column align-items-center justify-content-center mt-5">
            <x-primary-button>
                {{ __('entrar') }}
            </x-primary-button>
            <a class="create-register mt-5" href="{{ route('register') }}">
                {{ __('Criar Conta.') }}
            </a>
            @if (Route::has('password.request'))
                <a class="mt-4" href="{{ route('password.request') }}">
                    {{ __('Esqueceu sua senha?') }}
                </a>
            @endif
        </div>
    </form>
</x-guest-layout>
