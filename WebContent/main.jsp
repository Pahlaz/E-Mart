<%@page errorPage="error.jsp" %>

<%-- imports of the packages starts here --%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.*"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.*"%>
<%@page import="com.emart.fetcher.*"%>
<%-- Imports of packages ends here--%>

<%
	String search_query="", search_query_original="";	//declaration
	
 	search_query_original = request.getParameter("search"); //to get the search query from search page
 	if(search_query_original == null || search_query_original.length()==0 ){//check if the search query is blank
   		response.sendRedirect("main.jsp?search=mouse");
 	}
	else 
    	search_query = search_query_original.replaceAll(" ","+");//replace space with + in search query
    	
    Fetcher fetch = new Fetcher();
    int errorcount = 0, temp;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>E Mart: Results for <%=search_query_original%></title>
	<link rel="stylesheet" href="asset/css/main.css">
	<link rel="stylesheet" href="asset/css/header.css">
	<link rel="stylesheet" href="asset/css/feedback.css">
	
	<script src="asset/js/jquery-1.12.2.min.js" type="text/javascript"></script>
	<script src="asset/js/main.js" type="text/javascript"></script>
	<script src="asset/js/header.js" type="text/javascript"></script>
</head>
<body>
	<div class="wrapper">
		<header>
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
				<div style="background: rgba(73,75,87,.7);margin-top: 50px;width: inherit;">
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
		<div class="row">
			<div class="col1">
				<h2>Browse Categories</h2>
				<ul>
					<li><a target="_blank" href="main.jsp?search=mobiles">Mobiles</a></li>
					<li><a target="_blank" href="main.jsp?search=tablets">Tablets</a></li>
					<li><a target="_blank" href="main.jsp?search=laptops">Laptops</a></li>
					<li><a target="_blank" href="main.jsp?search=Wearable+Smart+Device">Wearable Smart Device</a></li>
					<hr>
					<li><a target="_blank" href="main.jsp?search=MEN'S+CLOTHING">Men's Fashion</a></li>
					<li><a target="_blank" href="main.jsp?search=women's+fashion">Women's Fashion</a></li>
					<li><a target="_blank" href="main.jsp?search=Footwear">Footwear</a></li>
					<li><a target="_blank" href="main.jsp?search=tshirts">Clothing</a></li>
					<li><a target="_blank" href="main.jsp?search=watches">Watches</a></li>
					<hr>
					<li><a target="_blank" href="main.jsp?search=Books">Books</a></li>
					<li><a target="_blank" href="main.jsp?search=gaming">Gaming</a></li>
					<li><a target="_blank" href="main.jsp?search=MP3+and+Media+Players">Music</a></li>
					<li><a target="_blank" href="main.jsp?search=Movies+&+TV Shows">Movies and TV Shows</a></li>
				</ul>
			</div>
			<div class="col2">
				<h1 align="center">Searching for "<%=search_query_original%>"</h1>
				<div class="list">
					<div class="container snapdeal">
						<% 	
							temp = fetch.snapdeal(search_query);
							
							if(temp == 1){
								errorcount++;
							}
							else
						    	for(int i=0;i<4;i++){
						%>
						<div class="item">
							<div class="site">
								<img src="asset/img/snapdeal.png">
							</div>
							<a href="<%=fetch.refer_original_website[i]%>"> <img class="img-responsive" src="<%=fetch.img_urls[i]%>" /> </a>
							<a href="<%=fetch.refer_original_website[i]%>"> <span id="pname"> <%=fetch.product_name[i]%> </span> </a>
							<span id="pprice"> <%=fetch.product_price[i]%> </span>
						</div>
						<%              
								}
						%>
					</div>    
					   
				    <div class="container amazon">
						<%  
							temp = fetch.amazon(search_query);

							if(temp == 1){
								errorcount++;
							}
							else
								for(int i=0;i<6;i++){
						%>
						<div class="item">
							<div class="site">
								<img src="asset/img/amazon.png">
							</div>
							<a href="<%=fetch.refer_original_website[i]%>"> <img class="img-responsive" src="<%=fetch.img_urls[i]%>" /> </a>
							<a href="<%=fetch.refer_original_website[i]%>"> <span id="pname"> <%=fetch.product_name[i]%> </span> </a>
							<span id="pprice">Rs.<%=fetch.product_price[i]%></span>
						</div>
						<%              
						    	}
					    %>
					</div>
					  
					<div class="container flipkart">
						<%  
							temp = fetch.flipkart(search_query);

							if(temp == 1){
								errorcount++;
							}		
							else
								for(int i=0;i<6;i++){
						%>
						<div class="item">
							<div class="site">
								<img src="asset/img/flipkart.png">
							</div>
							<a href="<%=fetch.refer_original_website[i]%>"> <img class="img-responsive" src="<%=fetch.img_urls[i]%>" /> </a>
							<a href="<%=fetch.refer_original_website[i]%>"> <span id="pname"> <%=fetch.product_name[i]%> </span> </a>
							<span id="pprice"> <%=fetch.product_price[i]%> </span>
						</div>
						<%              
					    		}       
					    %>
					</div>    
					<%
						if(errorcount>1){
							response.sendRedirect("error.jsp");
						}
					%>
					<!-- <div class="more"><a>more</a><span> ></span></div> -->
					<script type="text/javascript">
						$('.more').on('click', function(){
							<%  
								fetch.more(search_query);
								
							%>
						});
					</script>
				</div>
			</div>
		</div>
		<div class="chat-box">
			<div class="chat-head">
				<h2>Feedback</h2>
				<img src="asset/img/up.png" alt="">
			</div>
			<div class="chat-body">
				<div class="msg-insert"></div>
				<div class="chat-text">
					<textarea placeholder="Send"></textarea>
				</div>
			</div>
		</div>
		<footer>
			<h3>Copyright (c) 2016 E Mart. <a href="">Terms of Use</a> | <a href="">Privacy Policy</a></h3>
		</footer>
	</div>
</body>
</html>