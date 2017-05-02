<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>E-Mart: Home</title>
	<link rel="stylesheet" href="asset/css/after_log.css">
	<link rel="stylesheet" href="asset/css/header.css">
	<script src="asset/js/jquery-1.12.2.min.js" type="text/javascript"></script>
	<script src="asset/js/script.js" type="text/javascript"></script>
	<script src="asset/js/header.js" type="text/javascript"></script>
	
		<script>
			function check(){
				var str = "<%=(String)session.getAttribute("email")%>";
				
				if(str!=null){
					alert("You have succesfully login to our site.");
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
		</script>
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
				<a href="main.jsp?search=mobiles">Start Shopping! Search Now</a>
			</div>			
			<div class="image"></div>
		</div>
		
		<div ></div>
	</div>
</body>
</html>