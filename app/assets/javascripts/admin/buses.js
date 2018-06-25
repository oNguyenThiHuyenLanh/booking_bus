$(document).on('turbolinks:load', function() {
  $('.select-bus').on('change', function() {
    var data_seats = $('#bus_seats').val();
    var data_floors = $('#bus_floors').val();
    $.ajax({
      url: '/admin/buses/new',
      type: 'GET',
      dataType: 'script',
      data: {
        no_seats: data_seats,
        no_floors: data_floors
      }
    });
  });
});
