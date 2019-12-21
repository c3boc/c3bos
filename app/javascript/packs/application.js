import '../stylesheets/application'

console.log("LOL")
import 'jquery';

import 'bootstrap-sass/assets/javascripts/bootstrap.js';


jQuery(function() {
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
