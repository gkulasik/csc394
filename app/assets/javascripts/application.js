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
//= require jquery_nested_form
//= require foundation



//= require_tree .
// removed turbo links for foundation incombatibility

$("input[type='checkbox']").click(function () {
    var thisCheckbox = $(this);
    var id = $(this).attr("id");
//     var text = $("label[for=" + id + "]").text().toLowerCase();
//     var name = $(this).attr("name").replace("[" + text + "]", "");
  var array_names = ["shipping_address", "shipping_city", "shipping_postal_code", "shipping_state_or_province", "shipping_country"]
  for(i=0; i < 4; i++){
  $("input[name*='" + "checkout["+ array_names[i] + "]"+ "']").each(function () {
        var thisInput = $(this);
        if (thisInput.attr("disabled")) {
            thisInput.removeAttr("disabled");
        } else {
            thisInput.attr("disabled", "disabled");
            thisCheckbox.removeAttr("disabled");
        }
  })}
  $("select[name*='" + "checkout["+ array_names[array_names.length-1] + "]"+ "']").each(function () {
        var thisInput = $(this);
        if (thisInput.attr("disabled")) {
            thisInput.removeAttr("disabled");
        } else {
            thisInput.attr("disabled", "disabled");
            thisCheckbox.removeAttr("disabled");
        }
  })
});




$(function(){ $(document).foundation(); }); 
