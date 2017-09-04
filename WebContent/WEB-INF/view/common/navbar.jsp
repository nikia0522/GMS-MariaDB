<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">LYL</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="go_main" ><span class="glyphicon glyphicon-home"></span> &nbsp;Home</a></li>
      <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">학생관리 <span class="caret"></span></a>
      <ul id="navbar_ul_stu" >
      	<li><a >학생추가</a></li>
        <li><a >학생목록</a></li>
        <li><a >학생조회</a></li>
        <li><a >학생수정</a></li>
        <li ></li>
        <li><a >학생삭제</a></li>
      </ul>
      </li>
      <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">성적관리 <span class="caret"></span></a>
      <ul id="navbar_ul_grade" >
      	<li><a >성적추가</a></li>
        <li><a >성적목록</a></li>
        <li><a >성적관리</a></li>
        <li><a >성적수정</a></li>
        <li ></li>
        <li><a >성적삭제</a></li>
      </ul>
      </li>
      <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">게시판관리 <span class="caret"></span></a>
      <ul id="navbar_ul_board" >
      	<li><a >게시글추가</a></li>
        <li><a >게시판목록</a></li>
        <li><a >게시판조회</a></li>
        <li><a >게시판수정</a></li>
        <li ></li>
        <li><a >게시판삭제</a></li>
      </ul>
      </li>
    </ul>
    <span class="float-right" >${sessionScope.user.name} &nbsp; <a id="logout" > 로그아웃</a></span>
  </div>
</nav>

<script>
	navbar.init();
	main.init();
	/* window.onload=navbarLoad();  *///hoisting 문법

/*  	function mainLoad(){ //native JS
		var u1=document.getElementById("main_ul_stu");
		var u2=document.getElementById("main_ul_grade");
		var u3=document.getElementById("main_ul_board");
		u1.setAttribute("class", "list-group");
		u2.setAttribute("class", "list-group");
		u3.setAttribute("class", "list-group");
		var u1c=u1.children;
		var u2c=u2.children;
		var u3c=u3.children;
		var i;
		for(i=0;i<u1c.length;i++){
			u1c[i].setAttribute("class", "list-group-item");
		}
		for(i=0;i<u2c.length;i++){
			u2c[i].setAttribute("class", "list-group-item");
		}
		for(i=0;i<u3c.length;i++){
			u3c[i].setAttribute("class", "list-group-item");
		}
		u1c[0].setAttribute("onclick", "moveTo('member', 'member_add')");
		u1c[1].setAttribute("onclick", "list('member', 'member_list', '1')");
		u1c[2].setAttribute("onclick", "moveTo('member', 'member_search')");
		u1c[3].setAttribute("onclick", "moveTo('member', 'member_update')");
		u1c[4].setAttribute("onclick", "deleteTarget('학생')");

		u2c[0].setAttribute("onclick", "moveTo('grade', 'grade_add')");
		u2c[1].setAttribute("onclick", "list('grade', 'grade_list', '1')");
		u2c[2].setAttribute("onclick", "moveTo('grade', 'grade_detail')");
		u2c[3].setAttribute("onclick", "moveTo('grade', 'grade_update')");
		u2c[4].setAttribute("onclick", "deleteTarget('성적')")

		u3c[0].setAttribute("onclick", "moveTo('board', 'board_add')");
		u3c[1].setAttribute("onclick", "list('board', 'board_list', '1')");
		u3c[2].setAttribute("onclick", "moveTo('board', 'board_detail')");
		u3c[3].setAttribute("onclick", "moveTo('board', 'board_update')");
		u3c[4].setAttribute("onclick", "deleteTarget('게시글')");
	}  */
/* 	function navbarLoad(){
		var u1=document.getElementById("navbar_ul_stu");
		var u2=document.getElementById("navbar_ul_grade");
		var u3=document.getElementById("navbar_ul_board");

		var u1c=u1.children;
		var u2c=u2.children;
		var u3c=u3.children;
		
		u1.setAttribute("class", "dropdown-menu");
		u2.setAttribute("class", "dropdown-menu");
		u3.setAttribute("class", "dropdown-menu");
		
		u1c[0].setAttribute("onclick", "moveTo('member','member_add')");
		u1c[1].setAttribute("onclick", "list('member','member_list','1')");
		u1c[2].setAttribute("onclick", "moveTo('member','member_search')");
		u1c[3].setAttribute("role","separator");
		u1c[4].setAttribute("class", "divider");
		u1c[5].setAttribute("onclick", "deleteTarget('학생')");
		
		u2c[0].setAttribute("onclick", "moveTo('grade', 'grade_add')");
		u2c[1].setAttribute("onclick", "list('grade', 'grade_list','1')");
		u2c[2].setAttribute("onclick", "moveTo('grade', 'grade_detail')");
		u2c[3].setAttribute("role","separator");
		u2c[4].setAttribute("class", "divider");
		u2c[5].setAttribute("onclick", "deleteTarget('성적')");
		
		u3c[0].setAttribute("onclick", "moveTo('board', 'board_add')");
		u3c[1].setAttribute("onclick", "list('board', 'board_list','1')");
		u3c[2].setAttribute("onclick", "moveTo('board', 'board_detail')");
		u3c[3].setAttribute("role","separator");
		u3c[4].setAttribute("class", "divider");
		u3c[5].setAttribute("onclick", "deleteTarget('게시글')");	
			
		var main=document.getElementById("go_main");
		main.setAttribute("onclick", "moveTo('common', 'main')");
		
		var logout=document.getElementById("logout");
		logout.setAttribute("onclick", "moveTo('common', 'home')");
		logout.setAttribute("style", "color:white");
	}
 */

    function test(){
  	  document.querySelector('#updateBtn').onclick=studentInfo;
    }
    
    function studentInfo(){
  	  var id='id', 
  	  id_val='${requestScope.student.id}',  	  
  	  name='name', 
  	  name_val='${requestScope.student.name}',
  	  email='email',
  	  email_val='${requestScope.student.email}';
  	  sessionStorage.setItem(id,id_val);
  	  sessionStorage.setItem(name,name_val);
  	  sessionStorage.setItem(email,email_val);
  	  
    }

</script>