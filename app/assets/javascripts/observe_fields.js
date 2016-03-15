jQuery(function($) {$("#pessoa_documento").change(function() {
    // make a POST call and replace the content
    var documento = $('#pessoa_documento').val();
    jQuery.post(gon.suburi+"/pessoas/atributos_documento/?documento=" + documento, function(data){
      $("#atributos_documento").html(data);   
    });
  });
});

jQuery(function($) {$("#pessoa_deficiente").change(function() {
    // make a POST call and replace the content
    var deficiente = $('#pessoa_deficiente').val();
    jQuery.post(gon.suburi+"/pessoas/atributos_deficiente/?deficiente=" + deficiente, function(data){
      $("#atributos_deficiente").html(data);   
    });
  });
});


jQuery(function($) {$("#ocorrencia_tipo_ocorrencia").change(function() {
    // make a POST call and replace the content
    var tipo_ocorrencia = $('#ocorrencia_tipo_ocorrencia').val();
    jQuery.post(gon.suburi+"/ocorrencias/desdobramento_tipo_ocorrencia/?tipo_ocorrencia=" + tipo_ocorrencia, function(data){
      $("#desdobramento_tipo_ocorrencia").html(data);   
    });
  });
});

jQuery(function($) {$("#desdobramento_tipo").change(function() {
    // make a POST call and replace the content
    var tipo = $('#desdobramento_tipo').val();
    jQuery.post(gon.suburi+"/desdobramentos/atributos_tipo/?tipo=" + tipo, function(data){
      $("#atributos_tipo").html(data);   
    });
  });
});