# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# レシピタイトルにマウスオーバーで色をかえる
$ ->
  $(".recipe_title_text").hover ->
    $(this).css "background-color", "#fc6"
  , ->
    $(this).css "background-color", "#fff"

# レシピをクリックしたら入力フォームを出す
$ ->
  $('.recipe_title_text').on 'click', ->
    $(@).hide()
    $(@).next('.recipe_title_form').show()
    $('#recipe_title').select().focus()

# レシピの入力フォームのキャンセル
$ ->
  $('.edit_recipe_title_text_cancel').on 'click', ->
    $('.recipe_title_form').hide()
    $('.recipe_title_text').show()

# キャッチコピーにマウスオーバーで色をかえる
$ ->
  $(".catch_copy_text").hover ->
    $(this).css "background-color", "#fc6"
  , ->
    $(this).css "background-color", "#fff"

# キャッチコピーをクリックしたら入力フォームを出す
$ ->
  $('.catch_copy_text').on 'click', ->
    $(@).hide()
    $(@).next('.catch_copy_form').show()
    $('#recipe_catch_copy').select().focus()

# キャッチコピーの入力フォームのキャンセル
$ ->
  $('.edit_catch_copy_text_cancel').on 'click', ->
    $('.catch_copy_form').hide()
    $('.catch_copy_text').show()

# 材料にマウスオーバーで色をかえる
$ ->
  $("#ingredients").hover ->
    $(this).css "background-color", "#fc6"
  , ->
    $(this).css "background-color", "#fff"

# 材料をクリックしたらダイアログを出す
$ ->
  $('#ingredients').on 'click', ->
    $("#ingredients_form").modal('show')

# 作り方にマウスオーバーで色をかえる
$ ->
  $(".direction_text").hover ->
    $(@).css "background-color", "#fc6"
  , ->
    $(@).css "background-color", "#fff"

# 作り方をクリックしたら入力フォームを出す
$ ->
  $('.direction_text').on 'click', ->
    $('.direction_text_form').hide()
    $('.direction_text').show()
    $(@).hide()
    $(@).next('.direction_text_form').show()
    # TODO: 追加してID順でなくなるとうまく選択されない
    textarea = '#recipe_directions_attributes_' + $(@).data("index") + '_description'
    $(textarea).select().focus()

# 作り方の入力フォームのキャンセル
$ ->
  $('.edit_direction_text_cancel').on 'click', ->
    $('.direction_text_form').hide()
    $('.direction_text').show()
