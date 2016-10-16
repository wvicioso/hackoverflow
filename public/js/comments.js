$(document).ready(function () {

  $('.view_comments').on('click', function(event) {
    event.preventDefault();
    $(event.target).parent().prev().show();
    $(event.target).parent().hide();
    $(event.target).parent().children().last().show();
  });

  $('.hide_comments').on('click', function(event) {
    event.preventDefault();
    $(event.target).hide();
    $('.show_c').show();
    $(event.target).parent().children().last().hide();
  });

  $('.add_comments').on('click', function(event) {
    event.preventDefault();
    $('.cancel').show();
    $('.show_add_c').show();
  });

  $('.cancel').on('click', function(event) {
    event.preventDefault();
    $(event.target).hide();
    $('.show_add_c').hide();
  });

  $('.create_comment').submit(function(event) {
    event.preventDefault();
    var $inputs = $('form :input');
    var values = {};
    $inputs.each(function() {
      values[this.name] = $(this).val();
    });
    var route = $(this).attr('action');

    $.ajax({
      url: route,
      method: 'post',
      data: values
    }).done(function(new_comment) {
    $(event.target).parent().next().children().first().append("<li>" + new_comment.text + "</li><li>" + new_comment.user + "</li><p>--------------------------------</p>")
    });
  });

});
