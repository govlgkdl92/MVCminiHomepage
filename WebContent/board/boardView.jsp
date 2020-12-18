<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<form name="boardViewForm">

<input type="hidden" id="seq" name="seq" value="${seq}">
<input type="hidden" id="pg" name="pg" value="${pg}">

 <br>
 <h2 style="text-align:center; color:#61615b; font-family:한컴 백제 M;"><b>글쓰기</b></h2>
 <hr>
 <br>
 <table bgcolor="#fdffc7" border="1" cellpadding="3" cellspacing="0" 
 	    style="margin-left:auto; margin-right:auto; width:70%; height:90%;" frame="hsides" rules="rows">
	<tr>
		<td align="center"><b>제 목</b></td>
		<td colspan="5" width="150">
			<b>${subject}</b>
		</td>
	</tr>
	<tr>
		<td align="center"><b>글번호</b></td>
		<td>${seq}
		</td>
		<td align="center"><b>작성자</b></td>
		<td>${id}
		</td>
		<td align="center"><b>조회수</b></td>
		<td >${hit}
		</td>
	</tr>
	<tr>
		<td align="center"><b>내 용</b></td>
		<td style="white-space: pre-line; word-break:break-all; background-color:#feffe0;"  <%-- pre-wrap 도 가능 --%>
			colspan="5" width="150" height="270" valign="top" >${content}</td>
	</tr>
	<tr>
		<td colspan="6" >
			<c:if test="${memId == id}">
			
			<input type="button" value="글 삭제"
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  	 	  background-color:#feffe0"
				   onclick="mode(2)"> &emsp;
				   
				   
			<input type="button" value="수정하기"
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  	 	  background-color:#feffe0"
				   onclick="mode(1)">&emsp;
	
			</c:if>
			
			<input type="button" value="글 목록" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  	 	  background-color:#feffe0"
				   onclick='location.href = "boardList.do?pg="+${pg}'> &emsp;
				   
			<input type="button" value="답글" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  	 	  background-color:#feffe0"
				   onclick='location.href="boardReplyForm.do?pseq="+${seq}+"&pg="+${pg}'>	   
		</td>
	</tr>
	</table>

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
