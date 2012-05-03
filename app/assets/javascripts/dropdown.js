$("li.dropdown > a").live('click', function(e) {
  e.preventDefault();
  e.stopPropagation();

  $(this).closest('li').toggleClass('active');
});

$("body").live('click', function(e) {
  $("li.dropdown").removeClass('active');
});
