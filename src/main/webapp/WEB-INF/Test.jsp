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
	<tr>
		<th>Team Name</th>
		<th>Team Id</th>
		<th>Is NBA Franchise?</th>
	</tr>
	
	<tbody>
	
		<tr>
			<td>
				<select>
				<option value ="">Select Team</option>
					<c:forEach begin="0" end="${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').length()-1}" var="i">
						<c:if test="${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('isNBAFranchise').equals(true)}">					
					  		<option value="${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('teamId')}">
					  			<c:out value ="${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('fullName')}"></c:out>
					  		</option>
				  		</c:if>
				  	</c:forEach>
				</select>
			</td>
		</tr>
		
 		<c:forEach begin="0" end="${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').length()-1}" var="i">
 			<c:if test="${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('isNBAFranchise').equals(true)}">
				<tr>
					<td>
						<a href="/dashboard/basketball/team/${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('teamId')}">
							<c:out value = "${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('fullName')}"></c:out>
						</a>
					</td>
					<td>
						<c:out value = "${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('teamId')}"></c:out>
					</td>
					<td>
						<c:out value = "${allTeams.getBody().getObject().getJSONObject('league').getJSONArray('standard').getJSONObject(i).get('isNBAFranchise')}"></c:out>
					</td>			
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>

</body>
</html>