# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".tag").click ->
    curr_val = $(".tag-list").val()
    if curr_val.length > 0
      $(".tag-list").val(curr_val + ", " + $(this).data('name'))
    else
      $(".tag-list").val($(this).data('name'))
