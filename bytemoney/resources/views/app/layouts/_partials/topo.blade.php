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
            <div class="d-flex flex-column align-items-end justify-content-center">
                <p class="text-white">total de vendas</p>
                <div class="value d-flex flex-row">
                    <p class="text-white mt-2 me-1">R$</p>
                    <h3 id="totalSalesValue" class="text-white floatValue">{{ Session::get('total_sales') }}</h3>
                </div>
            </div>
            <div class="dados-separator"></div>
            <div class="d-flex flex-column align-items-end justify-content-center">
                @if (auth()->user()->accessLevel->level == '80')
                    <p class="text-white">valor de comissão</p>
                @else
                    <p class="text-white">valor a receber</p> 
                @endif
                <div class="value d-flex flex-row">
                    <p class="text-white mt-2 me-1">R$</p>
                    <h3 id="commissionValue" class="text-white floatValue">{{ Session::get('commission') }}</h3>
                </div>
            </div>
            <div class="dados-separator"></div>
            <div class="d-flex flex-column align-items-end justify-content-center">
                <p class="text-white">vendas últimos 30d</p>
                <div class="value d-flex flex-row">
                    <p class="text-white mt-2 me-1">R$</p>
                    <h3 id="sales30dValue" class="text-white floatValue">{{ Session::get('sales30d') }}</h3>
                </div>
            </div>
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