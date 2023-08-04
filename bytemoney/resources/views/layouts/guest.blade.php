<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'ByteMoney') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=K2D:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="container-fluid">
        <div class="row">
            <div class="guest-left col-lg-6 d-flex flex-column justify-content-center align-items-center">
                <div class="guest-container">
                    <a href="/">
                        <x-application-logo/>
                    </a>
                    <h5 class="text-white text-center mx-auto mt-3 w-75">Nunca foi tão fácil transformar o que você sabe em um negócio digital.</h5>
                    <div class="welcome d-flex justify-content-end pe-2">
                        <h2>Seja bem vindo!</h2>
                    </div>
                </div>
                <div class="aro">
                    <img class="img-fluid" src="{{ asset('storage/img/aro.png') }}" alt="">
                </div>
                
            </div> 
            <div class="vh-100 col-xl-6 col-12 d-flex flex-column justify-content-center align-items-center">
                <div class="guest-slot">
                    <div class="brand-logo">
                        <img class="img-fluid" src="{{ asset('storage/img/logo.png') }}" alt="">
                    </div>
                    {{ $slot }}
                </div>
            </div>
        </div>
    </body>
</html>
