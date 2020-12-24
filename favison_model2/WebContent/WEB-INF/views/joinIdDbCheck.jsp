<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
  boolean isIdDub = (boolean)request.getAttribute("isIdDup");
    String id = (String) request.getAttribute("id");   
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>아이디 중복 확인</h2>
	<hr>
	
	아이디:${ id }<br>
	
	<c:choose>
	<c:when test="${ isIdDup eq true }">
	<p>
			아이디 중복, 이미 사용중인 ID 입니다.
	</p>
	</c:when>
	<c:otherwise>
	<p>
			사용가능한 ID 입니다.
			<input type="button" value="ID사용" onclick="result()">
	</p>
	</c:otherwise>
	</c:choose>

<form action="joinIdDbCheck.hj" method="get" name="cfrm">
		<input type="text" name="id" value="${ id }" placeholder="enter your id">
		<input type="submit" value="check">
	</form>
	
	<script>
	function result(){
		opener.document.frm.id.value = cfrm.id.value;
		opener.document.frm.id.select();
		close(); 
	}
	
</script>
</body>
</html>