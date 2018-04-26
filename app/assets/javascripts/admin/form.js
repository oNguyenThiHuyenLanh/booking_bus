$(document).ready(function () {
  var v = $('#booking-form').validate({
    rules: {
      schedule_route_id: {
        required: true
      },
      schedule_start_station_id: {
        required: true
      },
      schedule_final_station_id: {
        required: true
      },
      schedule_interval_id: {
        required: true
      },
      schedule_date: {
        required: true
      },
      time_start: {
        required: true
      },
      time_spent: {
        required: true
      },
      schedule_select_bus: {
        required: true
      },
      schedule_price: {
        required: true
      },
      des: {
        required: true
      },
      schedule_time_during: {
        required: true
      }
    },
    errorElement: 'span',
    errorClass: 'error',
    errorPlacement: function (error, element) {
      error.insertBefore(element);
    }
  });

  // $( '.datepicker' ).datepicker({dateFormat: 'dd/mm/yy'});

  $('.next-btn1').click(function () {
    if (v.form()) {
      $('.tab-pane').hide();
      $('#step2').fadeIn(1000);
      $('.progressbar-dots').removeClass('active');
      $('.progressbar-dots:nth-child(1)').addClass('active');
      $('.progressbar-dots:nth-child(2)').addClass('active');
    }
  });

  $('.next-btn2').click(function () {
    if (v.form()) {
      $('.tab-pane').hide();
      $('#step3').fadeIn(1000);
      $('.progressbar-dots').removeClass('active');
      $('.progressbar-dots:nth-child(1)').addClass('active');
      $('.progressbar-dots:nth-child(2)').addClass('active');
      $('.progressbar-dots:nth-child(3)').addClass('active');
    }
  });

  $('.submit-btn').click(function () {
    if (v.form()) {
      $('#loader').show();
      setTimeout(function () {
        $('#booking-form').html('<h2>Schedule was created successfully!</h2>');
      }, 1000);
      return false;
    }
  });

  $('.back-btn1').click(function () {
    $('.tab-pane').hide();
    $('#step1').fadeIn(1000);
    $('.progressbar-dots').removeClass('active');
    $('.progressbar-dots:nth-child(1)').addClass('active');
  });

  $('.back-btn2').click(function () {
    $('.tab-pane').hide();
    $('#step2').fadeIn(1000);
    $('.progressbar-dots').removeClass('active');
    $('.progressbar-dots:nth-child(1)').addClass('active');
    $('.progressbar-dots:nth-child(2)').addClass('active');
  });
});

$(document).on('turbolinks:load', function () {
  $('#schedule_route_id').bind('change', function () {
    if ($(this).val() != undefined) {
      var route_id = $(this).val();
      $.ajax({
        url: '/admin/schedules/new',
        data: {
          'route_id': route_id
        },
        dataType: 'json',
        type: 'GET',
        success: function (data) {
          var pick_origin = data['origin_pick'];
          var pick_destination = data['destination_pick'];

          if (pick_origin != '') {
            $('#schedule_start_station_id').empty();
            for (i in pick_origin) {
              $('#schedule_start_station_id').append('<option>' + pick_origin[i].name
                + '</option>');
            }
          }
          if (pick_destination != '') {
            $('#schedule_final_station_id').empty();
            for (i in pick_destination) {
              $('#schedule_final_station_id').append('<option>' +
                pick_destination[i].name + '</option>');
            }
          }
        }
      });
    }
  });
});
