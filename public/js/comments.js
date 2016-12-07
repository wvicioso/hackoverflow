$(document).ready(function () {

  $('.view_comments').on('click', function(event) {
    event.preventDefault();
    $(event.target).prev().show();
    $(event.target).hide();
    $(event.target).parent().parent().parent().children().last().show();
  });

  $('.hide_comments').on('click', function(event) {
    event.preventDefault();
    $(event.target).next().show();
    $(event.target).hide();
    $(event.target).parent().parent().parent().children().last().hide();
  });

  $('.add_comments').on('click', function(event) {
    event.preventDefault();
    $(event.target).hide();
    $(event.target).next().next().next().show();
  });

  $('.cancel').on('click', function(event) {
    event.preventDefault();
    $(event.target).parent().hide();
    $(event.target).parent().prev().prev().prev().show();
  });

  $(".create_comment").submit(function(event) {
    event.preventDefault();
    var route = $(this).attr('action');
    $.ajax({
      url: route,
      type: "POST",
      data: $(this).serialize()
    }).done(function(response) {
      $(event.target).parent().next().show()
      $(event.target).hide()
      $(event.target).parent().next().append("<div class='answer-vote'><p id='answer.id>' class='answer-body grey lighten-4'>" + response.comment + "</p></div><div class='answer-comment left-align'><div class='answer-date'><a class='answer-user' href='/users/answer.user.id'>" + response.user + "</a>" + response.date + "</div></div>")


    });
  });

});
