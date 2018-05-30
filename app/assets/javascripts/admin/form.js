$(document).ready(function () {
  var validation = $('#booking-form').validate({
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
      schedule_time_start: {
        required: true
      },
      schedule_time_spent: {
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
      }
    },
    errorElement: 'span',
    errorClass: 'error',
    errorPlacement: function (error, element) {
      error.insertBefore(element);
    }
  });

  $('.next-btn1').click(function () {
    if (validation.form()) {
      $('.tab-pane').hide();
      $('#step2').fadeIn(1000);
      $('.progressbar-dots').removeClass('active');
      $('.progressbar-dots:nth-child(1)').addClass('active');
      $('.progressbar-dots:nth-child(2)').addClass('active');
    }
  });

  $('.next-btn2').click(function () {
    if (validation.form()) {
      var route_id = $('#schedule_route_id').val();
      var date = $('#schedule_date').val();
      var time = $('#schedule_time_start').val();
      var interval = $('#schedule_interval_id').val();
      $.ajax({
        url: '/admin/bus/new',
        data: {
          'route_id': route_id,
          'date': date,
          'time': time,
          'interval': interval
        },
        dataType: 'json',
        type: 'GET',
        success: function (data) {
          if (data == null) {
            alert(I18n.t('admin.schedule.create.schedule_existed'));
          }
          else if (data.length == 0) {
            alert(I18n.t('admin.schedule.create.no_bus')); 
          }
          else {
            $('.tab-pane').hide();
            $('#step3').fadeIn(1000);
            $('.progressbar-dots').removeClass('active');
            $('.progressbar-dots:nth-child(1)').addClass('active');
            $('.progressbar-dots:nth-child(2)').addClass('active');
            $('.progressbar-dots:nth-child(3)').addClass('active');

            $('#schedule_bus_id').empty();
            for (i in data) {
              $('#schedule_bus_id').append('<option value=' +
                data[i].id + '>' + data[i].name + '</option>');
            }
          }
        }
      });
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
              $('#schedule_start_station_id').append('<option value=' +
                pick_origin[i].id + '>' + pick_origin[i].name + '</option>');
            }
          }
          if (pick_destination != '') {
            $('#schedule_final_station_id').empty();
            for (i in pick_destination) {
              $('#schedule_final_station_id').append('<option value=' +
                pick_destination[i].id + '>' + pick_destination[i].name +
                '</option>');
            }
          }
        }
      });
    }
  });
});
