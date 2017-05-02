<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>E-Mart: Home</title>
	<link rel="stylesheet" href="asset/css/style.css">
	<link rel="stylesheet" href="asset/css/header.css">
	<script src="asset/js/jquery-1.12.2.min.js" type="text/javascript"></script>
	<script src="asset/js/script.js" type="text/javascript"></script>
	<script src="asset/js/header.js" type="text/javascript"></script>
	<%-- <script>
			function check(){
				var str = "<%=(String)session.getAttribute("email")%>";
				
				if(str!=null){
					$('header #signup').hide();
					$('header #logout').css({'display': 'inline-block'});
					$('header #logout a').attr('href', '');
					$('header #logout').attr('onclick', 'logout()');
				}
				else{
					
				}
			}
			function logout(){
				$('header #logout').on('click', function(){
					<%
					 	session.setAttribute("email",null);
						session.invalidate(); 
					%>
				});
				$('header #signup').css({'display': 'inline-block'});
				$('header #logout').hide();
				$('header #logout a').attr('href', 'connect.jsp');
				alert("You have succesfully logout from our site.");
			}
	</script> --%>
</head>
<body onload="check()">
	<div class="wrapper">
		<header data-log="none">
			<div class="logo">
				<a href="index.jsp"><img src="asset/img/logo.png" alt="E Mart"></a>
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
						<li id="home"><a href="index.jsp">Home</a></li>
						<li id="signup"><a href="connect.jsp">SignUp</a></li>
						<li id="logout"><a href="connect.jsp">LogOut</a></li>
						<li id="contact"><a href="index.jsp#contact">Contact</a></li>
						<li id="about"><a href="index.jsp#about">About</a></li>
					</ul>
				</div>
			</nav>
			<div class="toggle-btn">
	        	<span></span>
	      	</div>
		</header>
		
		<div class="front">
			<div style="overflow hidden;">
				<a href="main.jsp?search=mobiles">Start Shopping</a>
			</div>			
			<div class="image"></div>
		</div>
		
		<div class="block">
			<div class="info">
				<h1>Smart Shopping</h1>
				<hr>
				<p>
					Make your shopping experience easier. Search for a product and get the relevant products available on sites like Flipkart, Snapdeal, 
					Amazon; a fast way for online shopping. 
				</p>
			</div>
		</div>
		
		<div class="details block change">
			<h1 align="center">Products available on our website</h1><br>
			<div align="center" class="slider">
				<div class="left"> <img src="asset/img/left.png"> </div>
				<div class="container">
					<div class="item">
						<a href="main.jsp?search=apple+laptop" target="_black"><img src="asset/img/laptop.png"></a>
					</div>
					<div class="item">
						<a href="main.jsp?search=tshirts" target="_black"><img src="asset/img/tshirt.png"></a>
					</div>
					<div class="item">
						<a href="main.jsp?search=headphones" target="_black"><img src="asset/img/beats.png"></a>
					</div>
					<div class="item">
						<a href="main.jsp?search=web+designing" target="_black"><img src="asset/img/web.png"></a>
					</div>
					<div class="item">
						<a href="main.jsp?search=mobiles" target="_black"><img src="asset/img/iphone.png"></a>
					</div>
					<div class="item">
						<a href="main.jsp?search=pendrive" target="_black"><img src="asset/img/pendrive.ico"></a>
					</div>
					<div class="item">
						<a href="main.jsp?search=puma" target="_black"><img src="asset/img/puma.png"></a>
					</div>
				</div>
				
				<div class="right"> <img src="asset/img/right.png"> </div>
			</div>
		</div>
		
		<div class="block">
			<div class="periscope">	</div>
		</div>
		<div class="contact block" id="contact">
			<h1 align="center">Contact Us</h1><br>
			<form align="center" action="send.jsp" method="post">
				<input type="text" name="name" placeholder="Name*"><br><br><br>
				<input type="email" name="from" placeholder="Email*"><br><br><br>
				<textarea placeholder="Message" name="msg"></textarea><br><br><br>
				<input type="submit" name="Submit" value="Submit">
			</form>
		</div>
		<div  class="about block change" id="about">
			<h1>Our Team</h1><br>
			<div class="team">
				<img src="asset/img/divyank.jpg" alt="Divyank" title="Divyank Pahlazani">
				<div style="display:table-cell;">
					<div class="desc">
						<h3>Divyank Pahlazani</h3>
						<h4>divyank.pahlazani_cs13@gla.ac.in</h4>
					</div>
				</div>
			</div>
			<div class="team">
				<img src="asset/img/gaurav.jpg" alt="Gaurav" title="Gaurav Rajput">
				<div style="display:table-cell;">
					<div class="desc">
						<h3>Gaurav Rajput</h3>
						<h4>gaurav.rajput_cs13@gla.ac.in</h4>
					</div>
				</div>
			</div>
		</div>
			
		<div class="share block">
			<h3 style="display:inline-block;margin-right:50px;">SHARE THIS PAGE!</h3>
			<div style="display:inline-block;height:40px;position:relative;top:14px;" class="social-icons">
               	<a href=""></a><img src="asset/img/g+.png" title="google+"></a>
               	<a href=""><img src="asset/img/fb.png" title="facebook"></a>
               	<a href=""><img src="asset/img/t.png" title="twitter"></a>
               	<a href=""><img src="asset/img/in.png" title="linkedin"></a>
               	<a href=""><img src="asset/img/github.png" title="github"></a>
        	</div>
        </div>
		</div>

		<footer>
			<h3>Copyright (c) 2016 E Mart. <a href="">Terms of Use</a> | <a href="">Privacy Policy</a></h3>
		</footer>
	</div>
</body>
</html>