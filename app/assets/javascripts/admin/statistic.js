$(document).ready(function() {
  $('#select_type').click(function() {
    var type_id = $('#select_type').val();
    if (type_id == 2) {
      $('#select_year').hide();
    }
    if (type_id == 1) {
      $('#select_year').fadeIn();
    }
  });
});
