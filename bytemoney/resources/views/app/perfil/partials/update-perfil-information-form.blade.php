<section>
    <h2>
        {{ __('Dados do usuário') }}
    </h2>
    {{-- <form id="send-verification" method="post" action="{{ route('verification.send') }}" class="mt-2">
        @csrf
    </form> --}}

    <form method="post" action="{{ route('perfil.update') }}" enctype="multipart/form-data" class="mt-3">
        @csrf
        @method('put')

        <div>
            <x-input-label for="name" :value="__('nome')" />
            <x-text-input id="name" name="name" type="text" :value="old('name', $user->name)" required autofocus autocomplete="name" />
            <x-input-error class="mt-2" :messages="$errors->get('name')" />
        </div>

        <div>
            <x-input-label for="email" :value="__('e-mail')"  class="mt-2"/>
            <x-text-input id="email" name="email" type="email" :value="old('email', $user->email)" required autocomplete="username" disabled/>
            <x-input-error class="mt-2" :messages="$errors->get('email')" />

            @if ($user instanceof \Illuminate\Contracts\Auth\MustVerifyEmail && ! $user->hasVerifiedEmail())
                <div>
                    <p class="text-sm mt-2 text-gray-800 dark:text-gray-200">
                        {{ __('Seu email não foi verificado.') }}

                        <button form="send-verification" class="mt-3">
                            {{ __('Clique aqui para reenviarmos o email de verificação.') }}
                        </button>
                    </p>

                    @if (session('status') === 'verification-link-sent')
                        <p class="mt-2 font-medium text-sm text-green-600 dark:text-green-400">
                            {{ __('Um novo link de verificação foi enviado para seu email.') }}
                        </p>
                    @endif
                </div>
            @endif
        </div>

        <div>
            <x-input-label for="phone" :value="__('telefone')" />
            <x-text-input id="phone" name="phone" type="text" :value="old('phone', $user->phone)" required autofocus autocomplete="phone" />
            <x-input-error class="mt-2" :messages="$errors->get('phone')" />
        </div>

        <div>
            <x-input-label for="photo" :value="__('imagem perfil')" />
            <x-text-input id="photo" name="photo" type="file" :value="old('photo', $user->photo)" autofocus autocomplete="photo" />
            <x-input-error class="mt-2" :messages="$errors->get('photo')" />
        </div>

        <div class="mt-4 d-flex justify-content-start">
            <x-button-small>{{ __('salvar') }}</x-button-small>

            @if (session('status') === 'perfil-updated')
                <h5
                    x-data="{ show: true }"
                    x-show="show"
                    x-transition
                    x-init="setTimeout(() => show = false, 2000)"
                    class="ms-3 mt-2"
                >{{ __('salvo.') }}</h5>
            @endif
        </div>
    </form>
</section>
