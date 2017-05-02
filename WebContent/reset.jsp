<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
	String email = request.getParameter("email");
	String pass_old = request.getParameter("pass_old");
	String pass_new = request.getParameter("pass_new");
 
 	try {
    	int i=0;
	  	java.sql.Connection con;
	    Class.forName("org.gjt.mm.mysql.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emart", "root", "root");
	    Statement st=con.createStatement();
	    
	    /* Checking weather the email is already registered or not */
	    ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and pass='"+pass_old+"'");
	    while(rs.next()){
	         i++;
	    }
	    if(i>0){
	    	st.executeUpdate("update users set pass='"+pass_new+"' where email='"+email+"'");
%>
	    	<script language="javascript">
				alert("Password has been successfully updated.");
			</script>
<%	    	response.sendRedirect("connect.jsp");
		}
	    else{
%>
	    	<script language="javascript">
				alert("Invalid Email or Password.");
			</script>		
<%
		}
	}catch(SQLException e) {
    	out.println("SQLException caught: " +e.getMessage());
  	}
%>