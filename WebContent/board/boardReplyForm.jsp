<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="boardReplyForm"  method="post" action="boardReply.do">

<input type="hidden" name="pseq" value="${pseq}">
<input type="hidden" name="pg" value="${pg}">

 <h2 style="margin-left:230px; color:#61615b; font-family:한컴 백제 M;"><b>답글쓰기</b></h2>
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
			<input type="text" id="subject" name="subject" size="45" placeholder="제목 입력">
			<div id="subjectDiv" style="font-size:8px; color:red; font-weight:bold;"></div>		
		</td>
	</tr>
	<tr>
		<td width="90" height="20" align="center"><b>내 용</b></td>
		<td>
		    <textarea id="content" name="content" cols="46" rows="15" placeholder="내용을 입력"
		    		  ></textarea>	
		    <div id="contentDiv" style="font-size:8px; color:red; font-weight:bold;"></div>   
		</td>
	</tr>
	<tr bgcolor="#fffff0">
		<td colspan="2" align="center" width="90" height="35">
			<input type="button" value="답글 작성" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0"
				   onclick="checkBoardReply()">&emsp;
			<input type="reset" value="다시 작성"
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0">&emsp;
			<input type="button" value="글 목록" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0"
				   onclick='location.href = "boardList.do?pg=${pg}"'>
		</td>
	</tr>
	</table>
</div>	
	 
   </form>  
<script type="text/javascript">
//글 등록시 유효성 검사
function checkBoardReply(){
	var subjectDiv = document.getElementById("subjectDiv");
		var contentDiv = document.getElementById("contentDiv");
		
		subjectDiv.innerText = "";
		contentDiv.innerText = "";

	  if(document.getElementById("subject").value==""){  
		  subjectDiv.innerText = "제목은 필수 입력사항입니다.";
	  }else if(document.getElementById("content").value==""){
		  contentDiv.innerText = "내용을 입력하지 않았습니다.";	  
	  }else {
		  document.boardReplyForm.submit();
	  }
	
}//글수정 시 유효성 검사 end
</script>   