<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
	String user = request.getParameter("uname");
   	String pass = request.getParameter("pass");
   	String email = request.getParameter("email");
 
 	try {
    	int i=0;
	  	java.sql.Connection con;
	    Class.forName("org.gjt.mm.mysql.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emart", "root", "root");
	    Statement st=con.createStatement();
	    
	    /* Checking weather the email is already registered or not */
	    ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	    while(rs.next()){
	         i++;
	    }
	    if(i>0){
%>
	    	<script language="javascript">
				alert("Email Address is already registered.");
			</script>
			
			response.sendRedirect("connect.jsp");
<%
	    }
	    else{
	    	st.executeUpdate("insert into users values('"+user+"','"+email+"','"+pass+"');");
	    	session.setAttribute("email", email);
	    	response.sendRedirect("after_log.jsp");
	    }
	}catch(SQLException e) {
    	out.println("SQLException caught: " +e.getMessage());
  	}
%>