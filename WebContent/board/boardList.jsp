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

<h3 style="margin-left:450px;; color:#61615b; font-family:한컴 백제 M;"><b> 글 목 록 </b></h3>	
<hr>
	<br>
	
<c:if test="${login == true}"> 
<a style="margin-left:150px; color:#61615b; font-family:한컴 백제 M; text-decoration:none;" 
   href="boardWriteForm.do"> 글쓰기 </a>		 
<br>
</c:if>
	<table bgcolor="#feffe0"  style="margin-left:150px;"
		   border="1" cellpadding="3" cellspacing="0" frame="hsides" rules="rows" >
		<tr style="background-color:#fdffc7;">
			<th style="font-family:한컴 백제 M;"  width="50" >No
			</th>
			
			<th style="font-family:한컴 백제 M;" width="350" >제목
			</th>
			
			<th style="font-family:한컴 백제 M;" width="100" >작성자
			</th>
			
			<th style="font-family:한컴 백제 M;" width="100" >조회수
			</th>
			
			<th style="font-family:한컴 백제 M;" width="100" >작성일
			</th>
		</tr>
<c:if test="${list != null}"> 
	<c:forEach var="boardDTO" items="${list}">
		
			<tr>
			<td style="font-family:한컴 백제 M; text-align:center;">${boardDTO.seq} 
				<input type="hidden" id="seq" name="seq" value="${boardDTO.seq}"> 
			
			</td>
			<td style="color:#61615b;">
				<c:forEach var="i" begin="1" end="${boardDTO.lev}" step="1">
					&emsp;
				</c:forEach>
				
				<c:if test="${boardDTO.pseq != 0}">
					<img src="../image/reply.gif">
				</c:if>
				
				<a href="#" id="subjectA" onclick="isLogin(${login}, ${pg} , ${boardDTO.seq})"> ${boardDTO.subject} </a>
			</td>
	
			<td style="font-family:한컴 백제 M; text-align:center;" >${boardDTO.id}
			</td>
			
			<td style="font-family:한컴 백제 M; text-align:center;">${boardDTO.hit}
				<input type="hidden" id="hit" name="hit" value="${boardDTO.hit}"> 
			</td>
			
			<td style="font-family:한컴 백제 M; text-align:center;">
				<fmt:formatDate value="${boardDTO.logtime}" type="time" pattern="YYYY.MM.dd"/>
			</td>
			</tr>
	</c:forEach>

</c:if>							
	</table>

<div class="paging" style="margin-left:150px;">${boardPaging.pagingHTML }</div>


<br>

<form name="boardSearchListForm"  method="post" action="boardList.do" onsubmit="boardSearch()">
<a style="margin-left:250px;">

<input type="hidden" id="pg" name="pg" value="${pg}">

<select name="searchValue" style="font-family:한컴 백제 M; width:80px;height:29px;">
					<option value="subject" <c:out value="${ searchValue == 'subject' ? 'selected' : ''}"/> > 제 목 </option>
					<option value="id"  <c:out value="${ searchValue == 'id' ? 'selected' : ''}"/> > 아이디 </option>
</select>
<input type="search" id="search" name="search" style="font-family:한컴 백제 M; width:150px;height:23px;">
<input type="submit" value="검색" 
	   style="height:35px; border-radius:10px; cursor:pointer; font-family:한컴 백제 M;
	  		  background-color:#feffe0;">
<img src="../image/sanList.png">
</a>
	
</form>


<script type="text/javascript">
function isLogin(id, pg, seq) {
	if(id == ""){
		alert("먼저 로그인하세요");
		location.href="../member/loginForm.do"
	}
	else {
		location.href="../board/boardView.do?seq="+seq+"&pg="+pg;
	}	
}

// page 받아서 submit
// 검색어
function boardPaging(pg){
	//let keyword = document.boardListSearchForm.keyword.value;
	//let keyword = document.getElementById("keyword").value;
	
	if("${search}" == ""){
		location.href="boardList.do?pg="+pg;
	}else{
		location.href="boardSearch.do?pg="+pg+"&searchValue=${requestScope.searchValue}&search=${search}";
	}
}
</script>	

</body>