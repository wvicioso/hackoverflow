$(document).ready(function() {

  $('.votes').on('click', '.vote_up', function(event){
    event.preventDefault();
    var route = $(this).attr('href');
    $.ajax({
      url: route,
      method: 'post'
    }).done(function(response){
      $(this).find('vote_num').html(response.vote_num)
    })
  });
});
