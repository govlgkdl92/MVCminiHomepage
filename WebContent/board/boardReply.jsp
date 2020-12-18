<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
window.onload=function(){
	alert("답글이 저장되었습니다.");
	location.href="boardList.do?pg=${requestScope.pg}"; //답글이 원글이 있는 페이지, 원글 밑에..
}
</script>
