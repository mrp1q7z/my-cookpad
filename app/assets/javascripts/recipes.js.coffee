# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on "nested:fieldAdded:directions", (event) ->
    index = $(this).find('.direction').length
    event.field.find('.direction_order').val(index)
