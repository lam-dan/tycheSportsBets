<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
    
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<title>Nba Player Page</title>
<script>

$(document).ready(function(){
	
    $.get("https:/data.nba.net/data/10s/prod/v1/2018/players/", function(res) {		
    	console.log(res);
        $("p").html(player);
    }, "json");
})





</script>

<style>

body{
	background-color: black;
	background: url("/curry-1.jpg");
	background-size:cover;
	background-attachment: scroll;
}

</style>
</head>
<body>

<a href ="/dashboard/basketball">Dashboard</a>
<h1>Curry</h1>

<h2>Career Stats</h2>

<table class = "table table-striped">
		<tr>
			<th>Season</th>
			<th>FGM</th>
			<th>FGA</th>
			<th>FG%</th>
			<th>3PM</th>
			<th>3PA</th>
			<th>3P%</th>
			<th>FTM</th>
			<th>FTA</th>
			<th>FT%</th>
			<th>Rebound</th>
			<th>Assists</th>
			<th>TO</th>
			<th>Steals</th>
			<th>Blocks</th>
			<th>Points</th>
		</tr>
		
		<tr>
			<td>2018-19</td>
			<td>9.6</td>
			<td>19.3</td>
			<td>49.7</td>
			<td>5.1</td>
			<td>10.7</td>
			<td>47.4</td>
			<td>4.6</td>
			<td>4.8</td>
			<td>94.8</td>
			<td>5.3</td>
			<td>5.5</td>
			<td>3.1</td>
			<td>1.3</td>
			<td>0.3</td>
			<td>28.8</td>
		</tr>	
</table>

<h2>Last 10 Games</h2>

<table class = "table table-striped">
		<tr>
			<th>Date</th>
			<th>Opponent</th>
			<th>Score</th>
			<th>FGM</th>
			<th>FGA</th>
			<th>FG%</th>
			<th>3PM</th>
			<th>3PA</th>
			<th>3P%</th>
			<th>FTM</th>
			<th>FTA</th>
			<th>FT%</th>
			<th>Rebound</th>
			<th>Assists</th>
			<th>TO</th>
			<th>Steals</th>
			<th>Blocks</th>
			<th>Points</th>
		</tr>
		
		<tr>
			<td>Dec 17</td>
			<td>MEM</td>
			<td>W 93-110</td>
			<td>6</td>
			<td>16</td>
			<td>37.5</td>
			<td>3</td>
			<td>9</td>
			<td>33.3</td>
			<td>5</td>
			<td>5</td>
			<td>100.0</td>
			<td>7</td>
			<td>1</td>
			<td>3</td>
			<td>2</td>
			<td>0</td>
			<td>20</td>
		</tr>	
</table>




</body>
</html>