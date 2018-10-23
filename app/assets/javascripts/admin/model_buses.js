list_seat_first_floor = [];
list_seat_second_floor = [];
first_items = [];
second_items = [];
$(document).ready(function() {
  $('.create-frame').click(function(){
    var number_of_seats = $('#number_of_seats').val();
    var number_of_floors = $('#number_of_floors').val();
    var number_of_horizontal_line = $('#number_of_horizontal_line').val();
    var number_of_vertical_line = $('#number_of_vertical_line').val();
    if(number_of_seats >
      number_of_floors * number_of_horizontal_line * number_of_vertical_line){
      alert(I18n.t('admin.model_bus.not_enough_seats'));
    }else{
      remain_seats = number_of_seats;
      $('.frame-bus').html('');
      var frame = '';
      for(var i = 0; i < number_of_floors; i++) {
        frame += '<div class="floor-bus">'
          + '<div class="title-floor" id="floor_' + (i + 1) + '">'
          + '<label>'+ I18n.t('floor') + ' ' + (i + 1) + '</label>'
          + '</div>'
          + '<table class="frame">';
        for(var row = 0; row < number_of_vertical_line; row++){
          frame += '<tr class="bus-seat" id="row_' + (row + 1) + '">';
          for(var col = 0; col < number_of_horizontal_line; col++){
            frame += '<td>'
              + '<li id="seat_' + (row + 1) + '_' + (col + 1) +
                '"class="seat-model" data-floor="'+ (i + 1) +'">'
              + '</li>'
              + '</td>';
          }
          frame += '</tr>';
        }
        frame += '</table>'
          + '</div>';
      }
      frame += '<div class="seat-type">'
        + '<ul>'
        + '<li>'
        + '<div class="tpye-seat unselected"></div>'
        + I18n.t('unselected-seat')
        + '</li>'
        + '<li>'
        + '<div class="tpye-seat selected"></div>'
        + I18n.t('selected-seat')
        + '</li>'
        + '<li>'
        + I18n.t('admin.model_bus.remain-seats')
        + ': <span class="remain-seats">' + number_of_seats + '</span>'
        + '</li>'
        + '</ul>'
        + '</div>';
      frame += '<div class="row text-center">'
        + '<button type="button" id="create-model-bus" class="btn btn-primary">'
        + I18n.t('admin.model_bus.create_model')
        + '</button>'
        + '</div>';
      $('.frame-bus').append(frame);
    }
  });
});

$(document).on('click','.seat-model', function(){
  if($(this).hasClass('selected')){
    $(this).removeClass('selected');
    remain_seats++;
  }else{
    if(remain_seats == 0) {
      alert(I18n.t('admin.model_bus.out_of_seat'));
    }else{
      $(this).addClass('selected');
      let temp = $(this).attr('id');
      let location_str = temp.match(/\d/g);
      let location = location_str.map(function(i) {
        return parseInt(i, 10);
      });

      let floor = parseInt($(this).data('floor'));
      if(floor == 1) {
        list_seat_first_floor.push(location);
      } else {
        list_seat_second_floor.push(location);
      }
      remain_seats--;
    }
  }
  $('.remain-seats').text(remain_seats);
});

$(document).on('click', '#create-model-bus', function() {
  let rows = $('#number_of_horizontal_line').val();
  let columns = $('#number_of_vertical_line').val();
  var number = 0;
  for (let i=1; i<=rows; i++) {
    for(let j=1; j<=columns; j++) {
      let a = [i,j];
      let check = list_seat_first_floor.some(
        r => r.every((value, index) =>  a[index] == value)
      );
      if (check) {
        number++;
        first_items.push([i, j, number, 1]);
      }
    }
  }

  for (let i=1; i<=rows; i++) {
    for(let j=1; j<=columns; j++) {
      let a = [i,j];
      let check = list_seat_second_floor.some(
        r => r.every((value, index) =>  a[index] == value)
      );
      if (check) {
        number++;
        second_items.push([i, j, number, 2]);
      }
    }
  }

  $.ajax({
    url: '/admin/model_buses',
    method: 'POST',
    authenticity_token: $('meta[name="csrf-token"]').attr('content'),
    data: {
      list_seat_first_floor: first_items,
      list_seat_second_floor: second_items,
      amount_of_seats: $('#number_of_seats').val(),
      number_of_floors: $('#number_of_floors').val(),
      number_of_rows: rows,
      number_of_columns: columns
    },
    success: function(dataResponse) {
      if(dataResponse.status == true) {
        $('#create_model_bus_successfully').modal({'show': true});
      } else {
        $('#create_model_bus_unsuccessfully').modal({'show': true});
      }
      setInterval(function(){ location.replace('/admin/schedules');}, 3000);
    }
  });
});
