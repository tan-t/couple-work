# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('input').prop("disabled",true)
  $('select').prop("disabled",true)
  $('input[type="checkbox"]').prop("disabled",false)
  $('input[type="submit"]').prop("disabled",false)