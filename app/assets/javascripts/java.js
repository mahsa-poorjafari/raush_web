// JavaScript Document

$(document).ready(function(){
	$(".servic-menu").unbind("mouseover").mouseover(
		function(){
			//debugger;
			var olddivname= $(".servic-descriptipn:visible").attr("id");
			var divname = $(this).attr("div-name");
			
				
			$(".servic-descriptipn").css("z-index",1);
            $("#"+divname).css("z-index",99);			
			$("#"+divname).fadeIn(500);
//			setTimeout("alert('"+"ali" +"')",501)
			if (olddivname != divname){
				setTimeout("$('#"+olddivname +"').hide()",501)
				$(".bache").removeClass("show");
	            $(".bacher").removeClass("showr");
			}
			
			
        	childs = $("#"+divname).find(".bache");
			childs.each(function(){ 
				//x = $(this).attr("waitTime");
				thisid = $(this).attr("id");
				console.log (thisid);
				time = parseInt( $(this).attr("waitTime"));
				console.log(time);
				setTimeout("console.log(thisid);$('#"+thisid+"').addClass('show');",time)
			 });

			rchilds = $("#"+divname).find(".bacher");
				rchilds.each(function(){ 
				//x = $(this).attr("waitTime");
				rthisid = $(this).attr("id");
				console.log(rthisid);
				time = parseInt( $(this).attr("waitTime"));
				console.log(time);
				setTimeout("console.log(rthisid);$('#"+rthisid+"').addClass('showr');",time)
			 });

			
			//olddiv.hide();
			});
			//button
			$('#bmsbtn1').click(function(){ $('#b-info').hide(1000); $('#b-details').show(1000); $('#hotel').show(1000) });
			$('#btnbhotel').click(function(){ $('#b-details').hide(1000); $('#hotel').hide(); $('#b-info').show(1000) });
			$('#bmsbtn2').click(function(){ $('#b-info').hide(1000); $('#b-details').show(1000); $('#house').show(1000) });
			$('#btnbhome').click(function(){ $('#b-details').hide(1000); $('#house').hide(); $('#b-info').show(1000) });
			$('#bmsbtn3').click(function(){ $('#b-info').hide(1000); $('#b-details').show(1000); $('#office').show(1000) });
			$('#btnboffice').click(function(){ $('#b-details').hide(1000); $('#office').hide(); $('#b-info').show(1000) });
			$('#netbtn1').click(function(){ $('#n-info').hide(1000); $('#n-details').show(1000); $('#wan').show(1000) });
			$('#btnbwan').click(function(){ $('#n-details').hide(1000); $('#wan').hide(); $('#n-info').show(1000) });
			$('#netbtn2').click(function(){ $('#n-info').hide(1000); $('#n-details').show(1000); $('#lan').show(1000) });
			$('#btnblan').click(function(){ $('#n-details').hide(1000); $('#lan').hide(); $('#n-info').show(1000) });
			$('#netbtn3').click(function(){ $('#n-info').hide(1000); $('#n-details').show(1000); $('#voip').show(1000) });
			$('#btnbvoip').click(function(){ $('#n-details').hide(1000); $('#voip').hide(); $('#n-info').show(1000) });
      
			$('#graphicbtn1').click(function(){ $('#g-info').hide(1000); $('#g-details').show(1000); $('#g-details #prtofilo').show(1000) });
      $('#btnbprtofilo').click(function(){ $('#g-details').hide(1000); $('#prtofilo').fadeOut(); $('#g-info').show(1000) });
      
			$('#webbtn1').click(function(){ $('#web-info').hide(1000); $('#web-details').show(1000); $('#web-details .prtofilo').show(1000) });
			$('#btn-web-prto').click(function(){ $('#web-details').hide(1000); $('#web-details .prtofilo').fadeOut(); $('#web-info').show(1000) });
      
			
			$('#camerabtn1').click(function(){ $('#c-info').hide(1000); $('#c-details').show(1000); $('#fam').show(1000) });
			$('#btnbfam').click(function(){ $('#c-details').hide(1000); $('#fam').hide(); $('#c-info').show(1000) });
			
		$("#idhomeicon").mouseover();	
			//button
});
