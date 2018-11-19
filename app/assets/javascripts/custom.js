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

  enableButton();

  $('.seat').click(function(){
    $(this).toggleClass('selected');
    var seat_id = event.target.innerHTML.trim();
    var selected = $(event.target).hasClass('selected');
    var scheduleId = $(event.target).attr('data-schedule');
    var data;
    var seats = [];
    var temp = sessionStorage.getItem('schedule-' + scheduleId);
    if(!temp) {
      data = {list_seat: ''};
      sessionStorage.setItem('schedule-' + scheduleId, JSON.stringify(data));
    }
    temp = sessionStorage.getItem('schedule-' + scheduleId);
    temp = JSON.parse(temp);
    if(!temp.list_seat == '') {
      seats = temp.list_seat;
    }
    if(selected) {
      seats.push(seat_id);
      data = {list_seat: seats};
      printPrice(seats, scheduleId);
      printTicket(seats, scheduleId);
      sessionStorage.setItem('schedule-' + scheduleId, JSON.stringify(data));
    } else {
      seats.splice(seats.indexOf(seat_id), 1);
      data = {list_seat: seats};
      printPrice(seats, scheduleId);
      printTicket(seats, scheduleId);
      sessionStorage.setItem('schedule-' + scheduleId, JSON.stringify(data));
    }
    enableButton();
  });
});

$(document).ready(function(){
  $('#search').click(function(){
    var data = $('#select2-origin_address-container').attr('title');
    sessionStorage.setItem('origin_address', data);
    data = $('#select2-destination_address-container').attr('title');
    sessionStorage.setItem('destination_address', data);
    data = $('#search_date').datepicker('getDate').toLocaleDateString('vi');
    sessionStorage.setItem('date', data);
  });
  $('li.booked').unbind('click');
});

$(document).ready(function(){
  $('.book').click(function() {
    var id = $(this).attr('data-schedule');
    $('#schedule-' + id).toggle();
  });

  var ids = [];
  $('.row-table .list-seat').each(function () {
    ids.push(this.id);
  });

  $('.continue-btn').click(function() {
    var id = $(this).attr('data-schedule');
    var temp = new String($('#start-time-' + id).html());
    var time = temp.trim();
    sessionStorage.setItem('hour', time);
    var schedule = JSON.parse(sessionStorage.getItem('schedule-' + id));
    var data = {id: id, total_price: priceToString(schedule.list_seat)};
    sessionStorage.setItem('schedule', JSON.stringify(data));
    location.href = '/confirm';
  });

  for(i=0; i<ids.length; i++) {
    var temp = JSON.parse(sessionStorage.getItem(ids[i]));
    if(temp) {
      if(temp.list_seat.length != 0) {
        for (j=0; j<temp.list_seat.length; ++j) {
          var num = temp.list_seat[j];
          var position;
          position = $('li[data-number=' + num + ']');
          $(position).addClass('selected');
        }
      }
    }
  }

  show_seats();
});

function show_seats() {
  $('.row-table .list-seat').each(function () {
    var schedule_id = this.id;
    var temp = JSON.parse(sessionStorage.getItem(schedule_id));
    var id = schedule_id.slice(-1);
    if(temp) {
      if(temp.list_seat.length != 0) {
        total_price = price(temp.list_seat);
        $('.total-price').data('schedule', id).empty();
        $('.booked-seat').data('schedule', id).append(temp.list_seat.join());
      }
    }
  });
}

function printPrice(seats, scheduleId) {
  total_price = price(seats);
  $('.total-price').data('schedule', scheduleId).empty();
  $('.total-price').data('schedule', scheduleId).
    append(total_price.toLocaleString()
    + ' ' + I18n.t('number.currency.format.unit'));
}

function printTicket(seats, scheduleId) {
  $('.booked-seat').data('schedule', scheduleId).empty();
  for(var i = 0; i < seats.length; i++){
    $('.booked-seat').data('schedule', scheduleId).append('<span>' + seats[i] + '</span>, ');
  }
}

function price(seats) {
  var count = seats.length;
  var p = $('p.price').html();
  var price = number(p);
  return count*price;
}

function priceToString(seats) {
  var total_price = price(seats);
  return total_price.toLocaleString()
    + ' ' + I18n.t('number.currency.format.unit');
}

function number(currency) {
  var number = Number(currency.replace(/[^0-9.]+/g,''));
  return number;
}

function enableButton() {
  $('.row-table .list-seat').each(function () {
    schedule_id = this.id;
    var temp = JSON.parse(sessionStorage.getItem(schedule_id));
    var id = schedule_id.slice(-1);
    if(temp) {
      if(temp.list_seat.length != 0) {
        $('.continue-btn').data('schedule', id).prop('disabled', false);
      } else {
        $('.continue-btn').data('schedule', id).prop('disabled', true);
      }
    }
  });
}
