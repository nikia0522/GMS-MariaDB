/**
 * 
 */

var app=(function(){ //login이후에도 저장되어야할 정보는 앱에 저장
	var init=function(ctx){ //생성자, init, onCreate, setContentView는 항상 만들어야함.
		session.init(ctx);
		member.init();
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		location.href=ctx()+"/home.do";
	};
	var setContentView=function(){
		alert('aaa');
	};
	var ctx=function(){
		return session.getPath('ctx');
	};
	var js=function(){
		return session.getPath('js');
	};
	var img=function(){
		return session.getPath('img');
	};
	var css=function(){
		return session.getPath('css');
	};


	return{
		init : init,
		ctx : ctx,
		js : js,
		img : img,
		css : css //은닉화 가능, close에 포함 시키지 않으면 됨
	};
})();
var session=(function(){ //login시에만 유지될 정보 session에 저장
	var init=function(ctx){
		sessionStorage.setItem('ctx', ctx); 
		sessionStorage.setItem('js', ctx+'/resources/js');
		sessionStorage.setItem('img', ctx+'/resources/img');
		sessionStorage.setItem('css', ctx+'/resources/css');
	}; //semi-colon을 꼭 찍어야함 -> clock pulse (cpu가 실행하고 돌아옴) *********IIFE(즉시실행)*********
	var getPath=function(x){
		return sessionStorage.getItem(x);
	};
	return {
		init : init,  // key : value 객체-제이슨만 있음... 너무 빨라서 이미 존재하는 객체가 되어버렸기때문에 value(method)뒤에 ()를 안붙인다. 
		getPath : getPath	
	}; //function은 return값이 꼭!! 있어야함. 아무것도 안주면 return true가 됨. closure개념인데 기능들이 모여있는 객체의 리턴은 {}로 함
})();

var member=(function(){
	var init=function(){
		$('#loginBtn').on('click',function(){
			alert('로그인 버튼 click');
			if($('#input_id').val()===""){
				alert('ID를 입력해주세요');
				return false;
			}
			if($('#input_pass').val()===""){
				alert('PASS를 입력해주세요');
				return false;
			}
			$('#login_box').attr('action',app.ctx()+"/common.do");
			$('#login)box').attr('method','post');
			return true; //return 생략 가능 - 항상 true로 리턴
		});
	};

	return {
		init : init,
	};
})();


var main=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		$('.list-group a').eq( 0 ).on('click',function(){
			alert('0');
			controller.moveTo('member', 'member_add');
		});
		$('.list-group a').eq( 1 ).on('click',function(){
			alert('1');
			controller.list('member', 'member_list', '1');
		});
		$('.list-group a').eq( 2 ).on('click',function(){
			controller.detailStudent(prompt('조회할 id를 입력하세요:'));
		});
		$('.list-group a').eq( 3 ).on('click',function(){
			controller.moveTo('member', 'member_update');
		});
		$('.list-group a').eq( 4 ).on('click',function(){
			alert('4');
			controller.deleteTarget('학생');
		});
	};
	var setContentView=function(){
		var $u1=$('#main_ul_stu'); // 변수 앞에 $를 붙이면 component 객체가 됨.
		var $u2=$('#main_ul_grade');
		var $u3=$('#main_ul_board');
		$u1.addClass("list-group");
		$u2.addClass("list-group");
		$u3.addClass("list-group");
		$('.list-group').children().addClass("list-group-item");
	};
	
	return{
		init : init
		
		
	};
})();

var memberDetail=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		$('#updateBtn').on('click',function(){
			//id,phone,email,title
			
			sessionStorage.setItem('id', $('#detail_id').text()); 
			sessionStorage.setItem('phone', $('#detail_phone').text());
			alert($('#detail_phone').text());
			sessionStorage.setItem('email', $('#detail_email').text());
			sessionStorage.setItem('title', $('#detail_title').text());			
			controller.moveTo('member','member_update');
			
		});
	};
	var setContentView=function(){		
		alert('멤버디테일 진입');
	};
	return{
		init : init
	};
})();

var memberUpdate=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
	};
	var setContentView=function(){
		var id=sessionStorage.getItem('id');
		var phone=sessionStorage.getItem('phone');
		var email=sessionStorage.getItem('email');
		var password=$('#confirm').val();
		$('#phone').attr('placeholder', phone);
		$('#email').attr('placeholder', email);
		$('#confirmBtn').on('click', function(){
			alert('수정할 아이디:'+id);
			controller.updateStudent(id, $('#email').val());
		});
	};
	return{
		init : init
	};
})();

var controller=(function(){
	var init=function(){

	};
	var moveTo=function(dir, page){
		location.href=app.ctx()+'/'+dir+".do?action=move&page="+page;
	};
	var logout=function(dir,page){
		location.href=app.ctx()+'/'+dir+".do?action=logout&page="+page;
	};
	var deleteTarget=function(target){
		prompt(target+"의 ID?");
	};
	var list=function(dir,page,pageNumber){
		location.href=app.ctx()+'/'+dir+".do?action=list&page="+page+"&pageNumber="+pageNumber;
	};
	var updateStudent=function(id,email){
		alert('수정할 id='+$('#detail_id').text());
		location.href=app.ctx()+'/'+"member.do?action=update&page=member_update&id="+id+"&email="+email;
	};
	var deleteStudent=function(id){
		alert('삭제할 id='+id);
		location.href=app.ctx()+'/'+"member.do?action=delete&page=member_list&id="+id;
	};
	var detailStudent=function(id){
		alert('조회할 id='+id);
		location.href=app.ctx()+'/'+"member.do?action=detail&page=member_detail&id="+id;
	};
	var searchStudent=function(){
		var search=document.getElementById('search').value;
		location.href=app.ctx()+'/'+"member.do?action=search&page=member_list&search="+search;
	};

	return{
		init : init,
		moveTo : moveTo,
		logout : logout,
		deleteTarget : deleteTarget,
		list : list,
		updateStudent : updateStudent,
		deleteStudent : deleteStudent,
		detailStudent : detailStudent,
		searchStudent : searchStudent
	};
})();

var navbar=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		$('#go_main').on('click',function(){
			controller.moveTo('common','main');
		});
		$('.dropdown-menu a').eq( 0 ).on('click',function(){
			alert('0');
			controller.moveTo('member', 'member_add');
		});
		$('.dropdown-menu a').eq( 1 ).on('click',function(){
			alert('1');
			controller.list('member', 'member_list', '1');
		});
		$('.dropdown-menu a').eq( 2 ).on('click',function(){
			controller.detailStudent(prompt('당신은 관리자입니까?'));
		});
		$('.dropdown-menu a').eq( 3 ).on('click',function(){
			alert('3');
			controller.moveTo('member', 'member_update');
		});
		$('.dropdown-menu a').eq( 4 ).on('click',function(){
			alert('4');
			controller.moveTo('member', 'member_delete');
		});
	};
	var setContentView=function(){		
		var $u1=$('#navbar_ul_stu');
		var $u2=$('#navbar_ul_grade');
		var $u3=$('#navbar_ul_board');
		var $logout=$('#logout');
		$u1.addClass("dropdown-menu");
		$u2.addClass("dropdown-menu");
		$u3.addClass("dropdown-menu");
		$logout.on('click', function(){
			controller.logout('common', 'home');
		});
	};
	
	return{
		init : init
	};
})();

var home=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
	};
	var setContentView=function(){		
	};
	return{
		init : init
	};

})();