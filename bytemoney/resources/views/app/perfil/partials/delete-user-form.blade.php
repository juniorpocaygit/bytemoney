<section class="space-y-6">
    <header>
        <h2 class="mt-4">
            {{ __('Excluir conta') }}
        </h2>

        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
            {{ __('Depois que sua conta for excluída, todos os seus recursos e dados serão excluídos permanentemente. Antes de excluir sua conta, faça o download de todos os dados ou informações que deseja reter.') }}
        </p>
    </header>

    <x-button-danger
        x-data=""
        x-on:click.prevent="$dispatch('open-modal', 'confirm-user-deletion')"
        class="mt-4 mb-5"
        >{{ __('excluir conta') }}</x-button-danger>

    <x-modal name="confirm-user-deletion" :show="$errors->userDeletion->isNotEmpty()" focusable>
        <form method="post" action="{{ route('perfil.destroy') }}">
            @csrf
            @method('delete')

            <h4 class="">
                {{ __('Tem certeza de que deseja excluir sua conta?') }}
            </h4>

            <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
                {{ __('Depois que sua conta for excluída, todos os seus recursos e dados serão excluídos permanentemente. Digite sua senha para confirmar que deseja excluir permanentemente sua conta.') }}
            </p>

            <div class="mt-3">
                <x-input-label for="password" value="{{ __('senha') }}" class="sr-only" />

                <x-text-input
                    id="password"
                    name="password"
                    type="password"
                    class="mt-1 block w-3/4"
                    placeholder="{{ __('senha') }}"
                />

                <x-input-error :messages="$errors->userDeletion->get('password')" class="mt-2" />
            </div>

            <div class="mt-4 mb-5">
                <x-secondary-button  x-on:click="$dispatch('close')">
                    {{ __('cancelar') }}
                </x-secondary-button >

                <x-button-danger class="mt-sm-0 mt-3 ml-3 ms-sm-3 ms-0">
                    {{ __('excluir conta') }}
                </x-button-danger>
            </div>
        </form>
    </x-modal>
</section>
