<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>ByteMoney - @yield('titulo')</title>
        <meta charset="utf-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=K2D:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap4.min.css">

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap4.min.js"></script>  
        <script src="https://cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese.json"></script>
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