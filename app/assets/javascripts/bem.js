$(document).on('ready page:load', function() {

  $(this).on('click', '#btn-gera-patrimonio', function() {
    $.get(root_path + 'bens/gera_patrimonio', function(rt) {
      $('#bem_patrimonio').val(rt);
    })
  })

  $(this).on('change', '#bem_tipo_bem_id', function() {
    opc = $(this).val();
    if (opc != '2') {
      $('.section-patrimonio').hide();
    } else {
      $('.section-patrimonio').show();
    }
  })
  $('#bem_tipo_bem_id').trigger('change');
});
