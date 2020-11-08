(function () {

    $('#live-chat header').on('click', function () {

        $('.chat').slideToggle(300, 'swing');
        $('.chat-message-counter').fadeToggle(300, 'swing');

    });



})();


window.onload = function() {
  $('.chat').hide();

};


function submit_form_report(){

  var frm = $('#form_report');
  var select = $('#inp_form')
  var contenido = $('#contenido')

  if(select.val() == '' || !contenido.val().trim()){
    alert ('Datos inválidos')
    return false
  }

        $.ajax({
            type: frm.attr('method'),
            url: "/reportes/create",
            data: frm.serialize(),
            success: function (data) {

                alert("Reporte guardado con éxito");

                select.find('option:selected').remove();
                contenido.val('');

                component = $('#component_value').attr("value");

                if(component == 'reportes'){
                  load_reportes($('#patient_id_value').attr("value"));
                }
            },
            error: function(data) {
                alert("Error guardando la información");
            }
        });

}
