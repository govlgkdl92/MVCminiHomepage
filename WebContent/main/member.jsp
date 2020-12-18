<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 상단 회원 -->
<c:if test="${memId == null}">   
<a href="../member/joinForm.do" 
   style="text-decoration: none; color:#61615b;">회원가입</a>&emsp;
<a href="../member/loginForm.do" 
   style="text-decoration: none; color:#61615b;">로그인</a>&emsp;&emsp;&emsp;
</c:if>
<c:if test="${memId != null}">      
${memId}님 환영합니다.&emsp;
<a href="../member/logout.do" 
   style="text-decoration: none; color:#61615b;">로그아웃</a>&emsp;
<a href="../member/modifyForm.do" 
   style="text-decoration: none; color:#61615b;">회원정보수정</a>&emsp;&emsp;&emsp;
</c:if>