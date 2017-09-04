<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>**Student Detail**</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div id="wrapper">
	<header>
	<h1 id="title">비밀번호가 틀립니다</h1>
	<a id="go_main" href="<%=request.getContextPath()%>/login.jsp">메인으로 가기</a><br/>
	</header>
	<hr/>
	
	<div id="container">
	<form id="login_box" action="<%=request.getContextPath()%>/common.do?action=move&page=main" method="get">
		<img src="<%=request.getContextPath()%>/resources/img/Venice.jpg" alt="" style="width:50%;height:50%;"/><br />
		<span id="login_id">ID:</span><input type="text" name="id" /> <br />
		<span id="login_pass">PASSWORD:</span><br/> <input type="password" name="pass"/> <br />
		<input type="submit" value="LOGIN"/>
		<input type="reset" value="CANCEL"/>
		<input type="hidden" name="action" value="login">
		<input type="hidden" name="id" value="id">
		<input type="hidden" name="password" value="password">
		<input type="hidden" name="page" value="main">
		
		<br /><br /><br /><br />
		</form>
	</div>
	<jsp:include page="footer.jsp"/>