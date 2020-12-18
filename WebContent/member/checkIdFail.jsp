<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 있음</title>
</head>
<body>
<form action="checkId.do">  <!--  ${requestScope.id}  ${id} 도 사용 가능  -->
<div style="color:red;"> &nbsp;&nbsp;&nbsp;  ${param.id}는 이미 있는 아이디입니다. </div>
<br>
<input type ="text" id="id" name="id" placeholder="다른 아이디 입력" 
				   size="20" style="width:180px;height:25px;font-size:15px;" >
<input type ="button" value="중복체크" onclick="javascript:checkIdAgain()">
<div id="idDiv" style="font-size:8px; color:red; font-weight:bold;"></div>
<br>
<div style="text-align:center;">
<input type="button" value="취소" onclick="window.close()" 
	   style="height:30px;font-size:15px;"> 
</div>	   
<script type="text/javascript" src="../js/member.js?ver=1"></script>
</form>
</body>
</html>