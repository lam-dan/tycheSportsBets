<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<style>


body{
	background-color: black;
	background: url("/Bannerlords-1.jpg");
	background-size:cover;
}

.container{
	width: 460px;
	vertical-align: top;
	display: inline-block;
	height:500%;
	padding: 3%;
	margin-top: 2%;
}

.register{
	margin-left: 154%;
	background-color:white;
	width:73%;
	outline:1px solid black;
	padding:20px;

}

ul{

	margin-left:15%;
}


</style>
</head>

<body>

<div class = "container">
	<a href ="/dashboard/basketball">Dashboard</a>
	<div class ="register">
    <ul><h1>Player Stats</h1></ul>
    <ul><c:out value = "${userProfile.getFirstName()}"></c:out> <c:out value = "${userProfile.getLastName()}"></c:out> </ul>
    <ul>Total Earnings: $1,200</ul>
    <ul>Total Bets Made: 45</ul>
    <ul>Total Bets Taken: 78</ul>
	</div>
</div>


</body>
</html>