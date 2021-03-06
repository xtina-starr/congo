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

  var us = [ "AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MI","MN","MO","MP","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","RI","SC","SD","TN","TX","UM","UT","VA","VI","VT","WA","WI","WV","WY"],
      ca = ["AB","BC","MB","NB","NL","NS","NT","NU","ON","PE","QC","SK","YT"],
      sop = $('#states_or_provinces');


  function options(country) {
    var select = document.createElement('select');
    select.id = 'order_state';
    select.name = "order[state]";

    for (var i = 0; i< country.length; i++){
        var opt = document.createElement('option');
        opt.value = country[i];
        opt.innerHTML = country[i];
        select.appendChild(opt);
    }
    sop.append(select);
  }

  $("#order_country").on("change", function() {
    sop.find('select').remove();
    if (this.value === 'CA') {
      options(ca);
    }
    else {
       options(us);
    }
  });


  $("#order_shipping_cost").on("change", function() {

    $.ajax({
      url: $(this).parents('form').attr("action"),
      type: 'PATCH',
      dataType: 'json',
      data: {order: {shipping_cost: $(":selected").val() }},
      success: function(data, textStatus, xhr) {
        $("#cost").remove();

        var shipping_cost = "<td id='cost'>$" + parseFloat(data.shipping_cost).toFixed(2) + "</td>",
            total = parseFloat($("#subtotal").html().split("$")[1]) + parseFloat(data.shipping_cost);

        $(".shipping_row").append(shipping_cost);
        $("#total").html("$" + total.toFixed(2));
      },
      error: function(xhr, textStatus, errorThrown) {
        alert("There was a problem: try, try again. Then quit. No use being a damn fool about it.");
      }
    });
    return false;
  });


  fields = ['credit_card_number',
            'credit_card_expiry',
            'credit_card_cvc',
            'email',
            'number',
            'postal_code'];
   $.each( fields, function (index, value) {
      $('input.'+value).formance('format_'+value)
                       .addClass('form-control')
                       .wrap('<div class=\'form-group\' />')
                       .parent()
                          .append('<label class=\'control-label\'></label>');
      $('input.'+value).on('keyup change blur', function (value) {
          return function (event) {
              $this = $(this);
              if ($this.formance('validate_'+value)) {
                  $this.parent()
                          .removeClass('has-success has-error')
                          .addClass('has-success')
                          .children(':last')
                              .text('Valid!');
              } else {
                  $this.parent()
                          .removeClass('has-success has-error')
                          .addClass('has-error')
                          .children(':last')
                              .text('Invalid');
              }
          };
      }(value));
   });

  $( "form" ).on( "submit", function() {
    var has_empty = false;
    $(this).find( 'input[type!="hidden"]' ).each(function () {
      if ( ! $(this).val() ) {
        has_empty = true;
        alert("Please fill out all the fields");
        return false;
      }
    });
    if ( has_empty ) {
    return false;
    }
  });
});




