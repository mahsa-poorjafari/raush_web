$(document).ready(function(){
  $('.sel_check_box').focusout(function(){ 
    if ($(this).val()) {
      a = $(this).attr('modual_id');      
      $('#number_check_box_'+a).attr('checked', 'checked');
      price = parseInt($('#div_price_'+a).text());
      sum = price * parseInt($(this).val());
      $('#div_cost_'+a).html('<b>'+sum+'</b>');      
      var calculate = 0;
      $('td.div_cost b').each(function() {     
        calculate += parseInt($(this).text());                     
        });
      $('p.calculate_the_price b.s').html('<p>'+calculate+'</p>');
    } 
  });
    
  $('.check_box_checked').change(function(){
    w = $(this).attr('modual_id');    
    if ($(this).is(':checked')) {    
      price = parseInt($('#div_price_'+w).text());
      $('#div_cost_'+w).html('<b>'+price+'</b>'); 
      var calculate = 0;
      $('td.div_cost b').each(function() {     
        calculate += parseInt($(this).text());                     
      });
      $('p.calculate_the_price b.s').html('<p>'+calculate+'</p>');
    }
    
  });
    
  $('.check_box_checked').change(function(){
    w = $(this).attr('modual_id');   
    if (!$(this).is(':checked')) {    
      $('#div_cost_'+w).html('');
      $('#number_field_'+w).val('');
    
      var calculate = 0;
      $('td.div_cost b').each(function() {     
        calculate += parseInt($(this).text());                     
        });
      $('p.calculate_the_price b.s').html('<p>'+calculate+'</p>');
    }
  });
});
