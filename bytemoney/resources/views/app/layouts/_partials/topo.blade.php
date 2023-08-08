<div class="topo">
    <button id="menu"><i class="bi bi-list text-white"></i></button>
    <div class="mobile-brand">
        <x-application-logo/>
    </div>
    <div class="topo-decor">
        <img class="img-fluid" src="{{ asset('storage/img/aro.png') }}" alt="">
    </div>
    <div class="topo-container d-flex align-items-start justify-content-between">
        <div class="topo-dados d-flex align-items-center justify-content-around">
            <x-topo-values :title="'total de vendas'" value='5625,00'/>
            <div class="dados-separator"></div>
            <x-topo-values :title="'comissão acumulada'" value='1384,00'/>
            <div class="dados-separator"></div>
            <x-topo-values :title="'últimos 30d'" value='428,00'/>
         </div>
        <div class="topo-sign-out d-flex align-items-center justify-content-end text-white">
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <a href="#" onclick="event.preventDefault();
                this.closest('form').submit();"><h5 class="text-white"><i class="bi bi-box-arrow-left text-white"></i> sair</h5></a>
            </form>
        </div>
    </div>
</div>