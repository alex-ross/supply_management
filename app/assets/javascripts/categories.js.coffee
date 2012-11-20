# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  tags = ()->
    items = []
    $.getJSON "http://#{location.host}/categories.json", (data)->
        $.each data, (index, value)->
          console.log index, value
          items.push value.name
          console.log items
    items

  $(".select2").select2
    tags: tags(),
    tokenSeparators: [",", " ", ";"]