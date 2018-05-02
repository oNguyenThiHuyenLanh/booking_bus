$(document).on('turbolinks:load', function() {
  $('.selectpicker').on('change', function() {
    var data_road = $('#select-road').val();
    var data_interval = $('#select-interval').val();
    $.ajax({
      url: '/admin/schedules',
      type: 'GET',
      dataType: 'script',
      data: {
        road_ids: data_road,
        interval_ids: data_interval
      }
    });
  });
});
