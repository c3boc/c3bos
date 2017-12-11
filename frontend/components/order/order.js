/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

import "./order.scss";

$(function() {

  $("button[data-action=\"increase-amount\"]").click(function() {
    const beverageId = $(this).data("beverage-id");
    const span = $(`.well-beverage .beverage-amount[data-beverage-id="${beverageId}"]`);
    const newAmount = parseInt(span.html()) + 2;
    span.html(newAmount);
    return $(`#order_order_items_attributes_${beverageId}_amount`).val(newAmount);
  });

  return $("button[data-action=\"decrease-amount\"]").click(function() {
    const beverageId = $(this).data("beverage-id");
    const span = $(`.well-beverage .beverage-amount[data-beverage-id="${beverageId}"]`);
    const newAmount = Math.max(parseInt(span.html()) - 2, 0);
    span.html(newAmount);
    return $(`#order_order_items_attributes_${beverageId}_amount`).val(newAmount);
  });
});
