<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login & Sign Up Form</title>
	<link rel="stylesheet" type="text/css" href="asset/css/connect.css" />
	<link rel="stylesheet" href="asset/css/header.css">
	<script src="asset/js/jquery-1.12.2.min.js" type="text/javascript"></script>
	<script src="asset/js/script.js" type="text/javascript"></script>
	<script src="asset/js/header.js" type="text/javascript"></script>
	<script>
		function checkpass() {
			if (document.getElementById('p1').value != document.getElementById('p2').value) {
				document.getElementById('p1').setCustomValidity('Passwords must match.');
			} else {
				document.getElementById('p1').setCustomValidity('');
			}
		}
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
<body>
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
						<li><a href="index.jsp" title="">Home</a></li>
						<li><a href="connect.jsp" title="">SignUp</a></li>
						<li><a href="index.jsp#contact" title="">Contact</a></li>
						<li><a href="index.jsp#about" title="">About</a></li>
					</ul>
				</div>
			</nav>
			<div class="toggle-btn">
	        	<span></span>
	      	</div>
		</header>
	<div class="container">
		<div class="tabs">
			<ul>
				<li id="register"><a>Register</a></li>
				<li id="login"><a>Login</a></li>
				<li id="reset"><a>Reset</a></li>
			</ul>
		</div>
		<div>
			<div class="register">
				<p>Sign up free with in seconds.</p>
				
				<form method="post" name="register" action="signup.jsp">						 
					<input class="field" name="uname" required type="text" placeholder="Username" /> 
					<input class="field" name="email" required type="email" placeholder="myusername@domain.com" /> 
					<input id="p1" class="field" name="pass" required type="password" placeholder="Password" onchange="form1.p2.pattern=this.value;" />
					<input id="p2" class="field" name="pass_confirm" required type="password" placeholder="Rewrite Password" required />
					<input type="submit" onclick="checkpass()" value="Sign Up" />
				</form>
			</div>
			
			<div class="login">
				<p>SignIn in your account.</p>
				
				<form method="post" name="register" action="login.jsp">
					<input class="field" name="email" required type="email" placeholder="* myusername@domain.com" />
					<input class="field" name="pass" required type="password" name="pass" placeholder="* Password" />
					<div class="btn">
						<input type="checkbox" name="terms"> <em>Keep me logged in </em> <input type="submit" value="Login" />
					</div>
				</form>
			</div>
			
			<div class="reset">
				<p>Reset Your Password.</p>
				
				<form method="post" name="register" action="reset.jsp">			 
					<input class="field" name="email" type="email" placeholder="*myusername@domain.com" required />
					<input class="field" name="pass_old" type="password" placeholder="*Old Password" required/>
					<input class="field" name="pass_new" type="password" placeholder="*New Password" required/>
					<div class="btn">
						<input type="submit" value="Get New One !" />
							</div>
						</form>
			</div>
		</div>
	</div>
</body>
</html>
