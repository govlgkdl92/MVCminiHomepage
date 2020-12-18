<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	#center{
	float:center;
	}

	#currentPaging {
	color: red; 
	text-decoration: underline; }
	
	#paging {
	color : black; 
	text-decoration: none; }

	#subjectA:link {color: black; font-family:한컴 백제 M; text-decoration:none;} //손클릭 할 때
	#subjectA:visited {color: black; font-family:한컴 백제 M; text-decoration:none;} //손을 땠을 때 
	#subjectA:hover {color: green; font-family:한컴 백제 M; text-decoration:underline;} //마우스 위에 올라갔을 때
	#subjectA:active {color: black; font-family:한컴 백제 M; text-decoration:none;} //마우스를 누르고 있을 때

</style>

<body>

<h3 style="margin-left:450px;; color:#61615b; font-family:한컴 백제 M;"><b> 이 미 지 목 록 </b></h3>	
<hr>
	<br>
	
<c:if test="${login == true}"> 
<a style="margin-left:150px; color:#61615b; font-family:한컴 백제 M; text-decoration:none;" 
   href="imageboardWriteForm.do"> 상품 등록 </a>		 
<br>
</c:if>

<form name="imageboardListForm"  method="post" action="imageboardDelete.do">
	<table bgcolor="#feffe0"  style="margin-left:150px;"
		   border="1" cellpadding="3" cellspacing="0" frame="hsides" rules="rows" >
		<tr style="background-color:#fdffc7;">
			<th style="font-family:한컴 백제 M;"  width="50" >
				<input id="all" type="checkbox" onclick="checkAll(this);"/>번호
			</th>
			<th style="font-family:한컴 백제 M;"  width="200" >이미지
			</th>
			
			<th style="font-family:한컴 백제 M;" width="150" >상품명
			</th>
			
			<th style="font-family:한컴 백제 M;" width="100" >단가
			</th>
			
			<th style="font-family:한컴 백제 M;" width="100" >개수
			</th>
			
			<th style="font-family:한컴 백제 M;" width="150" >합계
			</th>
		</tr>
<c:if test="${list != null}"> 
	<c:forEach var="imageboardDTO" items="${list}">
		
			<tr>
			<td style="font-family:한컴 백제 M; text-align:center;">
				<input id="check" name="check" type="checkbox" value="${imageboardDTO.seq}"/>${imageboardDTO.seq}	
			</td>
			<td style="font-family:한컴 백제 M; text-align:center;" >
			 	<a href="imageboardView.do?seq=${imageboardDTO.seq}&pg=${pg}">
					<img src="../storage/${imageboardDTO.image1}" width=50; height=50;>
			 	</a>
			</td>
			<td style="color:#61615b;">
				<a href="imageboardView.do?seq=${imageboardDTO.seq}&pg=${pg}">
					${imageboardDTO.imageName} 
				</a>
			</td>
			<td style="font-family:한컴 백제 M; text-align:center;" >
				<fmt:formatNumber pattern="#,###" value="${imageboardDTO.imagePrice}"/>
			</td>		
			<td style="font-family:한컴 백제 M; text-align:center;">${imageboardDTO.imageQty}개
			</td>
			<td style="font-family:한컴 백제 M; text-align:center;" >
				<fmt:formatNumber pattern="#,###,###원" value="${imageboardDTO.imagePrice*imageboardDTO.imageQty}"/>
			</td>
			</tr>
	</c:forEach>

</c:if>							
	</table>

<div class="paging" style="float: left; margin-left:150px;">${imageboardPaging.pagingHTML}</div>

<div style="float:left;">
<input type="button" value="선택 삭제" onclick="javascript:choiceDelete()"
		   style="margin-left:670px; height:20px;font-size:10px; border-radius:10px; cursor:pointer;
				  background-color:#feffe0">
</div>

</form>

<br>
<script>
function imageboardPaging(pg){
	location.href="imageboardList.do?pg="+pg;
}
</script>
<script type="text/javascript" src="../js/imageboard.js?ver=1"></script>	

</body>