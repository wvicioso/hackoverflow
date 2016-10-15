$(document).ready(function() {
  $('.nav-div').on('submit', 'form', function(event){
    event.preventDefault();

    var route = $(this).attr('action'),
        userInfo = $(this).children().serialize()

    $.ajax({
      url: route,
      method: 'post',
      data: userInfo
    }).done(function(response){
      $('.logging_in').html(response)
    })
  });

  $('.logging_in').on('click', '#log_out', function(event){
    event.preventDefault();

    var route = $('#log_out').attr('href');
    
    $.ajax({
      url: route,
      method: 'get'
    }).done(function(response){
      $('.logging_in').html(response)
    })
  });
});