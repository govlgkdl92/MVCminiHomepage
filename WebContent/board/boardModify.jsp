<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="text-align: center; margin-right:250px;">
<c:if test="${check == 1}">	 
	<div>
		<br><br><br><br><br>
		작성하신 [${subject}]을 수정하였습니다.
		
		<br><br>
		<input type=button value="글 목록 이동"  
			   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  	  background-color:#feffe0" 
			   onclick='location.href = "boardList.do?pg=${pg}"'>&emsp;
		<input type=button value="글 작성이동"
			   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  	  background-color:#feffe0" 
			   onclick='location.href = "boardWriteForm.do"'>
	</div>
</c:if>
<c:if test="${check == 0}">
	<div>
	<br><br><br>
	<h3> 등록을 실패했습니다. </h3>
	<input type="button" value="다시 글 작성" onclick="history.back()">
	</div>
</c:if>	
</div>