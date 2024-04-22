package login;

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
 * Servlet implementation class Login
 */
@WebServlet("/Log in")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.print("in the doPost\n");
		
		String sname =  request.getParameter("username");
	    String spwd =  request.getParameter("password");

	    Connection con = null;
	    
	    try {
	    	out.print("entered heree atleast");
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	out.print("reaching here1");
	    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webbase","root","MangoApple357!");
	    	out.print("reaching here also 2");
	    	PreparedStatement pst = con.prepareStatement("select * from login_info where name = ? and pass = ?");
	    	out.print("reaching here also 3");
	    	pst.setString(1, sname);
	    	pst.setString(2, spwd);
	    	
	    	int numOfRows = pst.executeUpdate();
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	    	
	    	if(numOfRows > 0)
	    	{
	    		request.setAttribute("status", "success");
	    		response.setContentType("text/html");
	    		out.print("you succeeded");
	    	}
	    	else
	    	{
	    		request.setAttribute("status", "failed");
	    		out.print("you failed");
	    		
	    	}
	    	
	    	
	    	dispatcher.forward(request, response);
	    }
	    catch (Exception e){
	    	out.print("\n something777\n");
			out.println(e);
	    	e.printStackTrace();
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
