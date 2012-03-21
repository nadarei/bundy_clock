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

  var date = $(this).closest('[data-date]').attr('data-date');

  // ISO8601 date format: 2012-01-25T07:12:00.000Z
  var formedTime = new Date(date + " " + time).toISOString();
  
  var formedComment;
  var inOut = $(this).closest('td').attr('class');
  var timed = $(this).text().trim();
  var commented = $(this).closest('td.comment').text().trim();

  var data = {
    _method: "PUT",
    time_log: {
      date: date
    }
  };

  if (inOut === "in") {
    data.time_log['comment_text'] = "Changed Time In: " + timed + " -> " + time + " (" + comment + ")";
    data.time_log['in'] = formedTime;
  }
  else if (commented && (inOut === "out")) {
    data.time_log['comment_text'] = commented + ", changed " + "Time Out: " + timed + " -> " + time + " (" + comment + ")";
    data.time_log['out'] = formedTime;
  }
  else {
    data.time_log['comment_text'] = "Changed Time Out: " + timed + " -> " + time + " (" + comment + ")";
    data.time_log['out'] = formedTime;
  }

  $.ajax({
    url: "/time_logs/update",
    type: "POST",
    data: data
  });
});
