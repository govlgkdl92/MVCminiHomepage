<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC-아이디 삭제</title>
</head>
<body>


<script type="text/javascript">
window.onload=function(){
	<c:if test="${check == 1}">
		alert("정상적으로 탈퇴 되었습니다.");
		location.href="../main/index.do";
	</c:if>
}
</script>

</body>
</html>