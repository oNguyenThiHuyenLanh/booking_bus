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
              + '<li id="seat_' + (row + 1) + '_' + (col + 1) + '" class="seat-model">'
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
        + '<button type="button" class="btn btn-primary create-frame">'
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
      remain_seats--;
    }
  }
  $('.remain-seats').text(remain_seats);
});
