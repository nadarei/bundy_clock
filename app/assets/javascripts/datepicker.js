$.ajaxSetup({
  beforeSend: function(xhr) {
    var token = $('meta[name="csrf-token"]').attr('content');
    xhr.setRequestHeader('X-CSRF-Token', token);
  }
});

$(document).ready(function() {
  $('fieldset:not(.date)').hide();
  $('#datepicker').datepicker({
    dateFormat: "yy/mm/dd",
    onClose: function(dateText, inst) {

      var date = dateText;
      if (date === null) {
        return;
      }

      var data = {
        date: date
      };

      $.ajax({
        url:  "/leaves/leave_type",
        type: "GET",
        data: data
      });
    }
  });
});
