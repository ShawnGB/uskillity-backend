$(document).ready(function() {
  $("#main-carousel").owlCarousel({
    slideSpeed : 300,
    autoPlay: true,
    paginationSpeed : 400,
    singleItem:true
  });

  $('#switch-slides .btn').on('click', function() {
    $('#switch-slides .btn').removeClass('active');
    $(this).addClass('active');
  });
  $('#learn_click').on('click', function() {
    $('#offer-slide').hide();
    $('#learn-slide').show();
  });
  $('#offer_click').on('click', function() {
    $('#learn-slide').hide();
    $('#offer-slide').show();
  });
});
