// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage

//= require js/modernizr.min
//= require js/jquery.min
//= require js/popper.min
//= require js/bootstrap.min
//= require js/metisMenu.min
//= require js/waves
//= require js/jquery.slimscroll
//= require js/jquery.core
//= require js/jquery.app

//= require table-export
//= require bootstrap-table
//= require counterup.min
//= require easing
//= require easing.min
//= require isotope.pkgd
//= require isotope.pkgd.min
//= require mobile-nav
//= require waypoints.min
//= require owl.carousel.min
//= require wow
//= require wow.min
//= require main-home
//= require extensions/export/bootstrap-table-export
//= require extensions/toolbar/bootstrap-table-toolbar
//= require locale/bootstrap-table-es-CR

//= require moment
//= require moment/es
//= require toastr
//= require jquery.validate
//= require jquery.validate.localization/messages_es

//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js

//= require_tree .


toastr.options = {
  debug : false,
  closeButton : true,
  positionClass : "toast-top-center"
};


$('.datepicker').datepicker({
  format: 'dd/mm/yyyy',
  orientation: "bottom auto",
  language: 'es',
  autoclose: true
});