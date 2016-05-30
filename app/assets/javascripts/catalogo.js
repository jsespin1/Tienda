//---------------------------------------PAGINACION------------------------------------------//


$(document).ready(function(){
  var total = $(".catalogo").find("ul").length
  $(".pagina_actual").val(1)
  var prods_por_pag = 1
  $(".por_pagina").val(prods_por_pag)
  paginas = Math.ceil(total/prods_por_pag)
  var actual = $(".pagina_actual").val()

  var links = ""
  for(var i = 1; i<=paginas; i++){
    links += "<a href='#' data-page-number="+i+"  id="+i+" class='num_pagina'>"+i+"</div>"
  }
  if (paginas > 1){
    $(".paginas").html(links);
  }else{
    $(".link-paginas").html("");
  }

  set_ocultar();
  mostrarPagina(actual, prods_por_pag)
})

function mostrarPagina(pagina, por_pag){
  var primero = (pagina * por_pag) - (por_pag - 1)
  var ultimo = pagina * por_pag
  for (var i = primero; i <= ultimo; i++) {
    mostrarProductos(i);
  };
  $(".actual").removeClass("actual")
  $("#"+pagina).addClass("actual");
  $(".pagina_actual").val(pagina)
  if (pagina == 1){
    $(".anterior").addClass("desactivado");
  } else {
    $(".anterior").removeClass("desactivado");
  }

  if (pagina == paginas){
    $(".siguiente").addClass("desactivado");
  } else {
    $(".siguiente").removeClass("desactivado");
  }
}

function mostrarProductos(i){
  $($(".catalogo").find("ul")[i-1]).removeClass("ocultar");
  $($(".catalogo").find("ul")[i-1]).addClass("mostrar");
}

function set_ocultar(){
  $(".catalogo").find("ul").addClass("ocultar");
}

function ocultar_todos(){
  $(".mostrar").addClass("ocultar").removeClass("mostrar");
}


$('.anterior').click(function(){
    var pag_actual = parseInt($(".pagina_actual").val())
    if (pag_actual > 1){
      $(".pagina_actual").val(pag_actual-1)
      ocultar_todos();
      por_pag = parseInt($(".por_pagina").val())
      mostrarPagina(pag_actual-1, por_pag)
    }
});


$('.siguiente').click(function(){
    var pag_actual = parseInt($(".pagina_actual").val())
    if(pag_actual < paginas){
      $(".pagina_actual").val(pag_actual+1)
      ocultar_todos();
      por_pag = parseInt($(".por_pagina").val())
      mostrarPagina(pag_actual+1, por_pag)      
    }
});


$(document).on("click", "a.num_pagina" , function() {
    var $page_number= $(this);
    var pagina = parseInt($page_number.data('pageNumber'));
    ocultar_todos();
    por_pag = parseInt($(".por_pagina").val())
    mostrarPagina(pagina, por_pag)

});

//---------------------------------------INFO PRODUCTO - MODAL------------------------------------//

$(function(){
  var dialog, form

  var $productLinks = $('.fila-prod li');

  //Le asociamos un evento a la variable JQuery. En click se ejecuta la funcion 
  //definida y recibe como parámetro el evento (ev)
  $productLinks.on('click', function(ev){
    //Queremos hacer un llamado AJAX
    //Queremos leer atributo data. para obtenerlo tenemos que obtener el <a>
    //PreventDefault hace que los eventos no ejecuten sus eventos por default
    //Como un link te lleve a otra página
    ev.preventDefault();

    var $link = $(this);
    //Obtenemos info emdiante la func por defecto JQuery .data -> Camel Case 
    //Camel Case -> cardSourceUrl en vez de card-source-url
    var url = $link.data('productSourceUrl');
    //Ahora hacemos el llamado AJAX a esta dirección, hay dos sintaxis para método .ajax
    $.ajax({
      "url": url,
      //Ver documentacion JQuery ajax para success
      "success": function(data,ts, jg){
        console.log("SUCCESS!", data, ts, jg);
        //Agregamos la información obtenida llamando a funcion construida por nos mas abajo
        buildProduct(data);

      },
      "error": function(jg, st, er){
        console.log("Error: (", jg, st, er);
      }
    });


  });

  //Ahora funcion que construye HTML en base a lo rescatado por AJAX
  var buildProduct = function(productInfo) {
    $div = $('<div class="item-modal-info">' + 
        "<h1>" + productInfo.tipo + "</ h1>" +
        "<h2>" + productInfo.name + "</ h2>" + 
        "<p>" + productInfo.desc + "</p>" + 
        '</div>');

    $('#myModal').html($div)
    $('#myModal').modal('show')
    //ACA HAY QUE METERLE MODAL
  }
  //LO que viene ahora es otra forma de modal dialog no esta funiconando
  
  modal = $( "#modal-form" ).dialog({
    autoOpen: false,
    height: 300,
    width: 350,
    modal: true,
    buttons: {
      Close: function() {
        dialog.dialog( "close" );
      }
    },
    close: function() {
      form[ 0 ].reset();
      //allFields.removeClass( "ui-state-error" );
    }
  });

  $( ".product-container" ).on( "click", function() {
      modal.dialog( "open" );
  });
});










