//// For registering Service Worker 
//	if ('serviceWorker' in navigator) {
//	  navigator.serviceWorker
//	    .register('./service-worker.js', { scope: './' })
//	    .then(function(registration) {
//	      console.log("Service Worker Registered");
//	    })
//	    .catch(function(err) {
//	      console.log("Service Worker Failed to Register", err);
//	    })
//	}

$(function(){
	
	// Image Slider
	var leftarrow = $('.slider .left');
	var rightarrow = $('.slider .right');

	leftarrow.click(function(){
	    var left = $(this).siblings('.container').css('margin-left').replace('px', '');
	    
	    left = parseInt(left)+250;
	    if(left <=  50)
	    	$('.container').animate({'margin-left': left},500);
	});

	rightarrow.click(function(){
		var total = $(this).siblings('.container').children('.item').length;
	    var left = $(this).siblings('.container').css('margin-left').replace('px', '') - 250;
	    
	    if(left >= -(total-5)*250)
	    	$('.container').animate({'margin-left': left},500);
	});
	
	// Feedback Form
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
			if(msg != ''){
				$this.val('');
				$('.msg-insert').prepend("<div class='msg-send'>"+msg+"</div>");
			}
			else{alert('xfghjkl');}
				
		}
	});
	
});