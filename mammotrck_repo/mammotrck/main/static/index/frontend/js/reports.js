function submit_form_edit_report(id_formulario){
  var frm = $('#form_edit_report' + id_formulario);
  var contenido = $('#contenido-text' + id_formulario);

  if(!contenido.val().trim()){
    alert ('Datos inválidos')
    return false
  }

  datos = frm.serialize();
  datos = datos + "&id_formulario=" + id_formulario + "&contenido=" + contenido.val();

        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: datos,
            success: function (data) {

                alert("Reporte editado con éxito");


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

function delete_report(id_formulario){
  var r = confirm("Se borrará el reporte escogido. ¿Desea continuar?")

  if (r == true) {
    datos = "id_formulario=" + id_formulario;
          $.ajax({
              type: "GET",
              url: "/reportes/delete",
              data: datos,
              success: function (data) {

                  alert("Reporte borrado con éxito");


                  component = $('#component_value').attr("value");

                  if(component == 'reportes'){
                    load_reportes($('#patient_id_value').attr("value"));
                  }

                  select = $('#inp_form');
                  select.append(new Option(id_formulario, id_formulario));


              },
              error: function(data) {
                  alert("Error borrando la información");
              }
          });
  }

}
