onload = window.onload
window.onload = (event) ->
  trackingElements = document.querySelectorAll '[data-track]'

  for element in trackingElements
    element.addEventListener 'click', (event) ->
      tracking = event.target.getAttribute 'data-track'
      tracking = tracking.split '/'
      tracking.unshift 'event'
      tracking.unshift 'send'

      ga.apply ga, tracking

  if onload?
    onload(event)
