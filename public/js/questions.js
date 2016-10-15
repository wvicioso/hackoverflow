$(document).ready(function () {

  alert('hello');

  $("#submit_question").hide();

  $("#add_question").on("click", function(event) {
   event.preventDefault();

   $("#submit_question").show();

   $("#submit_question").submit(function (event) {
    event.preventDefault();

    var $inputs = $('form :input');
    var values = {};
   $inputs.each(function() {
    values[this.name] = $(this).val();
   });



   $.ajax({
    url: "/questions",
    method: "POST",
    data: values
   }).done(function(msg) {
    $("#append").append("<a href='/questions/<%= question.id %>'> <%= question.title %> </a>")
    });


   });
  });
});