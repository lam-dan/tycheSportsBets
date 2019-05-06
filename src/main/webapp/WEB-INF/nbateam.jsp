<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<meta charset="ISO-8859-1">

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<title>Basketball Team</title>
<style>


body{
	background-color: black;
	background: url("/warriors-1.jpg");
	background-size:cover;
	background-attachment: fixed;
}

.table .table-striped{
	background-color: black;
	opactiy:0.75;
}

</style>
</head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>


<body>




<a href ="/dashboard/basketball">Dashboard</a>
<h1><c:out value = "${team.getTeamName()}"></c:out></h1>

<h2>Roster Averages</h2>

<table class = "table table-striped table-hover">
	<thead>
		<tr>
			<th>Player</th>
			<th>Position</th>
			<th>Number</th>
			<th>Years Pro</th>
			<th>Country</th>
			<th>Nba Debut Year</th>
			<th>Height</th>
			<th>Weight</th>
			<th>Date of Birth</th>
			<th>Person Id</th>
			<th>Last Affiliation</th>

		</tr>
	</thead>
	<tbody>
	
 		<c:forEach begin="0" end="${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').length()-1}" var="i">
 		
 			<c:if test="${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('teamId').equals(id)}">
				<tr>
					<td>
						<a href="/dashboard/basketball/player/${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('personId')}">
							<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('firstName')}"></c:out>
							<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('lastName')}"></c:out>
						</a>
					</td>
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('pos')}"></c:out>
					</td>								
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('jersey')}"></c:out>
					</td>
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('yearsPro')}"></c:out>
					</td>
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('country')}"></c:out>
					</td>
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('nbaDebutYear')}"></c:out>
					</td>
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('heightFeet')}"></c:out>
					</td>
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('weightPounds')}"></c:out>
					</td>
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('dateOfBirthUTC')}"></c:out>
					</td>
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('personId')}"></c:out>
					</td>
					<td>
						<c:out value = "${players.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('lastAffiliation')}"></c:out>
					</td>
					
					
					
												
			</c:if>
			
		</c:forEach>
	</tbody>
</table>

<h2>Team Averages</h2>

<table class = "table table-striped table-hover">
		<tr>
			<th>Win%</th>
			<th>FG%</th>
			<th>3-point%</th>
			<th>FT%</th>
			<th>AST</th>
			<th>REB</th>
			<th>STL</th>
			<th>BLK</th>
			<th>TO</th>

		</tr>
		
		<tr>
			<td>.677</td>
			<td>48.9</td>
			<td>38.9</td>
			<td>82.4</td>
			<td>27.9</td>
			<td>45.7</td>
			<td>7.1</td>
			<td>6.1</td>
			<td>15.1</td>
		</tr>	
</table>


</body>
</html>