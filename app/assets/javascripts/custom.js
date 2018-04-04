$(document).ready(function() {
  $('#e1').select2({
    placeholder: I18n.t('select-origin-address'),
    allowClear: true
  });
  $('#e2').select2({
    placeholder: I18n.t('select-destination-address'),
    allowClear: true
  });
  $('#e3').select2({
    placeholder: I18n.t('select-interval'),
    allowClear: true
  });

  $('#datepicker').datepicker();

  $('#signup_modal').click(function(){
    $('#login').modal('hide');
  });
  
  $('#login_modal').click(function(){
    $('#signup').modal('hide');
  });
  
  $('#forget_modal').click(function(){
    $('#login').modal('hide');
  });
  
  $('#login_modal2').click(function(){
    $('#forget_password').modal('hide');
  });

  $('.seat-location').click(function(){
    $(this).toggleClass('selected');
    var seat_id = event.target.id;
    var selected = $('#' + seat_id).hasClass('selected');
    if(selected) {
      var selected_seat = '<span class="selected-seat" id="'+
        seat_id + '">'+ seat_id + '</span>';
      $('.wrap-selected-seat').append(selected_seat);
    }else {
      $('.wrap-selected-seat').find( '#' + seat_id).remove();
    }
  });

  $('.add-filter-tag').click(function(){
    addFilterTag();
  });

  $('.book').click(function() {
    var id = $(this).attr('data-id');
    $('#' + id).toggle();
  });
});

$(document).on('click', '.tag', function(){
  removeFilterTag();
});

function addFilterTag() {
  var id = event.target.id;
  var tag = $('input[id="' + id + '"]:checked').val();
  var label = '<span class="label label-primary tag"'
    + ' id="' + id + '">' + tag + '&nbsp;x</span>';
  if(tag!=null) {
    $('.filter-tag').append(label);
  } else {
    remove(id);
  }
}

function removeFilterTag() {
  var id = event.target.id;
  var input = $('input[id="' + id + '"]');
  input.attr('checked', false);
  remove(id);
}

function remove(id) {
  var selector = '.filter-tag ' + ' #' + id;
  $(selector).remove();
}
