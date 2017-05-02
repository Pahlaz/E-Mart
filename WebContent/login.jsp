<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
	String user = request.getParameter("uname");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
  	
  	int i=0;
  	try {
    	java.sql.Connection con;
    	Class.forName("org.gjt.mm.mysql.Driver");
    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emart", "root", "root");
    
   		Statement st=con.createStatement();
   		
   		/* Checking weather the user has already registered or not */
    	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and pass='"+pass+"'");
    	while(rs.next()){
   			i++;
   		} 
        if(i>0){
        	session.setAttribute("email", email);
            response.sendRedirect("after_log.jsp") ;
        }  
        else{
        	/* Wrong Username or Password */
%>
        	
        	<script language="javascript">
    			alert("Invalid Email or Password.");
    		</script>
<% 			
			response.sendRedirect("connect.jsp");
        }  
  	}catch(SQLException e) {
    	out.println("SQLException caught: " +e.getMessage());
  	}
%>