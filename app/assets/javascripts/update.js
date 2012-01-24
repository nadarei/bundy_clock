$('a.time').live('click', function(e) {
  e.preventDefault();

  var timeLogId = $(this).attr('data-timelogid');
  var time = prompt("What time?");
  var comment = prompt("Why did you change it?");
  var today = new Date();
  var formedTime = new Date(today.toDateString() + " " + time).toISOString();

  var tr = $(this).closest('tr');
  var employee = tr.attr('data-employee');

  tr.html("<td>Updating...</td>");

  $.ajax({
    url: "/time_logs/update",
    type: "POST",
    data: {
      _method: "PUT",
      time_log_id: timeLogId,
      time: formedTime,
      comment: comment
    },
    success: function(data) {
      var html = $(data).find("tr[data-employee='"+employee+"']").html();

      tr.html(html);
    }
  });

});
