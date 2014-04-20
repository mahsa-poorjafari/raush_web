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
			}
			
			
			//olddiv.hide();
			});
	
	});