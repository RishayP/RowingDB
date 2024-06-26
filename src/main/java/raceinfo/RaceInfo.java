package raceinfo;

import racedata.RaceData;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RaceInfo
 */
@WebServlet("/raceinfo")
public class RaceInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter() ;
		out.print("something\n");
		
		Connection con = null;
	    
	    try {
	    	out.print("entered heree atleast");
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	String eventType =  request.getParameter("eventtype");
	    	String gender =  request.getParameter("gender");
	    	String boattype =  request.getParameter("boattype");
	    	String location =  request.getParameter("location");
	    	String experience =  request.getParameter("experience");
	    	String year =  request.getParameter("year");
	    	
	    	//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webbase","root","MangoApple357!");
	    	con = DriverManager.getConnection("jdbc:mysql://epsdb.mysql.database.azure.com:3306/webbase","eps","mydb123!@#");
	    	PreparedStatement pst = null;
	    	//PreparedStatement pst = con.prepareStatement("select * from race_info where name = ? and pass = ?");

	    	if (eventType == "" && gender == "" && boattype =="" && experience=="" &&year =="") {
	    		pst = con.prepareStatement("select * from raceinfo6 ORDER BY Year DESC");
	    	} else {
	    		
	    		int i = 1;
	    		String sqlStatement = "select * from raceinfo6 where ";
	    		
	    		Boolean IsFirstqueryAttribute = true;
	    		
	    		if (eventType != "") {
	    			sqlStatement = sqlStatement + "EventType = ?";
	    			IsFirstqueryAttribute = false;
	    		}
	    		
	    		if (gender != "") {
	    			if (IsFirstqueryAttribute == true) {
	    				sqlStatement = sqlStatement + "Gender = ?";
	    				IsFirstqueryAttribute = false;
	    			} else {
	    				sqlStatement = sqlStatement + "and Gender = ?";
	    			}
	    		}
	    		
	    		if (boattype != "") {
	    	
	    			if (IsFirstqueryAttribute == true) {
	    				sqlStatement = sqlStatement + "BoatType = ?";
	    				IsFirstqueryAttribute = false;
	    			} else {
	    				sqlStatement = sqlStatement + "and BoatType = ?";
	    			}

	    		}
	    		
	    		if (experience != "") {
	    			if (IsFirstqueryAttribute == true) {
	    				sqlStatement = sqlStatement + "Experience = ?";
	    				IsFirstqueryAttribute = false;
	    			} else {
	    				sqlStatement = sqlStatement + "and Experience = ?";
	    			}

	    		}
	    		
	    		if (year != "") {
	    			if (IsFirstqueryAttribute == true) {
	    				sqlStatement = sqlStatement + "Year = ?";
	    				IsFirstqueryAttribute = false;
	    			} else {
	    				sqlStatement = sqlStatement + "and Year = ?";
	    			}

	    		}
	    		
	    		// now that we have the sql statement prepapred, lets create the actual statment
	    		sqlStatement = sqlStatement + " ORDER BY Year DESC";
	    		pst = con.prepareStatement(sqlStatement);
	    		if (eventType != "") {
	    			pst.setString(i++, eventType);
	    		}
	    		
	    		if (gender != "") {
	    			pst.setString(i++, gender);
	    		}
	    		
	    		if (boattype != "") {
	    			pst.setString(i++, boattype);
	    		}
	    		
	    		if (experience != "") {
	    			pst.setString(i++, experience);

	    		}
	    		
	    		if (year != "") {
	    			pst.setString(i++, year);
	    		}
	    		
	    	}
	    	
	    	ResultSet rs = pst.executeQuery();
	    
			ArrayList<RaceData> raceInfoArray = new ArrayList<RaceData>();
	    	while (rs.next()) {
	    		RaceData data = new RaceData();
				data.setEventType(rs.getString("EventType"));
				data.setGender(rs.getString("gender"));
				data.setBoatType(rs.getString("boatType"));
				// location not needed any more
				data.setLocation(rs.getString("location"));
				data.setExperience(rs.getString("experience"));
				data.setYear(rs.getString("year"));
				
				Integer Time = rs.getObject("time", Integer.class);
				String tmp = Time.toString();
				
				data.setTime(rs.getObject("time", Integer.class));
				data.setFormattedTime(tmp);
				// get all the rowerNames
				String Rowers = "";
				String name = rs.getString("coxswain");
				if ((name != null) && !(name.equals(""))) {
					Rowers = Rowers + name + "; ";
				}
				
				name = rs.getString("eightseat");
				if ((name != null) && !(name.equals(""))) {
					Rowers = Rowers + name + "; ";
				}
				
				name = rs.getString("sevenseat");
				if ((name != null) && !(name.equals(""))) {
					Rowers = Rowers + name + "; ";
				}
				name = rs.getString("sixseat");
				if ((name != null) && !(name.equals(""))) {
					Rowers = Rowers + name + "; ";
				}
				
				name = rs.getString("fiveseat");
				if ((name != null) && !(name.equals(""))) {
					Rowers = Rowers + name + "; ";
				}
				
				name = rs.getString("fourseat");
				if ((name != null) && !(name.equals(""))) {
					Rowers = Rowers + name + "; ";
				}
				
				name = rs.getString("threeseat");
				if ((name != null) && !(name.equals(""))) {
					Rowers = Rowers + name + "; ";
				}
				
				name = rs.getString("twoseat");
				if ((name != null) && !(name.equals(""))) {
					Rowers = Rowers + name + "; ";
				}
				
				name = rs.getString("bowseat");
				if ((name != null) && !(name.equals(""))) {
					Rowers = Rowers + name + "; ";
				}
				
				// remove the trailing semicolon	
				if (Rowers != "") {
					Rowers= Rowers.substring(0, Rowers.length() - 2);
				}
				
				data.setRowersNames(Rowers);
				raceInfoArray.add(data);
			}
			request.setAttribute("raceinfo",raceInfoArray);
	    	
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("retrieve.jsp");
	    	dispatcher.forward(request, response);
	    	rs.close();
	    	pst.close();
	    }
	    catch (Exception e){
	    	out.print("\n something767\n");
			out.println(e);
	    	e.printStackTrace();
	    }
	    finally {
	    	try {
	    		con.close();	
	    	} catch(SQLException e)
	    	{
	    		e.printStackTrace();
	    	}
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}

}
