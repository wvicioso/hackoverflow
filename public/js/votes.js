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
      if (response.vote_class === 'voted_up'){
        currentQuestion.find('.voted_down').removeClass('voted_down');
        currentQuestion.find('#up').attr('class', 'vote ' + response.vote_class)
      } else {
        currentQuestion.find('.voted_up').removeClass('voted_up');
        currentQuestion.find('#down').attr('class', 'vote ' + response.vote_class)
      }
    })
  });
});
