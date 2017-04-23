$(document).ready(() => {
  $('.votes').on('click', '.vote', function(event) {
    event.preventDefault();
    var route = $(this).attr('href'),
        linkClass = $(this).attr('class'),
        direction = $(this).attr('id'),
        currentQuestion = $(this).parent().parent();
    $.ajax({
      url: route,
      method: 'post',
      data: {up_down: direction}
    }).done((response) => {
      if (response.vote_class === 'voted_up' &&  linkClass.indexOf('up') === -1){
        currentQuestion.find('.voted_down').removeClass('voted_down');
        currentQuestion.find('#up').attr('class', 'vote ' + response.vote_class)
        currentQuestion.find('.vote_number').html(response.vote_num - 1)
      } else if(response.vote_class === 'voted_down' && linkClass.indexOf('down') === -1){
        currentQuestion.find('.voted_up').removeClass('voted_up');
        currentQuestion.find('#down').attr('class', 'vote ' + response.vote_class)
        currentQuestion.find('.vote_number').html(response.vote_num + 1)
      }
      setTimeout(() => {
        currentQuestion.find('.vote_number').html(response.vote_num);
      }, 50);
    })
  });
});
