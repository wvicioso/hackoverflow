<<<<<<< HEAD
$(document).ready(function () {
  $('#submit_question').hide();

  $('#add_question').on("click", function(event) {
    event.preventDefault();
    $('#submit_question').show();
  });

  $('#submit_question').submit(function (event) {
    event.preventDefault();
    var $inputs = $('form :input');
    var values = {};
    $inputs.each(function() {
      values[this.name] = $(this).val();
    });
    var route = $(this).attr('action');
    $.ajax({
      url: route,
      method: "POST",
      data: values
    }).done(function(msg) {

      $('#append').append("<li><a href='/questions/" + msg.id + "'>" + msg.title + "</a></li>");
      $('#submit_question').hide();
    });
  });


  $('.edit').click(function (event) {
    event.preventDefault();

    var route = $(this).attr('href');
    var selector = this
    console.log(event.target);
    $.ajax({
      url: route,
      method: "get"
    }).done(function(partial) {
      // console.log($('.answer').find(partial))
      console.log($(event.target).siblings('.ans_text'));
      // console.log(selector.find(''));
      // console.log(selector.closest('li'));
      // $(selector).closest('.ans_text').html(partial);
    });
  });
});
=======
// $(document).ready(function () {
//
//   $('#submit_question').hide();
//
//   $('#add_question').on("click", function(event) {
//    event.preventDefault();
//
//    $('#submit_question').show();
//
//    $('#submit_question').submit(function (event) {
//       event.preventDefault();
//
//       var $inputs = $('form :input');
//       var values = {};
//       $inputs.each(function() {
//         values[this.name] = $(this).val();
//       });
//       console.log(values)
//      $.ajax({
//       url: "/questions",
//       method: "POST",
//       data: values
//      }).done(function(msg) {
//        console.log(msg)
//       $('#append').append("<li><a href='/questions/<%= question.id %>'> <%= question.title %> </a></li>")
//
//       $('#submit_question').hide();
//       });
//     });
//   });
// });
>>>>>>> remove some ajax from navbar to refresh the page on login and logout
