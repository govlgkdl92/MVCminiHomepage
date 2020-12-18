<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="modifyForm" method="Post" action="modify.do">	 
 <h1 style="margin-left:150px; color:#61615b; font-family:한컴 백제 M;"><b>내 정보 수정</b></h1>

<table bgcolor="#fffff5" 
	   style="margin-left:150px;" border="3" cellpadding="3" cellspacing="0">
 	<tr>
		<td width="90" height="35" align="center" 
			style="font-family:한컴 백제 M;"><b>이 &nbsp; 름</b></td>
		<td width="360" height="35">
			<input type="text" id="name" name="name" value="${name}"
				   style="width:150px;height:25px;font-size:15px;">
			<div id="nameDiv" style="font-size:8px; color:red; font-weight:bold;"></div>
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center" 
			style="font-family:한컴 백제 M;"><b>아 이 디</b></td>
		<td width="360" height="35">
			<input type="text" id="id" name="id" value="${id}" readonly
				   style="background-color:#fffff5; width:150px;height:25px;font-size:15px;">
			<div id="idDiv" style="font-size:8px; color:red; font-weight:bold;"></div>
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"
			style="font-family:한컴 백제 M;"><b>비 밀 번 호</b></td>
		<td width="360" height="35" align="left">
			<input type="password" name="pwd" size="30" style="width:150px;height:25px;font-size:15px;">
			<div style="text-align: left; font-size:7px; color:#61615b; font-weight:bold;">
			* 비밀번호를 정확하게 입력하셔야 정보가 수정됩니다.</div>
			<input type="hidden" name="pwdcheck" value="${pwd}">
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"
			style="font-family:한컴 백제 M;"><b>재 확 인</b></td>
		<td>
			<input type="password" name="repwd" size="30" style="width:150px;height:25px;font-size:15px;">
		<!--<input type="button" value="비밀번호 변경하기" style="height:30px;font-size:15px;"
				   onclick="javascript:updatePwd()">&emsp;&emsp;  -->	
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"
			style="font-family:한컴 백제 M;"><b>성 &nbsp; 별</b></td>
		<td>
			<input type="radio" name="gender" value="0" >남성&emsp;
			<input type="radio" name="gender" value="1" >여성		
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"
			style="font-family:한컴 백제 M;"><b>이 메 일</b></td>
		<td>
			<input type="text" name="email1" size="13" value="${email1}">
			 @ 
			<input type="email" list="email2" name="email2" placeholder="직접입력" value="${email2}">
			<datalist id="email2">
				<option value="gmail.com">
				<option value="naver.com">
				<option value="hanmail.net">
			</datalist>	   		     	   
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"
			style="font-family:한컴 백제 M;"><b>핸 드 폰</b></td>
		<td>
			<select name="tel1" style="width:80px;height:29px;font-size:15px;" align="center">
					<option value="010"> 010 </option>
					<option value="070"> 070 </option>
					<option value="02"> 02 </option>
					<option value="032"> 032 </option>
					<option value="031"> 031 </option>
			</select> - 
			<input type="text" name="tel2" size="8" 
				   style="width:80px;height:23px;font-size:15px;" 
				   value="${tel2}"> -
			<input type="text" name="tel3" size="8" 
				   style="width:80px;height:23px;font-size:15px;" 
				   value="${tel3}"> 		
		</td>
	</tr>
	<tr>
		<td width="90" height="35" align="center"
			style="font-family:한컴 백제 M;"><b>주  &nbsp; 소</b></td>
		<td>
		    <input type="text" id="zipcode" name="zipcode" size="20" readonly 
		    	   style="width:80px;height:24px;font-size:15px;" value="${zipcode}"> 
		    	<input type="button" value="우편번호 찾기" 
		    		   onclick="javascript:checkPost()"
		    		   style="border-radius:10px; cursor:pointer; background-color:#fffff0"> <br>
			<input type="text" id="address" name="addr1" size="50" readonly placeholder="주소"
				   style="width:350px;height:24px;font-size:15px;" value="${addr1}"> <br>
			<input type="text" id="detailAddress" name="addr2" size="50" placeholder="상세 주소"
				   style="width:350px;height:24px;font-size:15px;" value="${addr2}"> 	
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" width="90" height="35">
			<input type="button" value="정보 수정 하기" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0"
				   onclick="javascript:checkModify()">&emsp;&emsp;

		</td>
	</tr>
	</table>
	<br><br>
	<div style="float: right;">
	<input type="button" value="탈퇴하기"
				   style="height:20px; outline:none; cursor:pointer; font-size:8px; color:red;
				   		  border-radius:10px; cursor:pointer; background-color:#fffff0; "
				   onclick="javascript:idDelete('${id}')"></div>	
	 
</form>

<script type="text/javascript" src="../js/member.js?ver=1"></script>
<script type="text/javascript">
	window.onload=function(){
		document.modifyForm.gender[${gender}].checked = true;
		document.modifyForm.email2.value = "${email2}";
		document.modifyForm.tel1.value = "${tel1}";
	}


	//글 삭제
	function idDelete(id){
		
		if (confirm("정말로 탈퇴하시겠습니까?") == true) {
				location.href = "idDelete.do?id="+id;
	    } else {       
	    }
	}
</script>
