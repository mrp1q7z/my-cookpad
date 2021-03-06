# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  # 材料にマウスオーバーで色をかえる
  $("#ingredients").hover ->
    $(this).css "background-color", "#fc6"
  , ->
    $(this).css "background-color", "#fff"

  # 材料をクリックしたらダイアログを出す
  $('#ingredients').on 'click', ->
    $("#ingredients_form").modal('show')

$(document).ready ready
$(document).on "page:load", ready

$(document).on 'mouseenter', "#recipe_title_text", ->
  $(this).css "background-color", "#fc6"

$(document).on 'mouseleave', "#recipe_title_text", ->
  $(this).css "background-color", "#fff"

$(document).on 'click', "#recipe_title_text", ->
  $(@).hide()
  $('#recipe_title_form').show()
  $('#recipe_title').select().focus()

$(document).on 'click', "#cancel_recipe_title_form", ->
  $('#recipe_title_form').hide()
  $('#recipe_title_text').show()

$(document).on 'mouseenter', "#catch_copy_text", ->
  $(this).css "background-color", "#fc6"

$(document).on 'mouseleave', "#catch_copy_text", ->
  $(this).css "background-color", "#fff"

$(document).on 'click', "#catch_copy_text", ->
  $(@).hide()
  $('#catch_copy_form').show()
  $('#recipe_catch_copy').select().focus()

$(document).on 'click', "#cancel_catch_copy_form", ->
  $('#catch_copy_form').hide()
  $('#catch_copy_text').show()

$(document).on 'mouseenter', ".direction_image_upload", ->
  $(@).css "background-color", "#fc6"

$(document).on 'mouseleave', ".direction_image_upload", ->
  $(@).css "background-color", "#fff"

$(document).on 'click', ".direction_image_upload", ->
  uploader = "#direction_image_" + $(@).data("direction_id")
  $(uploader).trigger "click"
  $(uploader).change ->
    $(@).next(':submit').trigger "click"

$(document).on 'mouseenter', ".direction_text", ->
  $(@).css "background-color", "#fc6"

$(document).on 'mouseleave', ".direction_text", ->
  $(@).css "background-color", "#fff"

$(document).on 'click', ".direction_text", ->
  $('.direction_text_form').hide()
  $('.direction_text').show()
  $(@).hide()
  $(@).next('.direction_text_form').show()
  textarea = '#direction_text_' + $(@).data("direction_id")
  $(textarea).select().focus()

$(document).on 'click', ".edit_direction_text_cancel", ->
  $('.direction_text_form').hide()
  $('.direction_text').show()

$(document).on 'click', "#recipe_image_upload", ->
  $("#recipe_image").trigger "click"
  $("#recipe_image").change ->
    $(@).next(':submit').trigger "click"
