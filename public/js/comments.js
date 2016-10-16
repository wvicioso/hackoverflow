$(document).ready(function () {

  $('.view_comments').on('click', function(event) {
    event.preventDefault();
    $(event.target).parent().prev().show();
    $(event.target).parent().hide();
    $(event.target).parent().children().last().show();
  });

  $('.hide_comments').on('click', function(event) {
    event.preventDefault();
    $(event.target).parent().hide();
    $(event.target).parent().next().show();
    $(event.target).closest('ul').children().last().hide();
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

  $('.create_comment').submit(function(event) {
    event.preventDefault();
    var $inputs = $('form :input');
    var values = {};
    $inputs.each(function() {
      values[this.name] = $(this).val();
    });
    var route = $(this).attr('action');
    console.log(route);
    $.ajax({
      url: route,
      method: 'post',
      data: values
    }).done(function(new_comment) {
    $(event.target).parent().next().children().first().append("<li>" + new_comment.text + "</li><li>" + new_comment.user + "</li><p>--------------------------------</p>")
    });
  });

});
