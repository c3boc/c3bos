import Chartkick from "chartkick";
import Highcharts from "highcharts";
Chartkick.addAdapter(Highcharts);
window.Chartkick = Chartkick;

import "./index.scss";
import 'bootstrap-sass/assets/javascripts/bootstrap.js';

require("@rails/ujs").start();

jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});
