$( document ).ready(function() {
  lista_ids = $('#forms_id_values').attr("value");
  lista_ids = lista_ids.split(",");

  select = $('#inp_form');
  select.empty();

  var i;
  for (i = 0; i < lista_ids.length; ++i) {
      select.append(new Option(lista_ids[i], lista_ids[i]));
  }



});
