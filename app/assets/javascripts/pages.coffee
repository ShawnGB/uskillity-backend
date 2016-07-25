$(document).ready ->
  $('#main-carousel').owlCarousel
    slideSpeed: 300
    autoPlay: true
    paginationSpeed: 400
    singleItem: true
  $('#switch-slides .btn').on 'click', ->
    $('#switch-slides .btn').removeClass 'active'
    $(this).addClass 'active'
    return
  $('#learn_click').on 'click', ->
    $('#offer-slide').hide()
    $('#learn-slide').show()
    return
  $('#offer_click').on 'click', ->
    $('#learn-slide').hide()
    $('#offer-slide').show()
    return
  return
