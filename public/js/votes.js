$(document).ready(function() {

  $('.votes').on('click', '.vote', function(event){
    event.preventDefault();

    var route = $(this).attr('href'),
        direction = $(this).attr('id'),
        currentQuestion = $(this).parent().parent();
    $.ajax({
      url: route,
      method: 'post',
      data: {up_down: direction}
    }).done(function(response){
      currentQuestion.find('.vote_number').html(response.vote_num)
    })
  });
});
