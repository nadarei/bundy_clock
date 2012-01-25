$('a.time').live('click', function(e) {
  e.preventDefault();

  var timeLogId = $(this).attr('data-timelogid');
  var time = prompt("What time?");
  var comment = prompt("Why did you change it?");
  var today = new Date();
  // ISO8601 date format: 2012-01-25T07:12:00.000Z
  var formedTime = new Date(today.toDateString() + " " + time).toISOString();

  var inOut = $(this).closest('td').attr('class');
  var tr = $(this).closest('tr');
  var employee = tr.attr('data-employee');

  $.ajax({
    url: "/time_logs/update",
    type: "POST",
    data: {
      _method: "PUT",
      time_log_id: timeLogId,
      in_out: inOut,
      time: formedTime,
      comment: comment
    },
    success: function(data) {
      var html = $(data).find("tr[data-employee='"+employee+"']").html();

      tr.html(html);
    }
  });

});
