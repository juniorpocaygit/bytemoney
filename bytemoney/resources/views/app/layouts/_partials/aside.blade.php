<div class="aside">
    <div class="aside-container-topo d-flex flex-column align-items-center justify-content-center w-100 mt-4">
        <div class="aside-topo w-75">
            <x-app-logo/>
            <div class="aside-user d-flex flex-column align-items-center justify-content-center mt-4">
                <div class="aside-photo-user mb-2">
                    <x-photo :photo="auth()->user()->photo" :alt="auth()->user()->name"/>
                </div>
                <p>{{ auth()->user()->name }}</p>
                <p class="cargo">{{ auth()->user()->accessLevel->name }}</p>
            </div>
        </div>
        <nav class="nav-bar">
            @if ( auth()->user()->accessLevel->level == 90)
                <div class="produtor">
                    <ul>
                        <a href="{{route('app.home')}}"><li><i class="bi bi-person"></i>Dashboard</li></a>
                        <a href="{{route('perfil.edit')}}"><li><i class="bi bi-person"></i>Perfil</li></a>
                        <a href="{{route('produtos.index')}}"><li><i class="bi bi-box-seam"></i>Produtos</li></a>
                        <a href=""><li><i class="bi bi-people"></i>Afiliados</li></a>
                        <a href=""><li><i class="bi bi-bar-chart"></i>Financeiro</li></a>
                        <div class="nav-sing-out">
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <a href="#" onclick="event.preventDefault();
                                this.closest('form').submit();"><li><i class="bi bi-box-arrow-left"></i>Sair</li></a>
                            </form>
                        </div>
                    </ul>
                </div>
            @else    
                <div class="afiliado">
                    <ul>
                        <a href="{{route('app.home')}}"><li><i class="bi bi-person"></i>Dashboard</li></a>
                        <a href="{{route('perfil.edit')}}"><li><i class="bi bi-person"></i>Perfil</li></a>
                        <a href=""><li><i class="bi bi-box-seam"></i>Produtos</li></a>
                        <a href=""><li><i class="bi bi-people"></i>Clientes</li></a>
                        <a href=""><li><i class="bi bi-bar-chart"></i>Financeiro</li></a>
                        <div class="nav-sing-out">
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <a href="#" onclick="event.preventDefault();
                                this.closest('form').submit();"><li><i class="bi bi-box-arrow-left"></i>Sair</li></a>
                            </form>
                        </div>
                    </ul>
                </div>
            @endif
        </nav>
        <div class="aside-footer">
            <i class="bi bi-instagram"></i>
            <i class="bi bi-facebook"></i>
            <i class="bi bi-whatsapp"></i>
        </div>
    </div>
</div>