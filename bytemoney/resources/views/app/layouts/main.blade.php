<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>ByteMoney - @yield('titulo')</title>
        <meta charset="utf-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=K2D:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>

    <body>
        @include('app.layouts._partials.topo')
        @include('app.layouts._partials.aside')
        <div class="topo-conteudo">
            @yield('topo-conteudo')
        </div>
        <div class="conteudo">
            @yield('conteudo')
        </div>
    </body>
</html>