<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
 
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<meta charset="utf-8">


<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" >

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>


<title>NBA Dashboard</title>

<script>
$(function(){
	$('a#logout').click(function(){
		if(confirm('Are you sure you want to logout?')) {
			return true;
		}
		return false;
	});
});
</script>

<script>
	$(document).ready( function () {
		$('#availableBets').DataTable();
		} );
		
</script>

<script>
	$(document).ready( function () {
		$('#takenBets').DataTable();
		} );
		
</script>

<script>
	$(document).ready( function () {
		$('#madeBets').DataTable();
		} );
		
</script>

<script>
	$(document).ready( function () {
		$('#createBets').DataTable();
		} );
		
</script>

<script>
$.extend( $.fn.dataTable.defaults, {
    searching: false,
    paging:false,
    info:false
} );
</script>

<script>

$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#availableBets #tableData").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>


<style>

.top{
	padding:1%;;
}


body{
	background: url("/raining-money.jpg");
	background-size:cover;
	background-attachment: fixed;
}

.left{
	display: inline-block;
}


.right textarea{
	width:100px;
	height:15x;
}


table{
	border-collapse: collapse;
	opacity: 0.75;
    text-align: center; 
    vertical-align: middle;
    
}

.error{
	color:red;
}

.right{
	display: inline-block;
	vertical-align: top;
	margin:30px;
	width:300px;
	height:100px;
	margin-left:1000px;
	
}
.total{
	font-weight: bold;
}

th {
  cursor: pointer;
}



</style>
</head>

<body>


<a href = "/logout" id = "logout">Logout</a>
	
<div class = "top" style="overflow-x:auto;">

	<h1><a href ="/sportsbets">TYCHE</a></h1>

	<p class = "error"><c:out value="${error}"/></p>

	<p class = "error"><c:out value ="${errorTakeBet}"></c:out></p>
		
	<div class = "left">

			<form method="post" action="/login">
		        <p>
		            <label type="email" for="email">Email</label>
		            <input type="text" id="email" name="email"/>
		            <label for="password">Password</label>
		            <input type="password" id="password" name="password"/>
		        </p>
	       		<input type="submit" value="Login"/>
	        </form>
			<form action="/register">
				<input type="submit" value="Register"/>
	        </form>
	</div>
	
	<div class = "right">
		<p>Welcome! <a href="/user/${user.id}/edit"><c:out value="${user.getFirstName()}"/></a>
		</p>
	</div>
</div>

<h1>NBA</h1>
<div class = "middle" style="overflow-x:auto;">

<h1>Bets Taken</h1>
	<table id ="takenBets" class="display">
		<thead>
			<tr>
				<th>Date</th>
				<th>Maker</th>
				<th>Your Team</th>
				<th>Maker Team</th>
				<th>Score</th>
				<th>Type</th>
				<th>Value</th>
				<th>Maker Winnings</th>
				<th>Your Potential Winnings</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${allBets}" var="allBets">
				<c:if test="${user.id != null}">
				<c:if test="${user.id == allBets.getTaker().id}">
		
			<tr>
				<td><c:out value = "${allBets.betDate}"></c:out></td>
				<td><a href = "/user/${allBets.getMaker().id}/profile"><c:out value = "${allBets.getMaker().firstName}"></c:out></a></td>
				
				<td>
					<a href="/dashboard/basketball/team/${allBets.getTakerTeam().id}">
					<c:out value = "${allBets.getTakerTeam().getCity()}"></c:out>					
					<c:out value = "${allBets.getTakerTeam().getTeamName()}"></c:out>
					</a>
				</td>
				
	 			<td>
		 			<a href="/dashboard/basketball/team/${allBets.getTakerTeam().id}">
		 			<c:out value = "${allBets.getMakerTeam().getCity()}"></c:out>		 			
		 			<c:out value = "${allBets.getMakerTeam().getTeamName()}"></c:out>
		 			</a>
	 			</td>
	 			
	 			<td></td>
	 			
	 			<td>
	 			 <c:choose>
	 				<c:when test="${allBets.type == 'Over'}">
	 					Under
	 				</c:when>
	 				 <c:when test="${allBets.type == 'Under'}">
	 					Over
	 				</c:when>
	 				<c:otherwise>
	 					<c:out value = "${allBets.type}"></c:out>
	 				</c:otherwise>
	 			</c:choose>
	 			</td>
	 			
				<td>
					<c:choose>
						<c:when test="${allBets.type == 'Spread'}">
						
							<c:if test="${-1*allBets.value > 0 }">
							 	+<c:out value = "${-1*allBets.value}"></c:out>	
							</c:if>
							<c:if test="${-1*allBets.value < 0 }">
							 	<c:out value = "${-1*allBets.value}"></c:out>	
							</c:if>
							
						</c:when>
						<c:otherwise>
							<c:out value = "${allBets.value}"></c:out>
						</c:otherwise>
					</c:choose>			
				</td>
				<td><c:out value = "${allBets.riskAmount}"></c:out></td>
				<td><c:out value = "${allBets.winAmount}"></c:out></td>
			</tr>
			</c:if>
			</c:if>
		</c:forEach>
		

		</tbody>
		
	</table>

