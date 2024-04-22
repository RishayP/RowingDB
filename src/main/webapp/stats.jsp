<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Rowing DataBase</title>
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
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

     <style>
     	.box {
     		width: 600px;
     		height: 100px;
     		background-color: lightblue;
     		position: relative;
     		top: 140px;
     
     </style>
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
            
         <form method="post" action ="statistics" class ="raceinfo-form" id="raceinfo-form">		
            
	            <div class="collapse navbar-collapse" id="navbarResponsive">
	                <ul class="navbar-nav ms-auto">
	                    <li class="nav-item mx-0 mx-lg-1 dropdown">
	                        <a class="nav-link py-3 px-0 px-lg-3 rounded dropdown-toggle"
	                            href="#" role="button" id="eventTypeDropdown" data-bs-toggle="dropdown"
	                            aria-haspopup="true" aria-expanded="false">Event Type</a>
	                        <div class="dropdown-menu" aria-labelledby="eventTypeDropdown">
	                            <a class="dropdown-item" href="#">Row for the Cure</a>
	                            <a class="dropdown-item" href="#">Tail of the Lake</a>
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
	                        <input type = "text" name = "gender" class="form-control dropdown-textbox" id="eventTypeTextbox" readonly>
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
	                        <div class="dropdown-menu" aria-labelledby="experienceDropdown">
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
	                            <a class="dropdown-item" href="#">2022</a>
	                        </div>
	                        <input type = "text" name="year" class="form-control dropdown-textbox" id="eventTypeTextbox" readonly>
	                    </li>
	                </ul>
	            </div>
	        </div>
	     </nav>
	     
	     <div class="position-fixed bottom-0 end-0 p-4">
	        	<div class="form-group form-button">
	            	<input type="submit" name="search" onclick="myFunction()" id="search2" class="btn btn-primary" value="Search" />
	        	</div> 
	    </div>
	    
     </form>
     
   	<div class="container">
		<div class="container">
			<div class="col-sm-6">
		     
		     <div class = "box">
		       <div id="line-chart"></div>
		 
		        <script>
		       // Sample data
		       
		       //const xData = [1, 2, 3, 4, 5];
		       //const yData = [10, 14, 18, 24, 30];
		       
		       var xData = <%= request.getAttribute("X_Year") %>;
		       var yData = <%= request.getAttribute("Y_RaceTime") %>;
		       
		       // Create a trace (line)
		       const trace = {
		           x: xData,
		           y: yData,
		           type: 'scatter', // The type of trace (line)
		           //type: 'heatmap',
		           //colorscale: 'Viridis',
		       	   //mode: 'lines+markers', //  Display lines and markers
		       	   mode: 'lines+markers', 
		       	   //line: {
		       		//   color: 'blue',
		       		 //  width: 3
		       	   //}
		       	  // marker: {
		       		//   size:10
		       	   //}
		           name: 'RaceTime', // Legend label
		       };
		
		       
		       const config = {
		       	    displayModeBar: false, // Set to false to hide the mode bar
		      	};
		
		       // Create a data array containing the trace
		       const data = [trace];
		
		
		       // Layout configuration
		       const layout = {
		           title: '${requestScope.DynamicTitle}'.replace(/_/g, ' '),
		           xaxis: {
		               title: 'Year',
		               tickmode: 'linear',
		               dtick: 1,
		           },
		           yaxis: {
		               title: 'RaceTime in minutes',
		               tickformat: '.2f',
		               
		           },
		           hovermode: 'closest', // Set hover mode to 'closest' or customize further
		        //   hoverinfo: 'none', // Set hoverinfo to 'none' to disable hover info
		       };
		
		       // Create the plot
		       Plotly.newPlot('line-chart', data, layout, config);		
		   	</script>
		   </div>
		</div>
	</div>
</div>
    
    
    
    
    

    
    
      
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
