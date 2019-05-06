<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
 
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Gotta Catch'em All</title>

<style>
</style>

</head>
<body>

<h1>Gotta Catch'em All</h1>

<table>
	<thead>
		<tr>Team</tr>
		<tr>Team Id</tr>
	</thead>
	
	<tbody>
	
		<c:forEach begin="0" end="4" var="i">
		<tr>
			<td>
				<a href="/dashboard/basketball/team/${atlanticTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}">
					<c:out value = "${atlanticTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('fullName')}"></c:out>
				</a>
			</td>
			<td>
				<c:out value = "${atlanticTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}"></c:out>
			</td>
		</tr>
				<tr>
			<td>
				<a href="/dashboard/basketball/team/${southeastTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}">			
					<c:out value = "${southeastTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('fullName')}"></c:out>
				</a>
			</td>
			<td>
				<c:out value = "${southeastTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}"></c:out>
			</td>
		</tr>
				<tr>
			<td>
				<a href="/dashboard/basketball/team/${centralTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}">			
					<c:out value = "${centralTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('fullName')}"></c:out>
				</a>
			</td>
			<td>
				<c:out value = "${centralTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}"></c:out>
			</td>
		</tr>
				<tr>
			<td>
				<a href="/dashboard/basketball/team/${northwestTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}">				
					<c:out value = "${northwestTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('fullName')}"></c:out>
				</a>
			</td>
			<td>
				<c:out value = "${northwestTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}"></c:out>
			</td>
		</tr>
				<tr>
			<td>
				<a href="/dashboard/basketball/team/${southwestTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}">				
					<c:out value = "${southwestTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('fullName')}"></c:out>
				</a>
			</td>
			<td>
				<c:out value = "${southwestTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}"></c:out>
			</td>
		</tr>
				<tr>
			<td>
				<a href="/dashboard/basketball/team/${pacificTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}">				
					<c:out value = "${pacificTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('fullName')}"></c:out>
				</a>
			</td>
			<td>
				<c:out value = "${pacificTeams.getBody().getObject().getJSONObject('api').getJSONArray('teams').getJSONObject(i).get('teamId')}"></c:out>
			</td>
		</tr>
		
		</c:forEach>
		
	</tbody>

</table>




</body>
</html>