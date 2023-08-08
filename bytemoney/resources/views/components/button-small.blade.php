<button {{ $attributes->merge(['type' => 'submit', 'class' => 'btn-small']) }}>
    {{ $slot }}
</button>
