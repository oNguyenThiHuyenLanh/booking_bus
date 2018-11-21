const min = 3;

$(document).ready(function() {
  // autoExpired();

  let minutes = 60 * min;

  display = document.querySelector('#time');
  if(display) {
    startTimer(minutes, display);
  }

  var temp = JSON.parse(sessionStorage.getItem('schedule'));
  if(temp) {
    $('.total-price').append(temp.total_price);
    $('#payment').append(temp.total_price);
    temp = JSON.parse(sessionStorage.getItem('schedule-' + temp.id));
    var seats = temp.list_seat.sort();
    $('.seats').append(seats.join());

    $('#origin').append(sessionStorage.getItem('origin_address'));
    $('#destination').append(sessionStorage.getItem('destination_address'));
    $('.info-wrap .start-time').append(sessionStorage.getItem('hour'));
    $('.info-wrap .date').append(sessionStorage.getItem('date'));
    $('.info-wrap .total-price').append(temp.total_price);
    $('.info-wrap #payment').append(temp.total_price);
  }

  $('#booking').click(function() {
    var id = JSON.parse(sessionStorage.getItem('schedule')).id;
    var temp = JSON.parse(sessionStorage.getItem('schedule-' + id));
    $.ajax({
      url: '/booking',
      method: 'POST',
      authenticity_token: window.token,
      data: {
        schedule_id: id,
        seats: temp.list_seat
      },
      success: function(dataResponse) {
        if(dataResponse.status == true) {
          $('#booking_successfully').modal({'show' : true});
        } else {
          $('#booking_unsuccessfully').modal({'show' : true});
        }
      }
    });
  });

  $('#booking_successfully button[data-dismiss]').click(function() {
    sessionStorage.clear();
    location.replace('/');
  });

  $('#booking_unsuccessfully button[data-dismiss]').click(function() {
    location.replace(document.referrer);
  });
});

function startTimer(duration, display) {
  var timer = duration;
  var x = setInterval(function () {
    var minutes = parseInt(timer / 60, 10);
    var seconds = parseInt(timer % 60, 10);

    minutes = minutes < 10 ? '0' + minutes : minutes;
    seconds = seconds < 10 ? '0' + seconds : seconds;

    display.textContent = minutes + ':' + seconds;

    if (--timer < 0) {
      clearInterval(x);
      sessionStorage.clear();
      location.href = '/';
    }
  }, 1000);
}

// function autoExpired() {
//   timer = 60 * min;

//   var x = setInterval(function () {
//     minutes = parseInt(timer / 60, 10);
//     seconds = parseInt(timer % 60, 10);

//     if (--timer < 0) {
//       clearInterval(x);
//       sessionStorage.clear();
//       location.href = '/';
//     }
//   }, 1000);
// }
