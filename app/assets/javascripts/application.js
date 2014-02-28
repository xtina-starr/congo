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
//= require_tree .

$(document).ready(function() {

  var  us = '<select id="order_state" name="order[state]"><option value="AK">AK</option>' +
'<option value="AL">AL</option>'+
'<option value="AR">AR</option>'+
'<option value="AS">AS</option>'+
'<option value="AZ">AZ</option>'+
'<option value="CA">CA</option>'+
'<option value="CO">CO</option>'+
'<option value="CT">CT</option>'+
'<option value="DC">DC</option>'+
'<option value="DE">DE</option>'+
'<option value="FL">FL</option>'+
'<option value="GA">GA</option>'+
'<option value="GU">GU</option>'+
'<option value="HI">HI</option>'+
'<option value="IA">IA</option>'+
'<option value="ID">ID</option>'+
'<option value="IL">IL</option>'+
'<option value="IN">IN</option>'+
'<option value="KS">KS</option>'+
'<option value="KY">KY</option>'+
'<option value="LA">LA</option>'+
'<option value="MA">MA</option>'+
'<option value="MD">MD</option>'+
'<option value="ME">ME</option>'+
'<option value="MI">MI</option>'+
'<option value="MN">MN</option>'+
'<option value="MO">MO</option>'+
'<option value="MP">MP</option>'+
'<option value="MS">MS</option>'+
'<option value="MT">MT</option>'+
'<option value="NC">NC</option>'+
'<option value="ND">ND</option>'+
'<option value="NE">NE</option>'+
'<option value="NH">NH</option>'+
'<option value="NJ">NJ</option>'+
'<option value="NM">NM</option>'+
'<option value="NV">NV</option>'+
'<option value="NY">NY</option>'+
'<option value="OH">OH</option>'+
'<option value="OK">OK</option>'+
'<option value="OR">OR</option>'+
'<option value="PA">PA</option>'+
'<option value="PR">PR</option>'+
'<option value="RI">RI</option>'+
'<option value="SC">SC</option>'+
'<option value="SD">SD</option>'+
'<option value="TN">TN</option>'+
'<option value="TX">TX</option>'+
'<option value="UM">UM</option>'+
'<option value="UT">UT</option>'+
'<option value="VA">VA</option>'+
'<option value="VI">VI</option>'+
'<option value="VT">VT</option>'+
'<option value="WA">WA</option>'+
'<option value="WI">WI</option>'+
'<option value="WV">WV</option>'+
'<option value="WY">WY</option></select>';

var ca = '<select id="order_state" name="order[state]"><option value="AB">AB</option>'+
'<option value="BC">BC</option>'+
'<option value="MB">MB</option>'+
'<option value="NB">NB</option>'+
'<option value="NL">NL</option>'+
'<option value="NS">NS</option>'+
'<option value="NT">NT</option>'+
'<option value="NU">NU</option>'+
'<option value="ON">ON</option>'+
'<option value="PE">PE</option>'+
'<option value="QC">QC</option>'+
'<option value="SK">SK</option>'+
'<option value="YT">YT</option></select>';

  $("#order_country").on("change", "", function() {
 var sop = $('#states_or_provinces');

    sop.find('select').remove();

    if (this.value === 'CA') {
      sop.append(ca);
    }
    else {
      sop.append(us);
    }
  });
});
