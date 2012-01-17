function getTimeNow() {
  var now = new Date();
  return now.toLocaleTimeString();
}

function showDate() {
  var now = new Date();
  $("#date").html(now.toDateString());
}

showDate();

$(".in button").live('click', function(e) {
  e.preventDefault();

  var tr = $(this).closest("tr");

  tr
    .find(".in")
      .html('<a href="#" class="time">' + getTimeNow() + '</a>');

  tr
    .find(".out")
      .html("<button>Time out</button>");
});

$(".out button").live('click', function(e) {
  e.preventDefault();

  $(this)
    .closest("tr")
    .find(".out")
      .html('<span class="time">' + getTimeNow() + '</span>');
});

$('.in a.time').live('click', function(e) {
  e.preventDefault();

  var fromTime = $(this).text();
  var time = prompt("What time?");
  var comment = prompt("Why did you change it?");

  $(this)
    .closest("tr")
    .find(".comment")
      .html("Changed " + fromTime + " to " + time + " (" + comment + ")");

  $(this)
    .html(time);
});

