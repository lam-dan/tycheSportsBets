<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<meta charset="utf-8">
<title>Sports Bets</title>

</head>
<style>
html {
    background: url("/backgroundbettingscene.png");
     background-size: cover;
     display: inline;
     vertical-align: top;
     text-align: center;
}

.main {
    display: inline-block;
    vertical-align: top;
    height: 600px;
    margin: 0px 0px 0px 0px;
    padding: 0px 0px 0px 0px;
}

.imgbox {
    vertical-align: top;
    display: inline-block;
    width: 29%;
    margin: 0px -80px 80px 0px;
    padding: 0px 0px 0px 0px;
}
.imgboxufc {
    vertical-align: top;
    display: inline-block;
    width: 20%;
    margin: 200px -100px 100px -200px;
    padding: 0px 0px 330px 0px;
}
.imgboxnhl {
    vertical-align: top;
    display: inline-block;
    width: 25%;
    margin: 150px -100px 100px -100px;
    padding: 0px 0px 330px 0px;
}
.imgboxmls {
    vertical-align: top;
    display: inline-block;
    width: 25%;
    margin: 80px -200px 100px -100px;
    padding: 80px 0px 320px 0px;
}
.imgboxnba {
    vertical-align: top;
    display: inline-block;
    width: 30%;
    margin: 0px -240px 20px -280px;
    padding: 80px 0px 280px 0px;
}
.imgboxnfl {
    vertical-align: top;
    display: inline-block;
    width: 25%;
    height: 100%;
    margin: 20px -120px 80px -190px;
    padding: 120px 100px 300px 0px;
}
.imgboxmlb {
    vertical-align: top;
    display: inline-block;
    height: 100%;
    width: 30%;
    margin: 80px -150px 150px -110px;
    padding: 100px 0px 310px 0px;
}
.imgboxten {
    vertical-align: top;
    display: inline-block;
    width: 25%;
    margin: 80px -180px 0px -200px;
    padding: 100px 0px 300px 0px;
}

.logos{

    text-align: top;
    filter: drop-shadow(10px 10px 5px #000000);
     width: 25%;
     height: 25%;
     -webkit-transition: width .5s, height .5s; /* For Safari 3.1 to 6.0 */
     transition: width .5s, height .5s;
     margin: 0px 0px 0px 0px;
}
.logomain{
    width: 35%;
     height: 35%;
}
.tyche {
    text-align: center;
    display: inline-block;
    vertical-align: top;
    width: 100%;
    min-height: 100px;
    margin: 0px 0px 0px 0px;
    padding: 30px 0px 0px 0px;

}
.bottom {
    display: inline-block;
    vertical-align: top;
    min-height: 300px;
    width: 100%;
    margin: 10px 0px 0px 0px;
    padding: 10px 0px 0px 0px;
}

.logos:hover {
    
 width: 40%;
 height: 40%;
}

</style>


<body>



<div class="main">
<div class="tyche">
<img src="/tyche_logo_original.png" alt="TYCHE" class="logomain">
</div>

<h1></h1>
<div class="imgboxten">
<a href="/dashboard/tennis">
<img src="/wtt_logo.png" alt="MLB" class="logos">
</a>
</div>
<div class="imgboxmlb">
<a href="/dashboard/baseball">
<img src="/mlb_logo.png" alt="MLB" class="logos">
</a>
</div>
<div class="imgboxnfl">
<a href="/dashboard/football">
<img src="/nfl_logo.png" alt="NFL" class="logos">
</a>
</div>
<div class="imgboxnba">
<a href="/dashboard/basketball">
<img src="/nba_logo.png" alt="NBA" class="logos">
</a>
</div>

<div class="imgboxmls">
<a href="/dashboard/soccer">
<img src="/mls_logo.png" alt="MLS" class="logos">
</a>
</div>
<div class="imgboxnhl">
<a href="/dashboard/hockey">
<img src="/nhl_log.png" alt="NBA" class="logos">
</a>
</div>
<div class="imgboxufc">
<a href="/dashboard/ufc">
<img src="/ufc_logo.png" alt="UFC" class="logos">
</a>
</div>
<div class="bottom">
</div>
</div>

</body>
</html>