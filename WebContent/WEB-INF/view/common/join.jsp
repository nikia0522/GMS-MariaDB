<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   

<jsp:include page="common_head.jsp"/>

	<div id="container">
		<form id="join_form" action="<%=request.getContextPath()%>/member/service_add.jsp">
		<fieldset>
		<legend>ID가 존재하지 않습니다 </legend>
			<span id="join_id">아이디:</span><input name="id" type="text" placeholder="아이디" /> <br />
			<span id="join_pass" >비밀번호:</span><input name="password" type="password" placeholder="패스워드" value="1"/> <br />
			<span id="join_name" >이름:</span><input name="name" type="text" placeholder="이름" value="이길동"/> <br />
			<span id="join_dob" >생년월일:</span><input name="ssn" type="text" /> <br />
			<span id="join_email" >이메일:</span><input name="email" type="text" placeholder="이메일" value="leegd@test.com"/> <br />
			<span id="join_phone" >전화번호:</span><input name="phone" type="text" placeholder="전화번호" /> <br />
			<input id="join_gender_male" type="radio" name="gender" value="male" checked> Male
			<input id="join_gender_female" type="radio" name="gender" value="female"> Female<br>
			<br/>
				<select name="major_id">
  					<option value="computer" selected>컴공</option>
  					<option value="economics"> 경제학</option>
  					<option value="tourism">관광학</option>
  					<option value="art">미술</option>
				</select><br/>
				<h3>수강 과목</h3>
				<input type="checkbox" name="subject" value="java" checked>자바<br />
				<input type="checkbox" name="subject" value="c" checked>C언어<br />
				<input type="checkbox" name="subject" value="html" checked>HTML<br />
				<input type="checkbox" name="subject" value="css">CSS<br />
				<input type="checkbox" name="subject" value="javascript">자스<br />
				<input type="checkbox" name="subject" value="sql">SQL<br />
				<input type="checkbox" name="subject" value="python">파이썬<br />			
				<input id="submit_btn" onsubmit="memberAdd()" type="submit" value="Submit">
				<input id="reset_btn" type="reset" value="Reset">
			<hr/>
		</fieldset>
		</form>
		
		<script>
			function addAlert(){
				var join_id=document.getElementById("join_id").value;
				var join_pass=document.getElementById("join_pass").value;
				if(join_id===""){
					alert('ID는 필수항목입니다.');
					return false;
				}
				if(join_pass===""){
					alert('PASSWORD를 입력해주세요.');
					return false;
				}
				if(join_name===""){
					alert('이름은 필수항목입니다.');
					return false;
				}
				
				var form=document.getElementById('join_form');
				form.action="${ctx}/common.do";
				form.method="get"
				return true;
				
			}
		</script>
	<jsp:include page="footer.jsp"/>
