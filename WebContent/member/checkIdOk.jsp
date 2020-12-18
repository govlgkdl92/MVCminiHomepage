<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 없음</title>
</head>
<body>

<div style="color:blue;"> &nbsp;&nbsp;&nbsp; ${param.id}는 사용 가능한 아이디입니다.</div>
<br>
<br>
<div style="text-align:center;">
<input type="button" value="취소" onclick="window.close()" 
				   style="height:30px;font-size:15px;"> &emsp;
<input type="button" value="사용하기" onclick="javascript:sendCheckValue('${param.id}')"
	   style="height:30px;font-size:15px;">
</div>				   
<script type="text/javascript" src="../js/member.js?ver=1"></script>				   
</body>
</html>