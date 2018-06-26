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
  $(document).on('click', '.create-frame-bus', function(){
    var data_name = $('#input-name-bus').val();
    if(data_name == ''){
      alert(I18n.t('admin.bus.empty_name'));
    }else{
      var data_model = $(this).attr('data-model');
      $.ajax({
        url: '/admin/buses',
        type: 'POST',
        dataType: 'script',
        data: {
          name: data_name,
          model_id: data_model
        }
      });
    }
  });
});
