<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form name="imageboardViewForm" method="post" enctype="multipart/form-data" action="imageboardWrite.do">

<input type="hidden" id="seq" name="seq" value="${seq}">
<input type="hidden" id="pg" name="pg" value="${pg}">

 <h2 style="margin-left:230px; color:#61615b; font-family:한컴 백제 M;"><b>이미지 상세보기</b></h2>
 <hr>
 <br>
<div style="margin-left:70px; float:left">
 <table bgcolor="#feffe0" border="3" cellpadding="3" cellspacing="0">
	<tr>
		<td rowspan="4" width="200" height="200" align="center">
			<img src="../storage/${imageboardDTO.image1}" width=180; height=180;>
		</td>
		<td width="200">
			상품명 : ${imageboardDTO.imageName}
		</td>
	</tr>
	<tr>
		<td width="200">
			단가 : <fmt:formatNumber pattern="#,###" value="${imageboardDTO.imagePrice}"/>
		</td>
	</tr>
	<tr>
		<td width="200">
			개수 : ${imageboardDTO.imageQty}개
		</td>
	</tr>
	<tr>
		<td width="200">
			합계 : <fmt:formatNumber pattern="#,###,###원" value="${imageboardDTO.imagePrice*imageboardDTO.imageQty}"/>
		</td>
	</tr>
	<tr>
		<td width="200" height="200" colspan="2"
		    style="white-space: pre-line; word-break:break-all; background-color:#feffe0;"  <%-- pre-wrap 도 가능 --%>
			colspan="5" width="150" height="270" valign="top">${imageboardDTO.imageContent}</td>
	</tr>
	<tr bgcolor="#fffff0">
		<td colspan="2" align="center" height="35">
			<input type="button" value="상품 목록" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0"
				   onclick='location.href = "imageboardList.do?pg=1"'>
		</td>
	</tr>
	</table>
</div>	
<div style="float:left; margin-top:230px;"> 
 <img style="text-align:right;" src="../image/pikasanta2.png" width="229" height="232">	
</div>		 

</form>  


<script type="text/javascript">
//mode
function mode(num){
	if(num==1){//수정
		document.boardViewForm.method="post";
		document.boardViewForm.action="boardModifyForm.do"
		document.boardViewForm.submit();
		
	}else if(num==2){//삭제
		if (confirm("정말로 글을 삭제하시겠습니까?") == true) {
				
			document.boardViewForm.method="post";
			document.boardViewForm.action="boardDelete.do"
			document.boardViewForm.submit();
			
	    } else {       
	    }
		
			
	}
}
</script>
