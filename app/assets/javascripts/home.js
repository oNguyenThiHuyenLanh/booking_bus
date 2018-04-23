$(document).ready(function() {
  $('#search_form').validate({
    rules :{
      'search[origin_address]': {
        required: true,
      },
      'search[destination_address]': {
        required: true,
      },
      'search[date]': {
        required: true,
      },
      'search[interval]': {
        required: true,
      }
    },
    messages :{
      'search[origin_address]' : {
        required : I18n.t('select-origin-address'),
      },
      'search[destination_address]' : {
        required : I18n.t('select-destination-address'),
      },
      'search[date]': {
        required : I18n.t('select-date'),
      },
      'search[interval]': {
        required: I18n.t('select-interval'),
      }
    }
  });
});

$(document).on('click', '#search_form', function() {
  setTimeout(function() {
    $('label.error').fadeOut('slow');
  }, 2000);
});
