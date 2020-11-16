
$( document ).ready(function() {

  $('#live-chat').hide();
  $('#content_loader').load("/pacientes/");
});

function load_pacientes(){

    $('#live-chat').hide();
    $('#content_loader').load("/pacientes/");
    $('#nav_pacientes').attr("hidden",true);
    $('#nav_formularios').attr("hidden",true);
    $('#nav_reportes').attr("hidden",true);
    //$('#nav_timeline').attr("hidden",true);
}


function load_formularios(id_paciente){

    $('#content_loader').load("/forms/?id_patient=" + id_paciente);
    $('#live-chat').show();
    $('#nav_pacientes').attr("hidden",false);
    $('#nav_formularios').attr("hidden",true);
    $('#nav_reportes').attr("hidden",false);
    //$('#nav_timeline').attr("hidden",false);
}

function nav_formularios(){
  load_formularios($('#patient_id_value').attr("value"));
}

function deshabilitar_form(id_paciente, id_formulario){
  var r = confirm("Se deshabilitará el formulario. ¿Desea continuar?")

  if (r == true) {
     $('#content_loader').load("/forms/deactivate/?id_patient=" + id_paciente + "&id_form=" + id_formulario);
  }

}

function crear_form(id_paciente){
  $('#content_loader').load("/forms/create/?id_patient=" + id_paciente);
}

function load_formulario(id_paciente, id_formulario){
    $('#content_loader').load("/form/?id_patient=" + id_paciente + "&id_form=" + id_formulario);

    $('#nav_pacientes').attr("hidden",false);
    $('#nav_formularios').attr("hidden",false);
    $('#nav_reportes').attr("hidden",false);
    //$('#nav_timeline').attr("hidden",false);
}

function load_images(id_formulario){

    $('#content_loader_images').load("/imagenes/?id_form=" + id_formulario);

}

function delete_image(id_imagen, id_formulario){
  var r = confirm("Se borrará la imagen escogida. ¿Desea continuar?")

  if (r == true) {
    datos = "id_formulario=" + id_formulario + "&id_imagen=" + id_imagen;
          $.ajax({
              type: "GET",
              url: "/imagenes/delete",
              data: datos,
              success: function (data) {

                  alert("Imagen borrada con éxito");

                  load_images(id_formulario);


              },
              error: function(data) {
                  alert("Error borrando la información");
              }
          });
  }

}

function load_reportes(id_paciente){

    $('#content_loader').load("/reportes/?id_patient=" + id_paciente);
    $('#live-chat').show();
    $('#nav_pacientes').attr("hidden",false);
    $('#nav_formularios').attr("hidden",false);
    $('#nav_reportes').attr("hidden",true);
    //$('#nav_timeline').attr("hidden",false);
}

function nav_reportes(){
  load_reportes($('#patient_id_value').attr("value"));
}
