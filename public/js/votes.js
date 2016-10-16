$(document).ready(function() {

  $('.votes').on('click', '.vote_up', function(event){
    event.preventDefault();
    var route = $(this).attr('href'),
        currentQuestion = $(this).parent().parent();
    $.ajax({
      url: route,
      method: 'post'
    }).done(function(response){
      currentQuestion.find('.vote_number').html(response.vote_num)
    })
  });
});
