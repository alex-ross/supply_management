# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("li[href]").click (e)->
    unless $(e.target).is('.categories a')
      location.href = $(this).attr('href')
  $(".suppliers li.active").detach().prependTo("ul.suppliers")

  if parseInt($("input#supplier_id").val()) > 0
    Gmaps.map.callback = ()->
      marker_id = parseInt $("input#supplier_id").val()
      marker = $.grep Gmaps.map.markers, (m)->
        m.id == marker_id
      marker = marker[0]
      #console.log marker
      infowindow = marker.infowindow
      infowindow.open(Gmaps.map.map, marker.serviceObject)
      Gmaps.map.map.panTo(marker.serviceObject.getPosition())
