$(document).ready(function(){
  $(document).ready(function () {
    //called when key is pressed in textbox
    $(".sel_check_box").keypress(function (e) {
       //if the letter is not digit then display error and don't type anything
       if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
          //display error message
          $(this).css('border', '2px solid red');
            return false;
      }
     });
  });
  
  $('.sel_check_box').focusout(function(){ 
    if ($(this).val()) {
      $(this).css('border', '');  
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
    else
      {
        a = $(this).attr('modual_id');            
        $('#number_check_box_'+a).attr('checked', false);
        $('#div_cost_'+a).html(''); 
        
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
  
  $('#set_order').click(function(){
    $('.set_modual_ids').val('');
    $('.set_modual_numbers').val('');
    $('.check_box_checked').each(function(index){
      if ($(this).is(':checked')) { 
        w = $(this).attr('modual_id'); 
        $('.set_modual_ids').val(function( index, value ) {
          return value + w+",";
        });
        $('.set_modual_numbers').val(function( index, value ) {
          return value +$('#number_field_'+w).val()+ ",";
        }); 
      }
    });
    
  });
});

