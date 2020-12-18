<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC - 우편 번호</title>
<script type="text/javascript">


//	#addressA{
//		link {color: black; text-decoration:none;}
//		visited {color: black; text-decoration:none;}
//		hover {color: blue; text-decoration:underline;}
//		active {color: black; text-decoration:none;}
	

	
</script>
</head>
<body>
<form method="post" name="checkPost" action="checkPost.do">


<table border="1" width="100%" cellpadding="2" cellspacing="0">
	<tr>
		<td width="70" height="25" align="center"
			style="text-align:center; font-family:한컴 백제 M;">
			<b>시 도</b>
		</td>
		<td>
			<select id="sido" name="sido" style="width:100px;height:20px;font-size:15px;" align="center"
					style="text-align:center; font-family:한컴 백제 M;">
				<option> 시도선택 </option>
					<option value="서울"> 서울 </option>
					<option value="인천"> 인천 </option>
					<option value="대전"> 대전 </option>
					<option value="대구"> 대구 </option>
					<option value="울산"> 울산 </option>
					<option value="세종"> 세종 </option>
					<option value="광주"> 광주 </option>
					<option value="경기"> 경기 </option>
					<option value="강원"> 강원 </option>
					<option value="전남"> 전남 </option>
					<option value="전북"> 전북 </option>
					<option value="경남"> 경남 </option>
					<option value="경북"> 경북 </option>
					<option value="충남"> 충남 </option>
					<option value="충북"> 충북 </option>
					<option value="부산"> 부산 </option>
					<option value="제주"> 제주 </option>
			</select>	
		</td>
		<td width="70" height="25" align="center"
			style="text-align:center; font-family:한컴 백제 M;">
			<b>시.군.구</b>
		</td>
		<td width="170" height="25" align="center"
			style="text-align:center; font-family:한컴 백제 M;">
			<input type="text" id="sigungu" name="sigungu" size="8" style="width:165px;height:20px;font-size:15px;"
				   style="text-align:center; font-family:한컴 백제 M;">
		</td>
	</tr>
	<tr>
		<td width="70" height="25" align="center"
			style="text-align:center; font-family:한컴 백제 M;">
			<b>도 로 명</b>
		</td>
		<td colspan="3">
		    <input type="text" id="roadname" name="roadname" size="20" 
		    	   style="width:230px;height:20px;font-size:15px;"
		    	   style="text-align:center; font-family:한컴 백제 M;"> &nbsp;&nbsp;
		    <input style="text-align:center; font-family:한컴 백제 M;"
		    	   type="button" value="검색" onclick="javascript:serachPost()"
		    		> <br>
		</td>
	</tr>
	<tr>
		<td width="90" height="25" align="center"
			style="text-align:center; font-family:한컴 백제 M;">
			<b>우편번호</b>
		</td>			
		<td colspan="3" width="90" align="center" height="25"
			style="text-align:center; font-family:한컴 백제 M;">
			
			주소
			
		</td>
	</tr>
  	  <c:if test="${requestScope.list != null}">	
  	  	<c:forEach var="zipcodeDTO" items="${list}">
  	  	<tr>
		<c:set var="address">
			${zipcodeDTO.sido
			} ${zipcodeDTO.sigungu
			} ${zipcodeDTO.yubmyundong
			} ${zipcodeDTO.ri
			} ${zipcodeDTO.roadname
			} ${zipcodeDTO.buildingname}	
		</c:set>
		
			<td width="70" height="25" align="center">
				<b>${zipcodeDTO.getZipcode()}</b>
			</td>
			<td colspan="3" align="center" height="25">			
				<a href="#" id=addressA  onclick="checkPostClose('${zipcodeDTO.zipcode}', '${address}')" >${address}</a>
			</td>
		</tr>
		</c:forEach>
 	 </c:if>
</table>
	
	<script type="text/javascript" src="../js/member.js?ver=1"></script>
</form>
</body>
</html>