<h1>Make a Bet</h1>

	<p class = "error"><c:out value ="${errorOnCreate}"></c:out></p>
	
	<table id = "createBets" class="display">
		<thead>
			<tr>
				<th>Date</th>
				<th>Your Team</th>
				<th>Taker Team</th>
				<th>Type</th>
				<th>Value</th>
				<th>Your Potential Winnings</th>
				<th>Taker Winnings</th>
				<th>Action</th>
			</tr>
		</thead>
				<tbody>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				</tbody>
		
		<form:form action="/createBet" method="post" modelAttribute ="bet">

		<tr>
			<td>
				<form:input type="text" path="betDate"/>
				<form:errors path ="betDate"/>
			</td>

			<td>
				<select name ="makerTeam_id">
					<option value = "">Select Team</option>
					<c:forEach items="${teams}" var="team">
				  		<option value="${team.id}">
				  			<c:out value ="${team.getCity()}"></c:out>
				  			<c:out value ="${team.getTeamName()}"></c:out>
				  		</option>
				  	</c:forEach>
				</select>
				
			</td>

			<td>
				<select name ="takerTeam_id">
				<option value ="">Select Team</option>
					<c:forEach items="${teams}" var="team">
				  		<option value="${team.id}">
				  			<c:out value ="${team.getCity()}"></c:out>
				  			<c:out value ="${team.getTeamName()}"></c:out>
				  		</option>
				  	</c:forEach>
				</select>
			</td>
			
			<td>
				<select name = "betType">
					<option value = "">Select Type</option>
					<option value="spread">Spread</option>
					<option value="Moneyline">Money-Line</option>
					<option value="Over">Over</option>
					<option value="Under">Under</option>
				</select>
			</td>
			
			<td>
				<form:input type="number" path="value"/>
				<form:errors path ="value"/>
			</td>
			
			<td>
				<form:input type="text" path="winAmount"/>
				<form:errors path ="winAmount"/>
			</td>
			
			<td>		            				
				<form:input type="text" path="riskAmount"/>
				<form:errors path ="riskAmount"/>
			<td>
			<input type ="submit" value = "Create Bet"/>
			</td>		
				
		</tr>

		</form:form>
</table>


		
<h1>Bets Made</h1>

	<p class = "error"><c:out value ="${deleteError}"></c:out></p>
	<p class = "error"><c:out value ="${errorTwo}"></c:out></p>
	<p class = "error"><c:out value ="${errorEditBet}"></c:out></p>
	<p class = "error"><c:out value ="${errorOnUpdate}"></c:out></p>
	
