# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 作り方を追加したとき連番をセット
$ ->
  $(document).on "nested:fieldAdded:directions", (event) ->
    index = $(this).find('.direction').length
    event.field.find('.direction_order').val(index)

# 材料にマウスオーバーで色をかえる
$ ->
  $("#ingredients").hover ->
    $(this).css "background-color", "#fc6"
  , ->
    $(this).css "background-color", "#fff"

# 材料をクリックしたらダイアログを出す
$ ->
  $('#ingredients').on 'click', ->
    $("#edit_direction_modal").modal('show')

# 作り方にマウスオーバーで色をかえる
$ ->
  $(".direction_text").hover ->
    $(@).css "background-color", "#fc6"
  , ->
    $(@).css "background-color", "#fff"

# 作り方をクリックしたら入力フォームを出す
$ ->
  $('.direction_text').on 'click', ->
    $(@).hide()
    $(@).next('.direction_form').show()

# 作り方の入力フォームのキャンセル
$ ->
  $('.edit_direction_text_cancel').on 'click', ->
    $('.direction_form').hide()
    $('.direction_text').show()
