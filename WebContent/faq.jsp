<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>FAQ Page</title>
	<link rel="stylesheet" href="asset/css/header.css">
	<script src="asset/js/jquery-1.12.2.min.js" type="text/javascript"></script>
	<script src="asset/js/header.js" type="text/javascript"></script>
	<style type="text/css">
	`	*{
			padding: 0px;
			margin: 0px;
			font-family: 'Fira Code';
		}
		.faq{
			margin: 10px auto;
			width: 800px;
		}
		.QS{
			text-align: center;
		}
		.QS h2{
			background: ghostwhite;
			padding: 10px;
			margin: 0px;
			box-shadow: 2px 0px 2px rgba(0, 0, 0, 0.6);
		}
	</style>
	<script src="asset/js/jquery-1.12.2.min.js" type="text/javascript"></script>
	<script>
		$(function(){
			$('.QS p').hide();
			$('.wrapper').find('.QS').first().children('p').show();

			$('.QS h2').on('mouseenter', function(){
				$(this).parent().siblings('.QS').children('p').slideUp()
				$(this).siblings('p').slideDown();
			});
		});
	</script>
	</head>
<body>
	<div class="wrapper">
		<header data-log="none">
			<div class="logo">
				<a href="index.html"><img src="asset/img/logo.png" alt="E Mart"></a>
			</div>
			<div class="search">
				<form action="main.jsp" method="get">
					<input type="search" name="search" id="search" placeholder="Start Comparing">
				</form>
				<a href="main.jsp"> <img style="border:1px solid black;box-sizing:border-box;" src="asset/img/search.png"> </a>
			</div>
			<nav>
				<div style="background: rgba(0, 0, 0, 0.2);margin-top: 50px;width: inherit;">
					<ul>
						<li><a href="index.html" title="">Home</a></li>
						<li><a href="connect.jsp" title="">SignUp</a></li>
						<li><a href="index.html#contact" title="">Contact</a></li>
						<li><a href="index.html#about" title="">About</a></li>
					</ul>
				</div>
			</nav>
			<div class="toggle-btn">
	        	<span></span>
	      	</div>
		</header>
		
		<div class="faq">
			<div class="QS">
				<h2>What this site do.</h2>
				<p>It provides the user to compare the price of products available on flipkart, snapdeal, amazon.</p>
			</div>
			<div class="QS">
				<h2>Who develop this site</h2>
				<p>Divyank Pahlazani and Gaurav Rajput</p>
			</div>
			<div class="QS">
				<h2>Q1</h2>
				<p>A1</p>
			</div>
			<div class="QS">
				<h2>Q1</h2>
				<p>A1</p>
			</div>
			<div class="QS">
				<h2>Q1</h2>
				<p>A1</p>
			</div>
		</div>
	</div>
</body>
</html>