$(document).ready(function() {

  $('.logging_in').on('click', '.login', function(event){
    event.preventDefault();

    $.ajax({
      url: '/sessions/new',
      method: 'get'
    }).done(function(response){
      $('.logging_in').html(response)
    })
  });
});
