$.ajaxSetup({
  beforeSend: function(xhr) {
    var token = $('meta[name="csrf-token"]').attr('content');
    xhr.setRequestHeader('X-CSRF-Token', token);
  }
});

$(document).ready(function() {
  $('#leave-type').hide();
  $('#datepicker').datepicker({
    dateFormat: "yy-mmydd",
    onClose: function(dateText, inst) {

      date = dateText;

      $.ajax({
        url:  "leaves/leave_type",
        type: "GET",
        data: date
      });
    }
  });
});
