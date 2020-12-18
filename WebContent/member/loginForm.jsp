<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pika-로 그 인</title>
<style>

	body{ 
		background-color:#fffff9;
	}

</style>

</head>
<body>
	 
<form name="loginForm"  method="post" action="login.do">
 <div style = "padding: 70px 1px 1px 70px;">  
<div>
	<img style="text-align:center; cursor:pointer;" width="50"; height="50"; src="../image/pika.png"
		 onclick="location.href='../main/index.do'">
</div>
 <br>
 <h1 style="text-align:center; color:#61615b; font-family:한컴 백제 M;" ><b>로 그 인</b></h1>
 <hr>
 <br>
 <table bgcolor="#feffe0" style="margin-left:auto; margin-right:auto;"  border="3" cellpadding="3" cellspacing="0">
	<tr>
		<td width="90" height="35" align="center" 
			style="text-align:center; color:#61615b; font-family:한컴 백제 M;"><b>아 이 디</b></td>
		<td width="270" height="35">
			<input type="text" id="id" name="id" 
				   style="width:250px; height:25px;font-size:15px; color:#61615b; font-family:한컴 백제 M;"
				   placeholder="아이디 입력" size="25" autofocus>
			<div id="idDiv" style="font-size:8px; color:red; font-weight:bold;"></div>
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"
			style="text-align:center; color:#61615b; font-family:한컴 백제 M;"><b>비 밀 번 호</b></td>
		<td width="270" height="35">
			<input type="password" id="pwd" name="pwd" size="30" 
				   style="width:250px;height:25px;font-size:15px; color:##61615b; font-family:한컴 백제 M;"
				   onkeypress="if(event.keyCode == 13){ login(); return; }">
			<div id="pwdDiv" style="font-size:8px; color:red; font-weight:bold;"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" width="90" height="35">
			<input type="reset" value="취 소"
				   style="height:30px;font-size:15px;">&emsp;&emsp;
			<input type="button" value="로그인" style="height:30px;font-size:15px;"
				   onclick="javascript:login()">
		</td>
	</tr>
	</table>

 </div>
   </form>  
<script type="text/javascript" src="../js/member.js?ver=1"></script>

</body>
</html>
