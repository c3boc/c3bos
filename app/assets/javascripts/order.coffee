# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#locationSelect button").click () ->
    $("#locationSelect button").removeClass("btn-primary")
    $(this).addClass("btn-primary")
    $("form#new_order input#order_location_id").val($(this).data("location-id"))

  $("#locationSelect button:first-child").click()


  $("button[data-action=\"increase-amount\"]").click () ->
    beverageId = $(this).data("beverage-id")
    span = $(".well-beverage .beverage-amount[data-beverage-id=\"" + beverageId + "\"]")
    newAmount = parseInt(span.html()) + 1
    span.html(newAmount)
    $("#order_order_items_attributes_" + beverageId + "_amount").val(newAmount)

  $("button[data-action=\"decrease-amount\"]").click () ->
    beverageId = $(this).data("beverage-id")
    span = $(".well-beverage .beverage-amount[data-beverage-id=\"" + beverageId + "\"]")
    newAmount = Math.max(parseInt(span.html()) - 1, 0)
    span.html(newAmount)
    console.log "order_order_items_attributes_" + beverageId + "_amount"
    $("#order_order_items_attributes_" + beverageId + "_amount").val(newAmount)
