// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-ui-timepicker-addon.js
//= require_tree .

$(function (){  
    $('#ticket_opened_at').datetimepicker();  
});  

$(function (){  
    $('#ticket_closed_at').datetimepicker();  
});  

jQuery(function($) {
  $("#ticket_location_id").live('change', function() {
    var location = $('select#ticket_location_id :selected').val();
    if (location == "") location = "0";
    jQuery.get('/locations/' + location + '/rooms', function(data) {
      var sel = $("#ticket_room_id");
      sel.empty();
      sel.append('<option value="">Please select a room</option>');
      for (var i=0; i<data.length; i++) {
        sel.append('<option value=' + data[i].id + '>' + data[i].name + '</option>');
      }
    })
    return false;
  });

})

