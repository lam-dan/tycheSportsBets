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
	margin-left:2%;
	margin-top: 2%;
	
}

.register{
	margin-left: 146%;
	background-color:white;
	width:73%;
	outline:1px solid black;
	padding:20px;

}

</style>


</head>

<body>

<div class = "container">
	<a href ="/dashboard/basketball">Dashboard</a>
	<div class="register">
    <h1>Register!</h1>
    
    <p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration" modelAttribute="user">
    
    	<p>
            <form:label path="firstName">First Name:</form:label>
            <form:input type="text" path="firstName"/>
        </p>
        
        <p>
            <form:label path="lastName">Last Name:</form:label>
            <form:input type="text" path="lastName"/>
        </p>
        
        <p>
            <form:label path="email">Email:</form:label>
            <form:input type="email" path="email"/>
        </p>
        <p>
            <form:label path="CreditCardNumber">Credit Card Number:</form:label>
            <form:input type="number" path="CreditCardNumber"/>
        </p>           
        
        <p>
            <form:label path="password">Password:</form:label>
            <form:password path="password"/>
        </p>
        <p>
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:password path="passwordConfirmation"/>
        </p>
        <input type="submit" value="Register!"/>
    </form:form>
    </div>
</div>


</body>
</html>