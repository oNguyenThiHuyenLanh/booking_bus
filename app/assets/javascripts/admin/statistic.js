$(document).ready(function() {
  $('#option_statistic').click(function() {
    var type_id = $('#option_statistic').val();
    if (type_id == 2) {
      document.getElementById('year_statistic').disabled = true;
    }
    if (type_id == 1) {
      document.getElementById('year_statistic').disabled = false;
    }
  });

  $('#show-statistic').click(function() {
    let route_id = $('#route_statistic').val();
    let temp = $('#option_statistic').val();
    let option;
    let year;
    if(temp === '1') {
      option = 'month';
      year = $('#year_statistic').val();
    }else if (temp === '2'){
      option = 'year';
    }
    $.ajax({
      url: 'statistics/' + route_id,
      method: 'GET',
      data: {
        route_id: route_id,
        option: option,
        year: year
      },
      success: function(dataResponse) {
        var labels = [];
        var data = [];
        var ctx = document.getElementById('myChart').getContext('2d');
        data_statistic = dataResponse.data;
        if (dataResponse.data == false) {
          let error = I18n.t('message.statistic.unsuccessfully');
          $('#error_statistic').addClass('alert alert-danger');
          document.getElementById('error_statistic').append(error);
          setTimeout(function() {
            $('#error_statistic').fadeOut();
          },3000);

          myPieChart = new Chart(ctx);
          
        } else {
          for(let i=0; i<data_statistic.length; ++i) {
            labels.push(data_statistic[i].month);
            data.push(data_statistic[i].money);
          }

          new Chart(ctx, {
            type: 'line',
            data: {
              labels: labels,
              datasets: [{
                label: I18n.t('admin.statistic.label'),
                borderColor: 'rgb(102, 179, 255)',
                data: data,
              }]
            },
            options: {}
          });
        }
      }
    });
  });
});
