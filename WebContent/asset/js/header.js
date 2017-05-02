$(function(){
	// Navigation Menu
	$('.toggle-btn').on('click', function() {
		$(this).toggleClass('visible');
		$('nav').slideToggle();
	});
	
});