$(document).ready(function () {
  $('#submit_question').hide();
  $('#add_question').on("click", function(event) {
    event.preventDefault();
    $('#submit_question').show();
  });

  $('.cancel-question').on("click", function(event) {
    event.preventDefault();
    $('#submit_question').hide();
  });

  $('.edit').click(function (event) {
    event.preventDefault();
    var current_ans = $(this).parent().find('.update')
    var route = $(this).attr('href');
    $.ajax({
      url: route,
      method: "get"
    }).done(function(partial) {
      $(event.target).parent().children().first().show();
      $(event.target).parent().children().first().remove();
      $(event.target).parent().children().first().next();
      $(event.target).parent().children().last().prev().prev().hide();
    });
  });

  $('.update').submit( function (event) {
    event.preventDefault();
    var $inputs = $('form :input');
    var values = {};
    $inputs.each(function() {
      values[this.name] = $(this).val();
    });
    var route = $(this).attr('action');
    $.ajax({
      url: route,
      method: "put",
      data: values
    }).done(function(msg) {
      $(event.target).parent().parent().children().first().next().html(msg.text).show();
    });
  });

  //ajax call responsible for deleting question
  $('.actions').on('click', '.delete', function(event){
    event.preventDefault();
    var route = $(this).attr('href');

    $.ajax({
      url: route,
      method: 'delete'
    }).done(function(response){
      window.location.href = '/questions';
    })
  });
});
