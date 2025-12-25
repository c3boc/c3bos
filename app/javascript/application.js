// Entry point for the build script in your package.json

//import './stylesheets/application'

console.log("LOL")
import * as bootstrap from 'bootstrap';

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

jquery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

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
