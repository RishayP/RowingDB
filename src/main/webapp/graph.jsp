<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple Line Graph with Plotly.js</title>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
</head>
<body>
    <div id="line-chart"></div>

    <script>
        // Sample data
        const xData = [1, 2, 3, 4, 5];
        const yData = [10, 14, 18, 24, 30];

        // Create a trace (line)
        const trace = {
            x: xData,
            y: yData,
            type: 'scatter', // The type of trace (line)
            mode: 'lines+markers', // Display lines and markers
            name: 'Sample Line', // Legend label
        };
        
        const config = {
        	    displayModeBar: false, // Set to false to hide the mode bar
       	};

        // Create a data array containing the trace
        const data = [trace];

        // Layout configuration
        const layout = {
            title: 'Simple Line Graph',
            xaxis: {
                title: 'X-Axis Label',
            },
            yaxis: {
                title: 'Y-Axis Label',
            },
            hovermode: 'closest', // Set hover mode to 'closest' or customize further
            hoverinfo: 'none', // Set hoverinfo to 'none' to disable hover info
        };

        // Create the plot
        Plotly.newPlot('line-chart', data, layout, config);	
    </script>
</body>
</html>
