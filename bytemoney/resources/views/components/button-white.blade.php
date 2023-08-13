<button {{ $attributes->merge(['type' => 'submit', 'class' => 'btn-white']) }}>
    {{ $slot }}
</button>
