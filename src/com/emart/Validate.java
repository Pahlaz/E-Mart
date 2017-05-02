/*package com.emart;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Validate() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	void dbConnect(){
		java.sql.Connection con = null;
    
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    	try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emart", "root", "root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
   		try {
			Statement st=con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void login(String user, String pass, String email){
		ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and pass='"+pass+"'");
    	while(rs.next()){
   			i++;
   		} 
        if(i>0){
        	session.setAttribute("email", email);
%>
			<script language="javascript">
				alert("You have succesfully login to our site.");
				$('header').attr('data-log', 'in');
			</script>
<%
             response.sendRedirect("after_log.html") ;
        }  
        else{
        	 Wrong Username or Password 
%>
        	<script language="javascript">
    			alert("Invalid Email or Password.");
    		</script>
<% 			
			 response.sendRedirect("connect.jsp"); 
        }
	}
	
	public void register(String user, String pass, String email){
		
	}
}
*/