<table id ="madeBets" class="display">
	<thead>
		<tr>
			<th>Date</th>
			<th>Taker</th>
			<th>Your Team</th>
			<th>Taker Team</th>
			<th>Score</th>
			<th>Type</th>
			<th>Value</th>
			<th>Your Potential Winnings</th>
			<th>Taker Winnings</th>
			<th>Actions</th>
		</tr>
	</thead>
	
	<tbody>	
	
		<c:forEach items="${allBets}" var="allBets">
			<c:if test="${user.id != null}">
			<c:if test="${user.id == allBets.getMaker().id}">

		<tr>
			<td><c:out value = "${allBets.betDate}"></c:out></td>
			<td><a href = "/user/${allBets.getTaker().id}/profile"><c:out value = "${allBets.getTaker().firstName}"></c:out></a></td>
		 	<td>
	 			<a href="/dashboard/basketball/team/${allBets.getMakerTeam().id}">
	 			<c:out value = "${allBets.getMakerTeam().getCity()}"></c:out>	 			
	 			<c:out value = "${allBets.getMakerTeam().getTeamName()}"></c:out>
 			</a>
 			</td>
			 <td>
	 			<a href="/dashboard/basketball/team/${allBets.getTakerTeam().id}">
	 			<c:out value = "${allBets.getTakerTeam().getCity()}"></c:out>	
	 			<c:out value = "${allBets.getTakerTeam().getTeamName()}"></c:out>
 			</a>
 			</td>

			<td></td>
 			<td><c:out value = "${allBets.type}"></c:out></td>
 			
			<td>
				<c:if test="${allBets.value > 0 }">
					<c:if test="${allBets.type == 'Spread' }">
				 		+<c:out value = "${allBets.value}"></c:out>
				 	</c:if>
				</c:if>
				<c:if test="${allBets.value < 0 }">
				 	<c:out value = "${allBets.value}"></c:out>
				</c:if>
				<c:if test="${allBets.type == 'Over' }">
					<c:out value = "${allBets.value}"></c:out>
				</c:if>
				<c:if test="${allBets.type == 'Under' }">
					<c:out value = "${allBets.value}"></c:out>
				</c:if>
			</td>
			
			
			<td><c:out value = "${allBets.riskAmount}"></c:out></td>
			<td><c:out value = "${allBets.winAmount}"></c:out></td>
			<td>

				<c:choose>
					<c:when test= "${user.id == allBets.maker.id }">
						<a href = "/bets/${allBets.id}/edit">Edit |</a>
						<a href = "/bets/${allBets.id}/delete">Delete</a>
					</c:when>
					<c:otherwise>
					<a href = "/bets/${allBets.id}/takeBet">Take Bet</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		
		</c:if>
		</c:if>
		
		</c:forEach>
		

	</tbody>
			<tr>
 		<form:form method="PUT" action="/bet/${updateBet.getId()}/update" modelAttribute="updateBet">
 			<td>
				<form:input type="text" path="betDate"/>
				<form:errors path ="betDate"/>
 			</td>
	 		<td>
	 		</td>
	 		<td>
				<select name ="makerTeam_id">
				<option value = "">Edit Team</option>
					<c:forEach items="${teams}" var="team">
				  		<option value="${team.id}">
				  			<c:out value ="${team.getCity()}"></c:out>				  		
				  			<c:out value ="${team.getTeamName()}"></c:out>
				  		</option>
				  	</c:forEach>
				</select>
				
			</td>
			
			<td>
				<select name ="takerTeam_id">
				<option value = "">Edit Team</option>
					<c:forEach items="${teams}" var="team">
				  		<option value="${team.id}">
				  			<c:out value ="${team.getCity()}"></c:out>		
				  			<c:out value ="${team.getTeamName()}"></c:out>
				  		</option>
				  	</c:forEach>
				</select>
			</td>
			<td></td>
			
	 		<td>
				<select name = "betType">
				<option value ="">Edit Type</option>
					<option value="Spread">Spread</option>
					<option value="Moneyline">Money-Line</option>
					<option value="Over">Over</option>
					<option value="Under">Under</option>
				</select> 		
	 		</td>
			<td>
				<form:input type="number" path="value"/>
				<form:errors path ="value"/>
			</td>
			<td>		            				
				<form:input type="text" path="riskAmount"/>
				<form:errors path ="riskAmount"/>
			</td>
			<td>
				<form:input type="text" path="winAmount"/>
				<form:errors path ="winAmount"/>
			</td>

			<td>
			<input type ="submit" value = "Update Bet"/>
			</td>	
		</form:form>
		</tr>
	
	
