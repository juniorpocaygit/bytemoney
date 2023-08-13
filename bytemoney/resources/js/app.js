import './bootstrap';

import Alpine from 'alpinejs';

window.Alpine = Alpine;

Alpine.start();


// Máscara número de telefone
let v_obj = null;
let v_fun = null;
function mascara(o,f){
    v_obj=o
    v_fun=f
    setTimeout(execmascara(),1)
}
function execmascara(){
    v_obj.value=v_fun(v_obj.value)
}
function mtel(v){
    v=v.replace(/\D/g,""); //Remove tudo o que não é dígito
    v=v.replace(/^(\d{2})(\d)/g,"($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    v=v.replace(/(\d)(\d{4})$/,"$1-$2"); //Coloca hífen entre o quarto e o quinto dígitos
    return v;
}
function id( el ){
	return document.getElementById( el );
}
window.onload = function(){
	if (id('phone')) {
			id('phone').onkeyup = function(){
			mascara( this, mtel );
		}
	}
}

//Toggle menu
$(document).ready(function() {
    $('#menu, .nav-bar').click(function() {
        $('.aside').toggleClass('slide-left');
    });

    //Inclui a classe active ao nav-bar
    let uri = window.location.pathname; 
    let segments = uri.split('/'); 
    let page = segments[1];
    let searchTerm = page;

    $('.nav-bar li').each(function() {
        if ($(this).text().toLowerCase().includes(searchTerm)) {
            $(this).addClass('ativo');
        }
    });

    // substitui ponto por virgula
    $('.floatValue').each(function() {
        var originalValue = parseFloat($(this).text());
        var formattedValue = originalValue.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
        $(this).text(formattedValue);
    });    

    //faz o select da categoria de produtos
    $('#category_id').change(function () {
        var selectedCategoryId = $(this).val();
        if (selectedCategoryId) {
            var redirectUrl = '/produtos/categoria/' + selectedCategoryId; 
            window.location.href = redirectUrl;
        }
    });

    //Recarrega os valores de vendas
    let totalSales = "{{ Session::get('total_sales') }}";
    let sales30d = "{{ Session::get('sales30d') }}";
    var commission = "{{ Session::get('commission') }}";
    $('#commissionValue').val(commission);    
    $('#totalSalesValue').val(totalSales);
    $('#sales30dValue').val(sales30d);

    //carrega o datatables
    console.log("Iniciando DataTables");
    $('#dataTable').DataTable({
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.25/i18n/Portuguese.json" // Caminho para o arquivo de tradução
        }
    });

});


  