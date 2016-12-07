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
    $(event.target).parent().hide();
    $(event.target).parent().next().show();
  });

  $('.cancel').on('click', function(event) {
    event.preventDefault();
    $(event.target).parent().hide();
  });

  $(".create_comment").submit(function(event) {
    event.preventDefault();
    var route = $(this).attr('action');
    $.ajax({
      url: route,
      type: "POST",
      data: $(this).serialize()
    }).done(function(new_comment) {
    $(event.target).parent().next().children().first().append("<li class='important'>" + new_comment.text + "</li><br><li class='imp'>" + new_comment.user + "</li><br>")
    });
  });

});
