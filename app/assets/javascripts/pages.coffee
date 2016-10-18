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

$(document).ready ->
  # Only fire this on the home page.
  # Replace this with a regular click handler if you do not want a "splash"
  createregisterpopupmodal = (modalid) ->
    promise = $.get('/users/register')
    # When the ajax request has finished
    promise.success (data) ->
      $frag = document.createDocumentFragment()
      $modal = $($('#modal-template')[0].outerHTML, $frag)
      console.log(data)
      $head = $($(data).find('#popup-header')[0].innerHTML)
      $form = $($(data).find('#popup-content')[0].outerHTML)
      $btn = $form.find('input[type="submit"]')
      $modal.attr 'id', modalid
      # Add the inputs from the form inside the body
      $modal.find('.modal-title').text $head[0].innerHTML
      $modal.find('.modal-body').append $form
      # Add the submit button next to the close button
      $btn.addClass 'btn btn-primary'
      # since the button is not actually in the form we add an event handler to submit the form.
      $btn.click ->
        $modal.find('form').submit()
        return
      $modal.find('.modal-footer').append $btn
      # Attach the modal to document
      $('body').append $modal
      # Open the modal
      $modal.modal {}
      return
    promise.fail (jqXHR, textStatus, errorThrown) ->
      console.error 'Failed to fetch content', endpoint, textStatus, jqXHR, errorThrown
      return
    return

  #TODO refactor this to reuse most of the code
  # WIP!!!
  $('#mailinglist_registration_link').click (event) ->
    event.preventDefault()
    createregisterpopupmodal('registration-link')
    return

  $('#mailinglist_registration_button').click (event) ->
    event.preventDefault()
    createregisterpopupmodal('registration-button')
    return

  $('#login_link').click (event) ->
    event.preventDefault()
    createregisterpopupmodal('login_link')
    return

  $('#offer_a_skill_link').click (event) ->
    event.preventDefault()
    createregisterpopupmodal('offer_a_skill')
    return

  $('#learn_a_skill_link').click (event) ->
    event.preventDefault()
    createregisterpopupmodal('learn_a_skill')
    return

  createpopupmodal = (endpoint, modalid) ->
    promise = $.get(endpoint)
    # When the ajax request has finished
    promise.success (data) ->
      $frag = document.createDocumentFragment()
      $modal = $($('#modal-template')[0].outerHTML, $frag)
      $head = $($(data).find('#popup-header')[0].innerHTML)
      $form = $($(data).find('#popup-content')[0].outerHTML)
      $modal.attr 'id', modalid
      # Add the inputs from the form inside the body
      $modal.find('.modal-title').text $head[0].innerHTML
      $modal.find('.modal-body').append $form
      # Attach the modal to document
      $('body').append $modal
      # Open the modal
      $modal.modal {}
      return
    promise.fail (jqXHR, textStatus, errorThrown) ->
      console.error 'Failed to fetch content', endpoint, textStatus, jqXHR, errorThrown
      return
    return

  $('#contact_modal_viewer').click (event) ->
    event.preventDefault()
    createpopupmodal('/pages/contact', 'contact-modal')
    return

  $('#imprint_modal_viewer').click (event) ->
    event.preventDefault()
    createpopupmodal('/pages/impressum', 'impressum-modal')
    return

  $('#share_details_link').click (event) ->
    event.preventDefault()
    createpopupmodal('/pages/share_details', 'share-details-modal')
    return

  $('#looking_around_link').click (event) ->
    event.preventDefault()
    createpopupmodal('/pages/looking_around', 'looking-around-modal')
    return

  $('#inspiration_link').click (event) ->
    event.preventDefault()
    createpopupmodal('/pages/inspiration', 'inspiration-modal')
    return 

  $('#flash').fadeOut(5000);

  return
