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
  $('#sign_up_link').click (event) ->
    event.preventDefault()
    # Load the page content from "/users/sign_up"
    promise = $.get('/users/sign_up')
    # When the ajax request has finished
    promise.success (data) ->
      $frag = document.createDocumentFragment()
      $modal = $($('#modal-template')[0].outerHTML, $frag)
      console.log(data)
      $form = $($(data).find('#new_user')[0].outerHTML)
      $btn = $form.find('input[type="submit"]')
      # Wrap the modal content in the form.
      # Give the modal a unique ID.
      $modal.attr 'id', 'register-modal'
      # Add the inputs from the form inside the body
      $modal.find('.modal-body').append $form
      # Customize the title
      $modal.find('.modal-title').text 'Sign Up!'
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
      console.error 'Failed to fetch user registration form', textStatus, jqXHR, errorThrown
      return
    return
  return
