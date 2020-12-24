<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--세션에 저장된 특정값 삭제 --%>
<%//session.removeAttribute("id") %>
<%--세션값 초기화(세션에 저장된 모든 정보 삭제--%>
<% session.invalidate();%>

<%--로그인 상태유지용 쿠키가 존재하면 삭제처리 --%>
<%
Cookie[] cookies = request.getCookies();

if(cookies != null){
	for (Cookie cookie : cookies){
		if(cookie.getName().equals("id")){
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
	}// for
}
%>

<%--"로그아웃됨" index.jsp로 이동--%>
<script>
	alert('signed out');
	location.href='index.jsp';
</script>