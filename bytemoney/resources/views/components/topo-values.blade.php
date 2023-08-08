@props(['title', 'value'])

<div class="d-flex flex-column align-items-end justify-content-center">
    <p class="text-white">{{ $title }}</p>
    <div class="value d-flex flex-row">
        <p class="text-white mt-2 me-1">R$</p>
        <h3 class="text-white">{{ $value }}</h3>
    </div>
</div>

