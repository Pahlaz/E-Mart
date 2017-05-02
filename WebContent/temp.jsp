<%@page import="java.util.concurrent.Executors"%>
<%@page import="java.util.concurrent.ExecutorService"%>
<%@page import="java.util.concurrent.FutureTask"%>
<%@page import="java.util.concurrent.Callable"%>
<%@page errorPage="error.jsp"%>

<%-- imports of the packages starts here --%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.*"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.*"%>
<%-- Imports of packages ends here--%>

<%
	String search_query = "", search_query_original = ""; //declaration

	search_query_original = request.getParameter("search"); //to get the search query from search page

	if (search_query_original == null
			|| search_query_original.length() == 0) {//check if the search query is blank
		response.sendRedirect("main.jsp");
	} else
		search_query = search_query_original.replaceAll(" ", "+");//replace space with + in search query
	final String search = search_query;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>E Mart: Results for <%=search_query_original%></title>
<link rel="stylesheet" href="asset/css/main.css">
<link rel="stylesheet" href="asset/css/feedback.css">
<script src="asset/js/jquery-1.12.2.min.js" type="text/javascript"></script>
<script src="asset/js/main.js" type="text/javascript"></script>
</head>
<body>
	<div class="wrapper">
		<header>
			<div class="logo">
				<a href="index.jsp"><img src="asset/img/logo.png" alt="E Mart"></a>
			</div>
			<div class="search">
				<form action="main.jsp" method="get">
					<input type="search" name="search" id="search"
						placeholder="Start Comparing" autofocus>
				</form>
				<a href="main.jsp"> <img
					style="border: 1px solid black; box-sizing: border-box;"
					src="asset/img/search.png">
				</a>
			</div>
			<nav>
				<ul>
					<li><a href="index.jsp" title="">Home</a></li>
					<li><a href="connect.jsp" title="">SignUp</a></li>
					<li><a href="#contact" title="">Contact</a></li>
					<li><a href="#about" title="">About</a></li>
				</ul>
			</nav>
		</header>
		<div class="box">
			<h1 align="center">Smart Shopping</h1>
		</div>
		<div class="row">
			<div class="col1">
				<h2>Browse Categories</h2>
				<ul>
					<li><a href="main.jsp?search=mobiles">Mobiles</a></li>
					<li><a href="main.jsp?search=laptops">Laptops</a></li>
					<li><a href="main.jsp?search=apparel">Clothing</a></li>
					<li><a href="main.jsp?search=shoes">Footwear</a></li>
				</ul>
			</div>
			<div class="col2">
				<h1 align="center">
					Searcing for "<%=search_query_original%>"
				</h1>
				<div class="list">
					<div class="container snapdeal">
						<%
							FutureTask<Boolean> futureTask1 = new FutureTask<Boolean>(
									new Callable<Boolean>() {
										@Override
										public Boolean call() throws Exception {
											int i = 0;
											String[] img_urls = new String[10];
											String[] product_price = new String[10];
											String[] product_name = new String[10];
											String[] refer_original_website = new String[10];
											Elements sr1, sr2, sr3, sr4, sr5, sr6;
											Document search_result_display_doc;
											try {
												search_result_display_doc = Jsoup
														.connect(
																"http://www.snapdeal.com/search?keyword="
																		+ search).timeout(0)
														.get();

												// For fetching Image URLs
												sr1 = search_result_display_doc
														.select("div.product-tuple-image");
												sr2 = sr1.select("img.product-image");
												for (Element sr : sr2) {
													img_urls[i] = sr.attr("src");
													img_urls[i] = img_urls[i].replaceAll(
															"/198x232/", "/");
													i++;
													if (i == 8)
														break;
												}

												// For fetching Product Names
												i = 0;
												sr3 = search_result_display_doc
														.select("div.product-tuple-description");
												sr4 = sr3.select("p.product-title");
												for (Element sr : sr4) {
													if (sr.hasText()) {
														product_name[i] = sr.text();
														i++;
													}
													if (i == 8)
														break;
												}

												// For fetching Original site URLs
												sr5 = search_result_display_doc
														.select("div[class=\"product-tuple-description\"]")
														.select("a[href]");
												i = 0;
												for (Element sr : sr5) {
													if (sr.hasText()) {
														refer_original_website[i] = sr
																.attr("href");
														i++;
													}
													if (i == 8)
														break;
												}

												// For fetching Product Prices
												i = 0;
												sr1 = search_result_display_doc
														.select("div[class=\"product-tuple-description\"]");
												sr2 = sr1.select("div[class=\"productPrice\"]");
												sr3 = sr2
														.select("div[class=\"product-price-row\"]");
												sr4 = sr3
														.select("span[class=\"product-price\"]");
												for (Element sr : sr4) {
													if (sr.hasText()) {
														product_price[i] = sr.text();
														i++;
													}
													if (i == 8)
														break;
												}

												for (int j = 0; j < 8; j++) {
						%>
						<div class="item">
							<div class="site">
								<img src="asset/img/snapdeal.png">
							</div>
							<a href="<%=refer_original_website[j]%>"> <img
								class="img-responsive" src="<%=img_urls[j]%>" />
							</a> <a href="<%=refer_original_website[j]%>"> <span id="pname">
									<%=product_name[j]%>
							</span>
							</a> <span id="pprice"> <%=product_price[j]%>
							</span>
						</div>
						<%
							}
												return true;
											} catch (Exception e) {
												return false;
											}

										}
									});
						%>
					</div>

					<div class="container amazon">
						<%
							FutureTask<Boolean> futureTask2 = new FutureTask<Boolean>(
									new Callable<Boolean>() {
										@Override
										public Boolean call() throws Exception {
											int j = 0;
											String[] img_urls1 = new String[10];
											String[] product_price1 = new String[10];
											String[] product_name1 = new String[10];
											String[] refer_original_website1 = new String[10];
											Elements sr11, sr21, sr31, sr41, sr51, sr61;
											Document search_result_display_doc1;
											try {
												search_result_display_doc1 = Jsoup
														.connect(
																"http://www.amazon.in/s/field-keywords="
																		+ search).timeout(0)
														.get();

												// For fetching Image URLs
												sr11 = search_result_display_doc1
														.select("li[class=\"s-result-item celwidget\"]");
												sr21 = sr11
														.select("a[class=\"a-link-normal a-text-normal\"]");
												sr31 = sr21.select("img[src]");
												j = 0;
												for (Element sr : sr31) {
													img_urls1[j] = sr.attr("src");
													j++;
													if (j == 8)
														break;
												}

												// For fetching Product Names
												j = 0;
												// sr4 = sr2.select("a[class=\"a-link-normal s-access-detail-page  a-text-normal\"]");
												sr51 = sr11.select("h2[data-attribute]");
												for (Element sr : sr51) {
													if (sr.hasText()) {
														product_name1[j] = sr
																.attr("data-attribute");
														j++;
													}
													if (j == 8)
														break;
												}

												// For fetching Original site URLs
												j = 0;
												sr31 = sr21.select("a[href]");
												for (Element sr : sr31) {
													if (sr.hasText()) {
														refer_original_website1[j] = sr
																.attr("href");
														j++;
													}
													if (j == 8)
														break;
												}

												// For fetching Product Prices
												j = 0;
												sr51 = sr21
														.select("span[class=\"a-size-base a-color-price s-price a-text-bold\"]");
												for (Element sr : sr51) {
													if (sr.hasText()) {
														product_price1[j] = sr.text();
														j++;
													}
													if (j == 8)
														break;
												}

												for (int i = 0; i < 8; i++) {
						%>
						<div class="item">
							<div class="site">
								<img src="asset/img/amazon.png">
							</div>
							<a href="<%=refer_original_website1[i]%>"> <img
								src="<%=img_urls1[i]%>" />
							</a> <a href="<%=refer_original_website1[i]%>"> <span id="pname">
									<%=product_name1[i]%>
							</span>
							</a> <span id="pprice"> <%=product_price1[i]%>
							</span>
						</div>
						<%
							}
												return true;
											} catch (Exception e) {
												return false;
											}

										}
									});
						%>
					</div>

					<div class="container flipkart">
						<%
							FutureTask<Boolean> futureTask3 = new FutureTask<Boolean>(new Callable<Boolean>() {
										@Override
										public Boolean call() throws Exception {
											int k = 0;
											String[] img_urls2 = new String[10];
											String[] product_price2 = new String[10];
											String[] product_name2 = new String[10];
											String[] refer_original_website2 = new String[10];
											Elements sr12, sr22, sr32, sr42, sr52, sr62;
											Document doc2;
											try {
												doc2 = Jsoup
														.connect(
																"http://www.flipkart.com/search?q="
																		+ search).timeout(0)
														.get();
												sr12 = doc2.select(
														"div[class=\"pu-visual-section\"]")
														.select("img[src]");

												if (!sr12.isEmpty()
														|| !(sr12 = doc2.select(
																"div[class=\"lu-image\"]")
																.select("img[src]")).isEmpty()) {
													k = 0;
													for (Element src : sr12) {
														img_urls2[k] = src.attr("data-src");
														img_urls2[k] = img_urls2[k].replaceAll(
																"125x125", "250x250");
														k++;
														if (k == 8)
															break;
													}

													sr22 = doc2
															.select("a[class=\"pu-image fk-product-thumb\"]")
															.select("a[href");
													k = 0;
													for (Element src : sr22) {
														refer_original_website2[k] = "http://flipkart.com"
																+ src.attr("href");
														k++;
														if (k == 8)
															break;
													}

													sr32 = doc2.select(
															"a[class=\"fk-display-block\"]")
															.select("a[title");
													k = 0;
													for (Element src : sr32) {
														product_name2[k] = src.attr("title");
														k++;
														if (k == 8)
															break;
													}

													sr42 = doc2.select(
															"div[class=\"pu-price\"]").select(
															"span[class*=fk-font-17 fk-bold]");
													k = 0;
													for (Element src : sr42) {
														product_price2[k] = src.text();
														k++;
														if (k == 8)
															break;
													}

													for (k = 0; k < 8; k++) {
						%>
						<div class="item">
							<div class="site">
								<img src="asset/img/flipkart.png">
							</div>
							<a href="<%=refer_original_website2[k]%>"> <img
								src="<%=img_urls2[k]%>" />
							</a> <a href="<%=refer_original_website2[k]%>"> <span id="pname">
									<%=product_name2[k]%>
							</span>
							</a> <span id="pprice"> <%=product_price2[k]%>
							</span>

						</div>
						<%
							}
												}
												return true;
											} catch (Exception e) {
												return false;
											}

										}
									});

							ExecutorService executorService = Executors.newFixedThreadPool(3);

							executorService.execute(futureTask1);
							executorService.execute(futureTask2);
							executorService.execute(futureTask3);

							while (true) {
								if (futureTask1.isDone() && futureTask2.isDone()
										&& futureTask3.isDone()) {
									//Here work is done
									try {
										if (futureTask1.get()) {
											//task 1 done it's work correctly
										} else {
											//some problem in task 
										}
									} catch (Exception e) {
										e.printStackTrace();
									}

								}

								try {
									Thread.sleep(100);
								} catch (InterruptedException e) {
									e.printStackTrace();
								}
							}
						%>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>