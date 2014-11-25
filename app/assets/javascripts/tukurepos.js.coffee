# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
($ ->
  $.fn.modal_success = ->
    @modal "hide"
    @find("#tukurepo_message").val ""
    @clear_previous_errors()
) jQuery
