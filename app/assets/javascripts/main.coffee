$(document).on 'turbolinks:load', ->
  data = $('body').data()
  key = data['controller'] + ':' + data['action'] + ':loaded'
  console.log 'Triggering', key
  $(this).trigger key
  return
