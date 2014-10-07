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
  
  $('.sel_check_box').blur(function(){ 
    if ($(this).val()) {
      $(this).css('border', '');  
      a = $(this).attr('modual_id');            
      
      price = parseInt($('#div_price_'+a).text());
      sum = price * parseInt($(this).val());
      $('#div_cost_'+a).html('<b>'+sum+'</b>');      
      var calculate = 0;
      $('td.div_cost b').each(function() {     
        calculate += parseInt($(this).text());                     
        });
      $('p.calculate_the_price b.s').html('<p>'+calculate+'</p>');
      $('#number_check_box_'+a).attr('checked', 'checked');      
    } 
    else
      {
        a = $(this).attr('modual_id');            
        $('#number_check_box_'+a).attr('checked', false);
        $('#div_cost_'+a).html('');
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
    else
    {
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
      w = $(this).attr('modual_id'); 
      if ($(this).is(':checked')) {         
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

