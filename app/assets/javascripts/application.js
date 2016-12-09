// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require the_notification
//= require the_notification/vendors/toastr
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.pt-BR.js
//= require wice_grid
//= require jquery_nested_form
//= require select2
//= require select2_locale_pt-BR
//= require nprogress
//= require nprogress-turbolinks
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  TheNotification.show_notifications();
});

$(document).on('ready page:load', function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();

  $('.datepicker').datepicker({
    format: "dd/mm/yyyy",
    todayBtn: "linked",
    clearBtn: true,
    language: "pt-BR",
  });

});


$.ajaxSetup({
  statusCode: {
    401: function(){
      // Redirec the to the login page.
      location.href = location.pathname;
    }
  },
  beforeSend: function() {
    NProgress.start();
  },
  complete: function(){
     NProgress.done();
  }
});

$(document).on('page:fetch',   function() { NProgress.start(); });
$(document).on('page:change',  function() { NProgress.done(); });
$(document).on('page:restore', function() { NProgress.remove(); });
