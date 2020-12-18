<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mini Pika-Home</title>
<style type="text/css">

@font-face {
	font-family: 'Typo_DecoSolidSlash';
	src: url('../font/Typo_DecoSolidSlash.ttf');
}

#join {
	text-align:right; 
	background-color : #fffff1;
	font-family:한컴 백제 M;
}

body {
	margin: 0; 
	padding: 0; 
	height : 100%;
}

#header {
	width: 100%;
	height: 10%;
	text-align: center;
	border: 1px solid #feffe0;
	background-color : #feffe0;
	font-family:'Typo_DecoSolidSlash'
}

#container {
	width: 100%;
	height: 600px;
}

#nav {
	width: 15%;
	height: 100%;
	float : left;
	
	background-color : #fffff1;
	font-family: 'Typo_DecoSolidSlash';
	font-size: 23pt;
	text-decoration: none;
	font-weight: plain;
	color: black;
}

#section {
	width: 85%;
	height: 100%;
	float : left;
	background-color : #fffff8;
}

#footer {
	width: 100%;
	height: 10%;
	float : left;
	text-align : left;
}

</style>
</head>
<body>
<div id="header">	
		<div id="join">
			<jsp:include page="member.jsp"/>	  
		</div>
	<h1 style="font-size: 50pt; cursor:pointer;" 
		onclick="location.href='../main/index.do'"><img src="../image/pika.png" width="50" height="50"> MVC 기반의 미니 프로젝트 HOME</h1>  
</div>

<div id="container">
	<div id="nav">
		<jsp:include page="menu.jsp"/>	
	</div>	
	<div id="section">
	    <jsp:include page="${display}"/>
	</div>
</div>

<div id="footer">
	<p> Y-홈 : footer </p>
</div>


</body>
</html>