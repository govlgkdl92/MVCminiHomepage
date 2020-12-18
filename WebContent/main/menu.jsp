<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<br>
<%-- 세션(memID)이 없다면 --%>
<c:if test="${sessionScope.memId == null}">
<a href="../member/joinForm.do" 
 	   style="text-decoration: none; color:#417556;">&emsp;회원가입</a><br>
<a href="../member/loginForm.do" 
   style="text-decoration: none; color:#417556;">&emsp;로그인</a><br>
</c:if>
<%-- 세션(memID)이 있다면 --%>
<c:if test="${memId != null}">   
&emsp;${memName} 님
<br><br>
<a href="../member/logout.do" 
   style="text-decoration: none; color:#417556;">&emsp;로그아웃</a><br>
<a href="../member/modifyForm.do"  
   style="text-decoration: none; color:#417556;">&emsp;회원정보수정</a><br>  
<br>   
<a href="../board/boardWriteForm.do"
   style="text-decoration: none; color:#1b422b;">&emsp;글쓰기</a><br> 
<a href="../imageboard/imageboardWriteForm.do"
   style="text-decoration: none; color:#1b422b;">&emsp;상품등록</a><br> 
<br>
</c:if>
<c:if test="${sessionScope.memId == null}">
<br>  
</c:if>   
<a href="../board/boardList.do?pg=1"
   style="text-decoration: none; color:#1b422b;">&emsp;글 목록</a><br>
<a href="../imageboard/imageboardList.do?pg=1"
   style="text-decoration: none; color:#1b422b;">&emsp;상품 목록</a><br>
