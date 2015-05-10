// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require autocomplete-rails
//= require ckeditor-jquery
//= require dataTables/jquery.dataTables
//= require jquery_nested_form

//= require_tree .


$(document).ready(function(){
  $('#service-image').show(1000);
  $('#service-image').removeClass('service-sample-image');
  $('#service-image').addClass('service-sample-image-show');
  $('#service-text').fadeIn(1000);
  $('#service-text').removeClass('service-sample-text');
  $('#service-text').addClass('service-sample-text-show');
  $('#subservice-image').fadeIn(1000);
  $('#subservice-image').removeClass('subservice-text');
  $('#subservice-image').addClass('subservice-text-show');
});
