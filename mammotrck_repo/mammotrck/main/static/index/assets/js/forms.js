
window.onload = function() {
  disable_historia_personal();
  disable_antecedentes();
  disable_historia_familiar();

};





function modify_historia_personal() {
  // Get the checkbox
  var checkBox = document.getElementById("edit1");
  // Get inputs


  //habilitar edit
  if (checkBox.checked == true){
    enable_historia_personal()

  } else {//deshabilitar edit

      var r = confirm("Podría tener cambios en el formulario, se perderán si continúa")

      if (r == true) {
         location.reload();
      }
      else{
        checkBox.checked = true;
      }


  }
}


function modify_antecedentes() {
  // Get the checkbox
  var checkBox = document.getElementById("edit2");
  // Get inputs


  //habilitar edit
  if (checkBox.checked == true){
    enable_antecedentes()

  } else {//deshabilitar edit

      var r = confirm("Podría tener cambios en el formulario, se perderán si continúa")

      if (r == true) {
         location.reload();
      }
      else{
        checkBox.checked = true;
      }


  }
}

function modify_historia_familiar() {
  // Get the checkbox
  var checkBox = document.getElementById("edit3");
  // Get inputs


  //habilitar edit
  if (checkBox.checked == true){
    enable_historia_familiar()

  } else {//deshabilitar edit

      var r = confirm("Podría tener cambios en el formulario, se perderán si continúa")

      if (r == true) {
         location.reload();
      }
      else{
        checkBox.checked = true;
      }


  }
}


function disable_historia_personal(){

  document.getElementById("save1").hidden = true;
  document.getElementById("edit1").checked = false;

  var form = document.getElementById("form_historia_personal");
  var elements = form.elements;
  for (var i = 0, len = elements.length; i < len; ++i) {
      elements[i].disabled = true;
  }
}


function enable_historia_personal(){

  document.getElementById("save1").hidden = false;

  var form = document.getElementById("form_historia_personal");
  var elements = form.elements;
  for (var i = 0, len = elements.length; i < len; ++i) {
      elements[i].disabled = false;
  }
}


function disable_antecedentes(){

  document.getElementById("save2").hidden = true;
  document.getElementById("edit2").checked = false;

  var form = document.getElementById("form_antecedentes_go");
  var elements = form.elements;
  for (var i = 0, len = elements.length; i < len; ++i) {
      elements[i].disabled = true;
  }
}


function enable_antecedentes(){

  document.getElementById("save2").hidden = false;

  var form = document.getElementById("form_antecedentes_go");
  var elements = form.elements;
  for (var i = 0, len = elements.length; i < len; ++i) {
      elements[i].disabled = false;
  }
}


function disable_historia_familiar(){

  document.getElementById("save3").hidden = true;
  document.getElementById("edit3").checked = false;

  var form = document.getElementById("form_historia_familiar");
  var elements = form.elements;
  for (var i = 0, len = elements.length; i < len; ++i) {
      elements[i].disabled = true;
  }
}


function enable_historia_familiar(){

  document.getElementById("save3").hidden = false;

  var form = document.getElementById("form_historia_familiar");
  var elements = form.elements;
  for (var i = 0, len = elements.length; i < len; ++i) {
      elements[i].disabled = false;
  }
}
