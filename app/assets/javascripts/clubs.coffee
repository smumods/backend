# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  console.log "Triggered"
  $('.add-gallery-button').on 'click', @addGalleryField
  
  addGalleryField: (ev) ->
    console.log "Hello"
    ev.preventDefault()    
    $lastGalleryField = $('input[name="course[gallery][]"]:last-of-type').clone()
    $lastGalleryField.val("")
    $(".input.gallery").append($lastGalleryField)