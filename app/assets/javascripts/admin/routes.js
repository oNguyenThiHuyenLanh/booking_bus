$(document).on('turbolinks:load', function() {
  $('.selectpicker').on('change', function() {
    var data_route = $('#select-routes').val();
    var data_interval = $('#select-interval').val();
    $.ajax({
      url: '/admin/schedules',
      type: 'GET',
      dataType: 'script',
      data: {
        route_ids: data_route,
        interval_ids: data_interval
      }
    });
  });
});
