@props(['value'])

<label {{ $attributes->merge(['class' => 'label-form']) }}>
    {{ $value ?? $slot }}
</label>