</table>

</div>

<div class = "bottom" style="overflow-x:auto;">

<h1>Available Bets to Take</h1>


		<label>Search Bets:</label>
	<input id="myInput" type="text" placeholder="Search any table value.">
	
<table id="availableBets" class="display">
		<thead>
			<tr>		
				<th>Date</th>
				<th>Maker</th>
				<th>Taker</th>
				<th>Maker Team</th>
				<th>Taker Team</th>
				<th>Score</th>
				<th>Type</th>
				<th>Value</th>
				<th>Maker Winnings</th>
				<th>Taker Winnings</th>			
				<th>Actions</th>			
			</tr>
		</thead>


		<tbody>
 		<c:forEach items="${allBets}" var="allBets">
			<c:if test="${allBets.getTaker().id == null}">
			<c:if test="${user.id != allBets.getMaker().id}">

			<tr id = "tableData">
				<td><c:out value = "${allBets.betDate}"></c:out></td>
	
				<td><a href = "/user/${allBets.getMaker().id}/profile"><c:out value = "${allBets.getMaker().firstName}"></c:out></a></td>
				<td><a href = "/user/${allBets.getTaker().id}/profile"><c:out value = "${allBets.getTaker().firstName}"></c:out></a></td>
				
				<td>
		 			<a href="/dashboard/basketball/team/${allBets.getMakerTeam().id}">
		 			<c:out value = "${allBets.getMakerTeam().getCity()}"></c:out>	 			
		 			<c:out value = "${allBets.getMakerTeam().getTeamName()}"></c:out>
		 			</a>
	 			</td>
	 			
				 <td>	
		 			<a href="/dashboard/basketball/team/${allBets.getTakerTeam().id}">
		 			<c:out value = "${allBets.getTakerTeam().getCity()}"></c:out>		 			
		 			<c:out value = "${allBets.getTakerTeam().getTeamName()}"></c:out>
		 			</a>
	 			</td>
	
	 			<td></td>
	 			<td>
	 			
	 			<c:choose>
	 				<c:when test="${allBets.type == 'Over'}">
	 					Under
	 				</c:when>
	 				 <c:when test="${allBets.type == 'Under'}">
	 					Over
	 				</c:when>
	 				<c:otherwise>
	 					<c:out value = "${allBets.type}"></c:out>
	 				</c:otherwise>
	 			</c:choose>
	 			
	 			
	 			</td>
				<td>
					<c:choose>
						<c:when test="${allBets.type == 'Spread'}">
							<c:if test="${-1*allBets.value > 0 }">
							 	+<c:out value = "${-1*allBets.value}"></c:out>
							</c:if>
							<c:if test="${-1*allBets.value < 0 }">
							 	<c:out value = "${-1*allBets.value}"></c:out>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:out value = "${allBets.value}"></c:out>
						</c:otherwise>
					</c:choose>
				</td>
				
				<td><c:out value = "${allBets.riskAmount}"></c:out></td>
				<td><c:out value = "${allBets.winAmount}"></c:out></td>
				<td>
	
					<c:choose>
						<c:when test= "${user.id == allBets.maker.id }">
							<a href = "/bets/${allBets.id}/edit">Edit |</a>
							<a href = "/bets/${allBets.id}/delete">Delete</a>
						</c:when>
						<c:otherwise>
						<a href = "/bets/${allBets.id}/takeBet">Take Bet</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>

			</c:if>
			</c:if>
		</c:forEach>
		</tbody>
	</table>		
	
</div>

</body>
</html>