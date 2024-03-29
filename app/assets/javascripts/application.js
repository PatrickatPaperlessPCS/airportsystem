// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

  $('form').on('click', '.remove_record', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('tr').hide();
    return event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.fields').append($(this).data('fields').replace(regexp, time));

    $( ".target" ).change(function() {
      // this = the select box that has changed
       var parent = $(this).closest('tr');
       console.log(parent);
       var optionvar = $(".target :selected", parent);
       var pricevar = optionvar.data("price");
       var taxvar = optionvar.data("tax_rate")
       console.log(optionvar);
       $(".price", parent).val(pricevar).attr('readonly', true);
       $(".taxtarget", parent).val(taxvar).attr('readonly', true);
    });

    return event.preventDefault();
  });
  
}); 