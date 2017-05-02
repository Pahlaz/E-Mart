$(function(){
	
	// Connect.js
	$('#register').on('click', function(){
		$('.register').siblings().hide();
		$('.register').slideToggle();
	});
	$('#login').on('click', function(){
		$('.login').siblings().hide();
		$('.login').slideToggle();
	});
	$('#reset').on('click', function(){
		$('.reset').siblings().hide();
		$('.reset').slideToggle();
	});
	
	$(window).scroll(function(){
		var yscroll = $(window).scrollTop();
		
		// task to give parallax effect to header 		
		$('.front a').css({
			'transform' : 'translate(0px, '+ yscroll*1.2 +'%)'
		});
		
		// Landing Elements
		if(yscroll > $('.container').offset().top - ($(window).height() / 1.4)) {

		    $('.container .item').each(function(i){
		      setTimeout(function(){
		        $('.container .item').eq(i).animate({
					'opacity': '1'
				}, 500);
		      }, (700 * (Math.exp(i * 0.14))) - 700);
		    });
		    
		}
		
		// Changing Header Color
		if(yscroll > $('.contact').offset().top-50 && yscroll < $('.about').offset().top-50){
		    $('header').css({'background': '#1FCE6D'});
		}
		else{
		    $('header').css({'background': '#F9F8F8'});
		}
	});
	
	
	// Image Slider
	var leftarrow = $('.slider .left');
	var rightarrow = $('.slider .right');

	leftarrow.click(function(){
	    var left = $(this).siblings('.container').css('margin-left').replace('px', '');
	    
	    left = parseInt(left)+310;
	    if(left <=  50)
	    	$('.container').animate({'margin-left': left},500);
	});

	rightarrow.click(function(){
		var total = $(this).siblings('.container').children('.item').length;
	    var left = $(this).siblings('.container').css('margin-left').replace('px', '') - 310;
	    
	    if(left >= -(total-4)*310)
	    	$('.container').animate({'margin-left': left},500);
	});

	
	//Feedback Form
	var arrow = $('.chat-head img');
	var textarea = $('.chat-text textarea');

	arrow.on('click', function(){
		var src = arrow.attr('src');

		$('.chat-body').slideToggle('fast');
		if(src == 'asset/img/down.png'){
			arrow.attr('src', 'asset/img/up.png');
		}
		else{
			arrow.attr('src', 'asset/img/down.png');
		}
	});
	textarea.keypress(function(event) {
		var $this = $(this);

		if(event.keyCode == 13){
			var msg = $this.val();
			$this.val('');
			$('.msg-insert').prepend("<div class='msg-send'>"+msg+"</div>");
		}
	});
	
//	new
	
	$('.team img').on('click', function(){
		$(this).siblings().children('.desc').slideToggle();
	});
	
	
	
});