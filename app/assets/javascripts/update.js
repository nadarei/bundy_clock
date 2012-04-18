$.ajaxSetup({
  beforeSend: function(xhr) {
    var token = $('meta[name="csrf-token"]').attr('content');
    xhr.setRequestHeader('X-CSRF-Token', token);
  }
});

// Time in and out
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

  var inOut = $(this).closest('td').attr('class');

  var timed = $(this).text().trim();

  var section = $(this).closest('section').attr('class');

  var data = {
    _method: "PUT",
    row_format: section,
    time_log: {
      date: date
    }
  };

  if (inOut === "in") {
    data.time_log['comment_text'] =  "Time In: " + timed + " -> " + time + " (" + comment + ")";
    data.time_log['in'] = formedTime;
  }
  else if (inOut === "out") {
    data.time_log['comment_text'] =  "Time Out: " + timed + " -> " + time + " (" + comment + ")";
    data.time_log['out'] = formedTime;
  }

  $.ajax({
    url: "/time_logs/update",
    type: "POST",
    data: data
  });
});

// Making comment only
$('img.comment').live('click', function(e) {
  e.preventDefault();

  var comment = prompt("Comment: ");

  if (comment === null) {
    return;
  }

  var date = $(this).closest('[data-date]').attr('data-date');

  $.ajax({
    url: "/time_logs/update",
    type: "POST",
    data: {
      _method: "PUT",
      time_log: {
        date: date,
        comment_text: comment
      }
    }
  });
});
