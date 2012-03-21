$.ajaxSetup({
  beforeSend: function(xhr) {
    var token = $('meta[name="csrf-token"]').attr('content');
    xhr.setRequestHeader('X-CSRF-Token', token);
  }
});

$('a.time').live('click', function(e) {
  e.preventDefault();

  var time = prompt("What time?");

  if (time === null) {
    return;
  } else if (!time.match(/^\d+:[0-5]\d$/)) {
    alert("Time must be in 24-hour HH:MM format.");
    return;
  }

  var comment = prompt("Why did you change it?");

  var date = $(this).closest('table').attr('data-date');
  // ISO8601 date format: 2012-01-25T07:12:00.000Z
  var formedTime = new Date(date + " " + time).toISOString();
  
  var formedComment;
  var inOut = $(this).closest('td').attr('class');
  var timed = $(this).text();
  var commented = $(this).closest('td.comment').text().trim();

  if (inOut === "in") {
    formedComment = "Changed Time In: " + timed + " -> " + time + " (" + comment + ")";
  }
  else if (commented && (inOut === "out")) {
    formedComment = commented + ", changed " + "Time Out: " + timed + " -> " + time + " (" + comment + ")";
  }
  else {
    formedComment = "Changed Time Out: " + timed + " -> " + time + " (" + comment + ")";
  }

  $.ajax({
    url: "/time_logs/update",
    type: "POST",
    data: {
      _method: "PUT",
      in_out: inOut,
      date: date,
      time: formedTime,
      comment: formedComment
    }
  });
});
