<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


	<script>
	alert('이메일 수정완료');
	location.href="<%=request.getContextPath()%>/login.jsp";
	</script>

	<script>
	alert('이메일 수정실패');
	location.href="<%=request.getContextPath()%>/login.jsp";
	</script>

