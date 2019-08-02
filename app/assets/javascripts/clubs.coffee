# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  console.log "Triggered"
  console.log(@addGalleryField)
  $('.add-gallery-button').on 'click', (ev) ->
    ev.preventDefault()    
    console.log "Hello"
    $lastGalleryField = $('input[name="club[gallery][]"]:last-of-type').clone()
    $lastGalleryField.val("")
    $(".form-group.club_gallery").append($lastGalleryField)

  autosize(document.querySelectorAll('textarea'));
