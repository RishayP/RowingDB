package statistics;

import racedata.RaceData;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Statistics
 */
@WebServlet("/statistics")
public class Statistics extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		out.print("something \n");
		
		Connection con = null;
	    
	    try {
	    	out.print("entered heree atleast");
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	String eventType =  request.getParameter("eventtype");
	    	String gender =  request.getParameter("gender");
	    	String boattype =  request.getParameter("boattype");
	    	String experience =  request.getParameter("experience");
	    	
	    	//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webbase","root","MangoApple357!");
	    	con = DriverManager.getConnection("jdbc:mysql://epsdb.mysql.database.azure.com:3306/webbase","eps","mydb123!@#");
	    	PreparedStatement pst = null;
	    	
	    	if (experience != "") {
		    	pst = con.prepareStatement("select * from raceinfo6 where EventType = ? and Gender = ? and BoatType = ? and Experience = ?");
		    	pst.setString(1, eventType);
		    	pst.setString(2, gender);
		    	pst.setString(3, boattype);
		    	pst.setString(4, experience);
	    	} else {
		    	pst = con.prepareStatement("select * from raceinfo6 where EventType = ? and Gender = ? and BoatType = ?");
		    	pst.setString(1, eventType);
		    	pst.setString(2, gender);
		    	pst.setString(3, boattype);	    		
	    	}
	    	
	    	ResultSet rs = pst.executeQuery();
	    	
			ArrayList<RaceData> raceInfoArray = new ArrayList<RaceData>();
			
			ArrayList<Integer> Year = new ArrayList<Integer>();
			ArrayList<Double> RaceTime = new ArrayList<Double>();
			
			/*
            Map<Integer, List<Double>> yearlyTimes = new HashMap<>();
            ArrayList<Integer> avgYear = new ArrayList<Integer>();
            ArrayList<Double> avgRaceTime = new ArrayList<Double>();
			*/
			
	    	while (rs.next()) {
	    		RaceData data = new RaceData();
				//data.setEventType(rs.getString("eventType"));
				//data.setGender(rs.getString("gender"));
				//strArray.add(data);
				data.setEventType(rs.getString("eventtype"));
				data.setGender(rs.getString("gender"));
				data.setBoatType(rs.getString("boatType"));
				data.setYear(rs.getString("year"));
				data.setExperience(rs.getString("experience"));
				//data.setYear(rs.getString("time"));
				
				Integer Time = rs.getObject("time", Integer.class);
				String tmp = Time.toString();
				
				data.setTime(rs.getObject("time", Integer.class));
				data.setFormattedTime(tmp);
				raceInfoArray.add(data);
			
				Integer X = Integer.parseInt(rs.getString("year"));
				Integer Y = rs.getObject("time", Integer.class);
				
				// convert time from milliseconds to minutes.
				Double rTime = (double)Y /(1000 *60);
				Year.add(X);
				RaceTime.add(rTime);
				//yearlyTimes.computeIfAbsent(X, k -> new ArrayList<>()).add(rTime);
			}
	    	
	    	/*
            yearlyTimes.forEach((year, times) -> {
                Double average = times.stream().mapToDouble(val -> val).average().orElse(0.0);
                avgYear.add(year);
                avgRaceTime.add(average);
            });
            
            List<Integer> sortedYears = avgYear.stream().sorted().collect(Collectors.toList());
            List<Double> sortedAvgTimes = sortedYears.stream()
                    .map(year -> yearlyTimes.get(year).stream().mapToDouble(val -> val).average().orElse(0.0))
                    .collect(Collectors.toList());
	    	
	    	*/
	    	
			request.setAttribute("raceinfo",raceInfoArray);
			
			request.setAttribute("X_Year",Year);
			request.setAttribute("Y_RaceTime",RaceTime);
			
			//request.setAttribute("Avg_X_Year", sortedYears);
            //request.setAttribute("Avg_Y_RaceTime", sortedAvgTimes);
			
			request.setAttribute("DynamicTitle", "_" + eventType + "_" + gender + "_" + boattype + "_" + experience); 
			
	    	
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("stats.jsp");
	    	dispatcher.forward(request, response);
	    	rs.close();
	    	pst.close();

	    }
	    catch (Exception e){
	    	out.print("\n something777\n");
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
