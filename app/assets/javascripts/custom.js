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

  var currentDate = new Date();
  var formatDate = I18n.t('js.date.formats.date_month_year');
  $('#search_date').datepicker({format: formatDate})
    .datepicker('setDate', currentDate);
  $('#search_date').parent().datepicker({
    autoclose: true,
    clearBtn: true,
    daysOfWeekHighlighted: '0,6',
    format: formatDate,
    language: I18n.locale,
    startDate: currentDate,
    weekStart: 1});
});

$(document).on('turbolinks:load', function(){
  $('.book').click(function() {
    var id = $(this).attr('data-schedule');
    $('#schedule-' + id).toggle();
  });
});