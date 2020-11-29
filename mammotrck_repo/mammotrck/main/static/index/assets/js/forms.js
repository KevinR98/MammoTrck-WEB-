
$( document ).ready(function() {
  disable_historia_personal();
  disable_antecedentes();
  disable_historia_familiar();

  var frm = $('#form_historia_personal');
    frm.submit(function () {
        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {
                disable_historia_personal();
                alert("Cambios Guardados")
            },
            error: function(data) {
                alert("Error guardando la información");
            }
        });
        return false;
    });

    var frm2 = $('#form_antecedentes_go');
      frm2.submit(function () {
          $.ajax({
              type: frm2.attr('method'),
              url: frm2.attr('action'),
              data: frm2.serialize(),
              success: function (data) {
                  disable_antecedentes();
                  alert("Cambios Guardados")
              },
              error: function(data) {
                  alert("Error guardando la información");
              }
          });
          return false;
      });

      var frm3 = $('#form_historia_familiar');
        frm3.submit(function () {
            $.ajax({
                type: frm3.attr('method'),
                url: frm3.attr('action'),
                data: frm3.serialize(),
                success: function (data) {
                    disable_historia_familiar();
                    alert("Cambios Guardados")
                },
                error: function(data) {
                    alert("Error guardando la información");
                }
            });
            return false;
        });
});





function modify_historia_personal(id_paciente, id_formulario) {
  // Get the checkbox
  var checkBox = document.getElementById("edit1");
  // Get inputs


  //habilitar edit
  if (checkBox.checked == true){
    enable_historia_personal()

  } else {//deshabilitar edit

      var r = confirm("Podría tener cambios en el formulario, se perderán si continúa")

      if (r == true) {
         $('#content_loader').load("/form/?id_patient=" + id_paciente + "&id_form=" + id_formulario);
      }
      else{
        checkBox.checked = true;
      }


  }
}


function modify_antecedentes(id_paciente, id_formulario) {
  // Get the checkbox
  var checkBox = document.getElementById("edit2");
  // Get inputs


  //habilitar edit
  if (checkBox.checked == true){
    enable_antecedentes()

  } else {//deshabilitar edit

      var r = confirm("Podría tener cambios en el formulario, se perderán si continúa")

      if (r == true) {
         $('#content_loader').load("/form/?id_patient=" + id_paciente + "&id_form=" + id_formulario);
      }
      else{
        checkBox.checked = true;
      }


  }
}

function modify_historia_familiar(id_paciente, id_formulario) {
  // Get the checkbox
  var checkBox = document.getElementById("edit3");
  // Get inputs


  //habilitar edit
  if (checkBox.checked == true){
    enable_historia_familiar()

  } else {//deshabilitar edit

      var r = confirm("Podría tener cambios en el formulario, se perderán si continúa")

      if (r == true) {
         $('#content_loader').load("/form/?id_patient=" + id_paciente + "&id_form=" + id_formulario);
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


function setFilterA(element){
  value = element.value
  filtros = $('#camposA_id_values').attr("value")
  if (filtros == ""){
    filtros = []
  }
  else{
    filtros = filtros.split(",")
  }

  if (element.checked){
    filtros.push(value)
  }
  else{
    const index = filtros.indexOf(value);
    if (index > -1) {
      filtros.splice(index, 1);
    }
  }
  $('#camposA_id_values').attr("value", filtros)

}

function setFilterB(element){
  value = element.value
  filtros = $('#camposB_id_values').attr("value")
  if (filtros == ""){
    filtros = []
  }
  else{
    filtros = filtros.split(",")
  }

  if (element.checked){
    filtros.push(value)
  }
  else{
    const index = filtros.indexOf(value);
    if (index > -1) {
      filtros.splice(index, 1);
    }
  }
  $('#camposB_id_values').attr("value", filtros)

}
function setFilterC(element){
  value = element.value
  filtros = $('#camposC_id_values').attr("value")
  if (filtros == ""){
    filtros = []
  }
  else{
    filtros = filtros.split(",")
  }

  if (element.checked){
    filtros.push(value)
  }
  else{
    const index = filtros.indexOf(value);
    if (index > -1) {
      filtros.splice(index, 1);
    }
  }
  $('#camposC_id_values').attr("value", filtros)

}

function applyFilter(value, index, array){
  $('#' + value).attr("hidden", true)
}
function removeFilter(value, index, array){
  $('#' + value).attr("hidden", false)
}
function applyFiltersA(element){
  filtros = $('#camposA_id_values').attr("value")

  if (filtros == ""){
    alert("Por favor elija los campos sobre los que quiere aplicar los filtros")
    element.checked = false
  }
  else{
    filtros = filtros.split(",")
    if (element.checked){
      alert("Aplicando filtros...")
      filtros.forEach(applyFilter);
      $('#edit_filters1').attr("hidden", true)
    }
    else{
      alert("Desactivando filtros...")
      filtros.forEach(removeFilter);
      $('#edit_filters1').attr("hidden", false)
    }
  }

}
function applyFiltersB(element){
  filtros = $('#camposB_id_values').attr("value")

  if (filtros == ""){
    alert("Por favor elija los campos sobre los que quiere aplicar los filtros")
    element.checked = false
  }
  else{
    filtros = filtros.split(",")
    if (element.checked){
      alert("Aplicando filtros...")
      filtros.forEach(applyFilter);
      $('#edit_filters2').attr("hidden", true)
    }
    else{
      alert("Desactivando filtros...")
      filtros.forEach(removeFilter);
      $('#edit_filters2').attr("hidden", false)
    }
  }

}
function applyFiltersC(element){
  filtros = $('#camposC_id_values').attr("value")

  if (filtros == ""){
    alert("Por favor elija los campos sobre los que quiere aplicar los filtros")
    element.checked = false
  }
  else{
    filtros = filtros.split(",")
    if (element.checked){
      alert("Aplicando filtros...")
      filtros.forEach(applyFilter);
      $('#edit_filters3').attr("hidden", true)
    }
    else{
      alert("Desactivando filtros...")
      filtros.forEach(removeFilter);
      $('#edit_filters3').attr("hidden", false)
    }
  }

}
