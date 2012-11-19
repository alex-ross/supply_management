# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("li[href]").click (e)->
    unless $(e.target).is('.categories a')
      location.href = $(this).attr('href')
  $(".suppliers li.active").detach().prependTo("ul.suppliers")