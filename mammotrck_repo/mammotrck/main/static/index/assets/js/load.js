
$( document ).ready(function() {

  $('#live-chat').hide();
  $('#content_loader').load("/pacientes/");
});

function load_pacientes(){

    $('#live-chat').hide();
    $('#content_loader').load("/pacientes/");
}

function load_formularios(id_paciente){

    $('#content_loader').load("/forms/?id_patient=" + id_paciente);
    $('#live-chat').show();
}

function deshabilitar_form(id_paciente, id_formulario){
  $('#content_loader').load("/forms/deactivate/?id_patient=" + id_paciente + "&id_form=" + id_formulario);
}

function crear_form(id_paciente){
  $('#content_loader').load("/forms/create/?id_patient=" + id_paciente);
}

function load_formulario(id_paciente, id_formulario){
    $('#content_loader').load("/form/?id_patient=" + id_paciente + "&id_form=" + id_formulario);
}
