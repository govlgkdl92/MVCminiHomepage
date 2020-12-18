<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form name="boardModifyForm"  method="post" action="boardModify.do">

<input type="hidden" name="seq" value="${seq}">
<input type="hidden" name="pg" value="${pg}">

  <h2 style="margin-left:230px; color:#61615b; font-family:한컴 백제 M;"><b>글쓰기</b></h2>
 <hr>
 <br>
<div style="float:left; margin-top:120px;"> 
 <img style="text-align:right; cursor:pointer;" src="../image/pikasanta.png" width="229" height="232">	
</div>	
<div style="float:left">
 <table bgcolor="#feffe0" border="3" cellpadding="3" cellspacing="0">
	<tr>
		<td width="90" height="20" align="center"><b>제 목</b></td>
		<td>
			<input type="text" id="subject" name="subject" size="45" value="${boardDTO.subject}">
			<div id="subjectDiv" style="font-size:8px; color:red; font-weight:bold;"></div>		
		</td>
	</tr>
	<tr>
		<td width="90" height="20" align="center"><b>내 용</b></td>
		<td>
		    <textarea id="content" name="content" cols="46" rows="15">${boardDTO.content}</textarea>	
		    <div id="contentDiv" style="font-size:8px; color:red; font-weight:bold;"></div>   
		</td>
	</tr>
	<tr bgcolor="#fffff0">
		<td colspan="2" align="center" width="90" height="35">
			<input type="button" value="내용 수정" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0"
				   onclick="javascript:checkBoardModify()">&emsp;
			<input type="button" value="글 목록" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0"
				   onclick="javascript:BoardList(${pg})">
		</td>
	</tr>
	</table>
</div>	
</form>  
   
<script type="text/javascript">
//글수정
function checkBoardModify(){
	var subjectDiv = document.getElementById("subjectDiv");
		var contentDiv = document.getElementById("contentDiv");
		
		subjectDiv.innerText = "";
		contentDiv.innerText = "";

	  if(document.getElementById("subject").value==""){  
		  subjectDiv.innerText = "제목은 필수 입력사항입니다.";

	  }else if(document.getElementById("content").value==""){
		  contentDiv.innerText = "내용을 입력하지 않았습니다.";

	  }else {
		  document.boardModifyForm.submit();
	  }
	
}//글수정 유효성 검사 end

//글 삭제
function BoardList(pg){
	if (confirm("글목록으로 이동하시겠습니까? 지금까지 수정하신 내용은 저장되지 않습니다.") == true) {
			
		location.href = "boardList.do?pg="+pg;
    } else {       
    }

}
</script>   
<script type="text/javascript" src="../js/member.js?ver=1"></script>
