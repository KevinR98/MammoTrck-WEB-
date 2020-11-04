
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
    $('#nav_timeline').attr("hidden",true);
}


function load_formularios(id_paciente){

    $('#content_loader').load("/forms/?id_patient=" + id_paciente);
    $('#live-chat').show();
    $('#nav_pacientes').attr("hidden",false);
    $('#nav_formularios').attr("hidden",true);
    $('#nav_reportes').attr("hidden",false);
    $('#nav_timeline').attr("hidden",false);
}

function nav_formularios(){
  load_formularios($('#patient_id_value').attr("value"));
}

function deshabilitar_form(id_paciente, id_formulario){
  $('#content_loader').load("/forms/deactivate/?id_patient=" + id_paciente + "&id_form=" + id_formulario);
}

function crear_form(id_paciente){
  $('#content_loader').load("/forms/create/?id_patient=" + id_paciente);
}

function load_formulario(id_paciente, id_formulario){
    $('#content_loader').load("/form/?id_patient=" + id_paciente + "&id_form=" + id_formulario);

    $('#nav_pacientes').attr("hidden",false);
    $('#nav_formularios').attr("hidden",false);
    $('#nav_reportes').attr("hidden",false);
    $('#nav_timeline').attr("hidden",false);
}

function load_reportes(id_paciente){

    $('#content_loader').load("/reportes/?id_patient=" + id_paciente);
    $('#live-chat').show();
    $('#nav_pacientes').attr("hidden",false);
    $('#nav_formularios').attr("hidden",false);
    $('#nav_reportes').attr("hidden",true);
    $('#nav_timeline').attr("hidden",false);
}

function nav_reportes(){
  load_reportes($('#patient_id_value').attr("value"));
}
