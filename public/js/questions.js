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

  // $('#submit_question').submit(function (event) {
  //   event.preventDefault();
  //   var $inputs = $('form :input');
  //   var values = {};
  //   $inputs.each(function() {
  //     values[this.name] = $(this).val();
  //   });
  //   var route = $(this).attr('action');
  //   $.ajax({
  //     url: route,
  //     method: "POST",
  //     data: $('#submit_question').serialize()
  //   }).done(function(msg) {
  //     $('#append').append("<li><a href='/questions/" + msg.id + "'>" + msg.title + "</a></li>");
  //     $('#submit_question').hide();
  //   });
  // });

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
});


  $(document.delete).submit(function(event) {
    event.preventDefault();
    console.log("delete");
    var route = $(this).attr('action');
    $.ajax({
      url: route,
      method: "delete"
    }).done(function() {
      $(event.target).closest('ul').remove();
    });
  });
