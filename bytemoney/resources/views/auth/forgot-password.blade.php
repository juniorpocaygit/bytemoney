<x-guest-layout>
    <div class="guest-header mb-4">
        <h1>Resetar<br>Senha</h1>
    </div>
    <div class="mb-4">
        <p>     
            {{ __('Esqueceu sua senha? Sem problemas. Basta nos informar seu endereço de e-mail e enviaremos um e-mail com um link de redefinição de senha que permitirá que você escolha um novo.') }}
        </p>
    </div>

    <!-- Session Status -->
    <x-auth-session-status class="mb-4" :status="session('status')" />

    <form method="POST" action="{{ route('password.email') }}">
        @csrf

        <!-- Email Address -->
        <div>
            <x-input-label for="email" :value="__('e-mail')" />
            <x-text-input id="email" type="email" name="email" :value="old('email')" required autofocus />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <div class="d-flex flex-column align-items-center justify-content-center mt-5">
            <x-primary-button>
                {{ __('enviar link') }}
            </x-primary-button>
            <a class="mt-5" href="{{ route('login') }}">
                {{ __('Lembrou sua senha? Clique aqui.') }}
            </a>
        </div>
    </form>
</x-guest-layout>
