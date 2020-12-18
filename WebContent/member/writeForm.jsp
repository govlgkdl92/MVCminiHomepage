<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="writeForm"  method="post" action="join.do">

<br><br>
 <table bgcolor="#fffff5" style="margin-left:150px;" border="3" cellpadding="3" cellspacing="0">
 	<tr>
		<td width="90" height="35" align="center"><b>이 &nbsp; 름</b></td>
		<td width="360" height="35">
			<input type="text" id="name" name="name" 
				   style="width:150px;height:25px;font-size:15px;">
			<div id="nameDiv" style="font-size:8px; color:red; font-weight:bold;"></div>
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"><b>아 이 디</b></td>
		<td width="360" height="35">
			<input type="text" id="id" name="id" style="width:200px;height:25px;font-size:15px;"
				   size="25" onkeydown="inputIdChk()">
			<input type="button" value="중복체크" onclick="checkId()"
				   style="border-radius:10px; cursor:pointer; background-color:#fffff0">	
			<input type="hidden" name="idDuplication" value="idUncheck"> 
			<div id="idDiv" style="font-size:8px; color:red; font-weight:bold;"></div>
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"><b>비 밀 번 호</b></td>
		<td width="360" height="35">
			<input type="password" name="pwd" size="30" style="width:250px;height:25px;font-size:15px;">
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"><b>재 확 인</b></td>
		<td>
			<input type="password" name="repwd" size="30" style="width:250px;height:25px;font-size:15px;">
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"><b>성 &nbsp; 별</b></td>
		<td>
			<input type="radio" name="gender" value="0">남성&emsp;
			<input type="radio" name="gender" value="1" checked>여성
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"><b>이 메 일</b></td>
		<td>
			<input type="text" name="email1" size="13" >
			 @ 
			<input type="email" list="email2" name="email2" >
			<datalist id="email2">
				<option value="gmail.com">
				<option value="naver.com">
				<option value="hanmail.net">
			</datalist>	   		     	   
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"><b>핸 드 폰</b></td>
		<td>
			<select name="tel1" style="width:80px;height:29px;font-size:15px;" align="center">
					<option value="010"> 010 </option>
					<option value="070"> 070 </option>
					<option value="02"> 02 </option>
					<option value="032"> 032 </option>
					<option value="031"> 031 </option>
			</select> - 
			<input type="text" name="tel2" size="8" style="width:80px;height:23px;font-size:15px;"> -
			<input type="text" name="tel3" size="8" style="width:80px;height:23px;font-size:15px;"> 		
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"><b>주  &nbsp; 소</b></td>
		<td>
		    <input type="text" id="zipcode" name="zipcode" size="20" readonly 
		    	   style="width:80px;height:24px;font-size:15px;"> 
		    	<input type="button" value="우편번호 찾기" 
		    		   onclick="javascript:checkPost()"
		    		   style="border-radius:10px; cursor:pointer; background-color:#fffff0"> <br>
			<input type="text" id="address" name="addr1" size="50" readonly placeholder="주소"
				   style="width:350px;height:24px;font-size:15px;"> <br>
			<input type="text" id="detailAddress" name="addr2" size="50"
				   style="width:350px;height:24px;font-size:15px;"> 	
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" width="90" height="35">
			<input type="button" value="회원가입" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0;"
				   		  onclick="javascript:checkWrite()">&emsp;&emsp;
			<input type="reset" value="다시작성"
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0;">
		</td>
	</tr>
	</table>

</form>  
<script type="text/javascript" src="../js/member.js?ver=1"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>