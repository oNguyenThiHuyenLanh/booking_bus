$(document).ready(function() {
  $('#origin_address').select2({
    placeholder: I18n.t('select-origin-address'),
    allowClear: true
  });

  $('#destination_address').select2({
    placeholder: I18n.t('select-destination-address'),
    allowClear: true
  });

  $('#interval').select2({
    placeholder: I18n.t('select-interval'),
    allowClear: true
  });

  $('#date').datepicker({dateFormat: 'dd-mm-yyyy'});

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
