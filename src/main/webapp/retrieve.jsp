<!DOCTYPE html>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="racedata.RaceData"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>    
<%@page import="java.util.ArrayList"%>

<html lang="en">
<head>

<style>

.centered-container {
    display: flex;
    flex-direction: column;
    align-items: center;
}

table{
  border: 2px solid black;
  border-collapse: collapse;
  margin-top: 130px;
  padding: 15px;
  overflow: scroll;
  background-color:Tomato
  margin: auto;
}

th, td {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 15px;
  background-color:White
}
</style>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Rowing Database</title>
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
            <a class="navbar-brand" href="#page-top">EPS Rowing Database retrieve</a>
            <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
                type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu <i class="fas fa-bars"></i>
            </button>



    
    	<form method="post" action ="raceinfo" class ="raceinfo-form" id="raceinfo-form">				
            
            
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item mx-0 mx-lg-1 dropdown">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
                            href="#" role="button" id="eventTypeDropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Event Type</a>
                        <div class="dropdown-menu" aria-labelledby="eventTypeDropdown">
                            <a class="dropdown-item" href="#">Row for the Cure</a>
                            <a class="dropdown-item" href="#">Tail of the Lake</a>
                            <a class="dropdown-item" href="#">American Lake Fall Classic</a>
                        </div>
                        <input type = "text" name = "eventtype" class="form-control dropdown-textbox" id="eventTypeTextbox" readonly>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1 dropdown">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
                            href="#" role="button" id="genderDropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Gender</a>
                        <div class="dropdown-menu" aria-labelledby="genderDropdown">
                            <a class="dropdown-item" href="#">Mens</a>
                            <a class="dropdown-item" href="#">Womens</a>
                        </div>
                        <input type = "text" name="gender" class="form-control dropdown-textbox" id="eventTypeTextbox" readonly>
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
                        <input type = "text" name="boattype" class="form-control dropdown-textbox" id="eventTypeTextbox" readonly>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1 dropdown">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
                            href="#" role="button" id="experienceDropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Experience</a>
                        <div class="dropdown-menu" aria-labelledby="locationDropdown">
                            <a class="dropdown-item" href="#">Novice</a>
                            <a class="dropdown-item" href="#">U17</a>
                            <a class="dropdown-item" href="#">U19</a>
                            <a class="dropdown-item" href="#">Jr</a>
                        </div>
                        <input type = "text" name="experience" class="form-control dropdown-textbox" id="eventTypeTextbox" readonly>
                    </li>
                    <li class="nav-item mx-0 mx-lg-1 dropdown">
                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
                            href="#" role="button" id="yearDropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Year</a>
                        <div class="dropdown-menu" aria-labelledby="yearDropdown">
                            <a class="dropdown-item" href="#">2023</a>
                            <a class="dropdown-item" href="#">2022</a>
                            <a class="dropdown-item" href="#">2021</a>
                            <a class="dropdown-item" href="#">2020</a>
                            <a class="dropdown-item" href="#">2019</a>
                            <a class="dropdown-item" href="#">2018</a>
                            <a class="dropdown-item" href="#">2017</a>
                            <a class="dropdown-item" href="#">2016</a>
                            <a class="dropdown-item" href="#">2015</a>
                        </div>
                        <input type = "text" name="year" class="form-control dropdown-textbox" id="eventTypeTextbox" readonly>
                    </li>	
                </ul>
            </div>
        </div>
    </nav>
    
	    
    <!--  
    	<div class="position-absolute top-50 start-50 translate-middle p-4">
 	-->	​
 	
 	
 	<div    class="centered-container">      <!--   "position-absolute top-50 start-50 translate-middle p-4">  --> 
 		<table>
		<tbody id="tableBody">
		 <tr>
            <th>EventType</th>
            <th>Gender</th>
            <th>BoatType</th>
            <th>Experience</th>
            <th>Year</th>
            <th>Time</th>
            <th>Rowers</th>
           	
        </tr>
        <% 
            ArrayList<RaceData> raceDataArray= 
                (ArrayList<RaceData>) request.getAttribute("raceinfo");
            if (raceDataArray != null) {
            	for(RaceData r:raceDataArray){
         %>
    
         
        <tr>
          <td><%=r.getEventType()%></td>
          <td><%=r.getGender()%></td>
          <td><%=r.getBoatType()%></td>
          <td><%=r.getExperience()%></td>
          <td><%=r.getYear()%></td>
          <td><%=r.getFormattedTime()%></td>
          <td><%=r.getRowersNames()%></td>
        </tr>
	    <%  }
            	}%>
	    
	     </tbody>
		</table>
	</div>
		
		<div class="position-fixed bottom-0 end-0 p-4">
	        	<div class="form-group form-button">
	            	<input type="submit" name="search" onclick="myFunction()" id="search" class="btn btn-primary" value="Search" />
	        	</div> 
	    </div>
    </form>
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
        
        function myFunction() {
        	document.getElementById("search").disabled = false;
        	}
    </script>
    </body>
</html>
