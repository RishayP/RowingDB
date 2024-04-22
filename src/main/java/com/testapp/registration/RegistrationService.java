package com.testapp.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationService
 */


@WebServlet("/register")
public class RegistrationService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter() ;
		out.print("something\n");
		
	    String sname =  request.getParameter("name");
	    String semail = request.getParameter("email");
	    String spwd =  request.getParameter("pass");
	    String scontact = request.getParameter("contact");
	    
	    out.print("Here is the user name => "+sname +"\n");
	    out.print("Here is the email id of user => " +semail+"\n");
	    out.print("Here is the user password => "+spwd +"\n");
	    out.print("Here is the contact of user22234455 =>"+scontact+"\n");
	    
	    Connection con = null;
	    
	    try {
	    	out.print("entered heree atleast");
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	out.print("reaching here1");
	    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webbase","root","MangoApple357!");
	    	out.print("reaching here also 2");
	    	PreparedStatement pst = con.prepareStatement("insert into login_info(name,email,pass,contact) values(?,?,?,?)");
	    	out.print("reaching here also 3");
	    	pst.setString(1, sname);
	    	pst.setString(2, semail);
	    	pst.setString(3, spwd);
	    	pst.setString(4, scontact);
	    	
	    	int numOfRows = pst.executeUpdate();
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
	    	
	    	if(numOfRows > 0)
	    	{
	    		request.setAttribute("status", "success");
	    	}
	    	else
	    	{
	    		request.setAttribute("status", "failed");
	    	}
	    	
	    	
	    	dispatcher.forward(request, response);
	    }
	    catch (Exception e){
	    	out.print("\n something777\n");
			out.println(e);
	    	e.printStackTrace();
	    	//<a href="registration.jsp"></a>
	    }
	    finally {
	    	try {
	    	con.close();	
	    	}
	    	catch(SQLException e)
	    	{
	    		e.printStackTrace();
	    	}
	    }
	    
	    
	}

	
}
