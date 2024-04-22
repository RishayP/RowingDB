<!DOCTYPE html>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="raceinfo.RaceInfo"%>

<%@page import="java.sql.Connection"%>


<html lang="en">
<head>

<style>
table {
	border-collapse: separate;
	width: 100%;
	border: none;
}

th {
	border-bottom: 1px solid black;
}

td {
  border: none;
  padding: 10px;
}

</style>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Rowing DataBase</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary t1ext-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="#page-top">EPS Rowing Database</a>
            <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
                type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item mx-0 mx-lg-1 dropdown">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
                            href="#" role="button" name="eventypedropdown" id="eventTypeDropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Event Type</a>
                        <div class="dropdown-menu" aria-labelledby="eventTypeDropdown">
                            <a class="dropdown-item" href="#">Row for the Cure</a>
                            <a class="dropdown-item" href="#">Tail of the Lake</a>
                        </div>
                        <input type = "text" class="form-control dropdown-textbox" name="eventtype" id="eventTypeTextbox" readonly>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1 dropdown">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
                            href="#" role="button" id="genderDropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Gender</a>
                        <div class="dropdown-menu" aria-labelledby="genderDropdown">
                            <a class="dropdown-item" href="#">Mens</a>
                            <a class="dropdown-item" href="#">Womens</a>
                        </div>
                        <input type = "text" class="form-control dropdown-textbox" id="genderTextbox" readonly>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1 dropdown">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
                            href="#" role="button" id="boatTypeDropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Boat Type</a>
                        <div class="dropdown-menu" aria-labelledby="boatTypeDropdown">
                            <a class="dropdown-item" href="#">1x</a>
                            <a class="dropdown-item" href="#">2x</a>
                            <a class="dropdown-item" href="#">4x</a>
                            <a class="dropdown-item" href="#">4x+</a>
                            <a class="dropdown-item" href="#">8x</a>
                        </div>
                        <input type = "text" class="form-control dropdown-textbox" id="boatTypeTextbox" readonly>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1 dropdown">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
                            href="#" role="button" id="locationDropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Location</a>
                        <div class="dropdown-menu" aria-labelledby="locationDropdown">
                            <a class="dropdown-item" href="#">Lake Union</a>
                        </div>
                        <input type = "text" class="form-control dropdown-textbox" id="locationTextbox" readonly>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1 dropdown">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
                            href="#" role="button" id="yearDropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Year</a>
                        <div class="dropdown-menu" aria-labelledby="yearDropdown">
                            <a class="dropdown-item" href="#">2022</a>
                        </div>
                        <input type = "text" class="form-control dropdown-textbox" id="yearTextbox" readonly>
                    </li>	
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="position-fixed bottom-0 end-0 p-4">
    	<form method="post" action ="raceinfo" class ="raceinfo-form" id="raceinfo-form">				
        	<div class="form-group form-button">
            	<input type="submit" name="search" id="search" class="btn btn-primary" value="Search" />
        	</div>
        </form>
    </div>
    
    <div class="position-absolute top-50 start-50 translate-middle p-4">
  <%
		String id = request.getParameter("userid");
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String database = "webbase";
		String userid = "root";
		String password = "MangoApple357!";
		try {
		Class.forName(driver);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		PreparedStatement pst = null;
		
%>
	<table border="1">
		<tr>
			<td>Event Type</td>
			<td>Gender</td>
			<td>Boat Type</td>
			<td>Location</td>
			<td>Year</td>
			
		</tr>
	<%
	try{
	//connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	String selectedValue = request.getParameter("eventTypeDropdown");
	String selectedValue2 = request.getParameter("genderDropdown");
	
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webbase","root","MangoApple357!");
	statement=connection.createStatement();
	String sql ="select * from race_info" ; // where EventType = ?";
	
	//pst = connection.prepareStatement(sql);
	//pst.setString(1, selectedValue);
	resultSet = statement.executeQuery(sql);
	
	while(resultSet.next()){
	%>
	<tr>
		<td><%=resultSet.getString("EventType") %></td>
		<td><%=resultSet.getString("Gender") %></td>
		<td><%=resultSet.getString("BoatType") %></td>
		<td><%=resultSet.getString("Location") %></td>
		<td><%=resultSet.getString("Year") %></td>
		
	</tr>
	<%
	}
	connection.close();	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table> 
</div>
		
	<!--  
	<script>
    // JavaScript code to populate the table with data
    var tableBody = document.getElementById("tableBody");
    
    // Sample data (you should replace this with your actual data)
    var data = [
        { name: "John", age: 30 },
        { name: "Alice", age: 25 },
        // Add more data as needed
    ];
    
    // Loop through the data and create table rows
    for (var i = 0; i < data.length; i++) {
        var row = document.createElement("tr");
        var nameCell = document.createElement("td");
        var ageCell = document.createElement("td");

        nameCell.textContent = data[i].name;
        ageCell.textContent = data[i].age;

        row.appendChild(nameCell);
        row.appendChild(ageCell);

        tableBody.appendChild(row);
    }
	</script>
    -->
    
    <!-- Rest of your content remains unchanged -->
    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS -->
    <script src="js/scripts.js"></script>
    <script>
        // JavaScript code to update the textboxes when dropdown options are selected
        document.querySelectorAll('.dropdown-item').forEach(item => {
            item.addEventListener('click', event => {
                const dropdown = event.target.closest('.dropdown');
                const textbox = dropdown.querySelector('.dropdown-textbox');
                textbox.value = event.target.textContent;
            });
        });
    </script>
    </body>
</html>
