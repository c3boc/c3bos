import "./index.scss";
import 'bootstrap-sass/assets/javascripts/bootstrap.js';


jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});
