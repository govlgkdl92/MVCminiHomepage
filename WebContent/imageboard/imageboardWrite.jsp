<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="text-align: center; margin-right:250px;">
<c:if test="${check == 1}">	 
		<br><br><br><br><br><br>
		정상적으로 [${imageName}] 상품을 등록하였습니다.
		
		<br><br>
		<input type=button value="상품 목록 이동"  
			   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  	  background-color:#feffe0" 
			   onclick='location.href = "imageboardList.do?pg=1"'>&emsp;
		<input type=button value="상품 등록 이동" 
			   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  	  background-color:#feffe0" 
			   onclick='location.href = "imageboardWriteForm.do"'>
</c:if>
<c:if test="${check == 0}">
	<br><br><br>
	<h3> 등록을 실패했습니다. </h3>
	<input type="button" value="다시 글 작성" onclick="history.back()"
		   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  background-color:#feffe0">
</c:if>	
</div>