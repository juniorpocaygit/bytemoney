<section>
    <header>
        <h2>
            {{ __('Atualizar senha') }}
        </h2>

        <p class="mt-1">
            {{ __('Certifique-se de que sua conta esteja usando uma senha longa e aleatória para se manter segura.') }}
        </p>
    </header>

    <form method="post" action="{{ route('password.update') }}">
        @csrf
        @method('put')

        <div>
            <x-input-label for="current_password" :value="__('senha atual')" class="mt-4" />
            <x-text-input id="current_password" name="current_password" type="password" class="mt-0" autocomplete="current-password" />
            <x-input-error :messages="$errors->updatePassword->get('current_password')" class="mt-2" />
        </div>

        <div>
            <x-input-label for="password" :value="__('nova senha')" class="mt-2" />
            <x-text-input id="password" name="password" type="password" class="mt-0 block w-full" autocomplete="new-password" />
            <x-input-error :messages="$errors->updatePassword->get('password')" class="mt-2" />
        </div>

        <div>
            <x-input-label for="password_confirmation" :value="__('confirmação de senha')" class="mt-2" />
            <x-text-input id="password_confirmation" name="password_confirmation" type="password" class="mt-0" autocomplete="new-password" />
            <x-input-error :messages="$errors->updatePassword->get('password_confirmation')" class="mt-2" />
        </div>

        <div class="mt-4  d-flex justify-content-start">
            <x-button-small>{{ __('salvar') }}</x-button-small>

            @if (session('status') === 'password-updated')
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
