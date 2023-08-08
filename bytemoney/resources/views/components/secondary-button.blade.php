<button {{ $attributes->merge(['type' => 'button', 'class' => 'btn-small']) }}>
    {{ $slot }}
</button>
