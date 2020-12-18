//로그인 함수
function login(){
		var idDiv = document.getElementById("idDiv");
		var pwdDiv = document.getElementById("pwdDiv");
		
		idDiv.innerText = "";
		pwdDiv.innerText = "";

	  if(document.getElementById("id").value==""){  
		  idDiv.innerText = "아이디를 입력하세요.";
		  //nameDiv.style.border = "1px red solid";

	  }else if(document.getElementById("pwd").value==""){
		  pwdDiv.innerText = "비밀번호를 입력하세요.";
		  //idDiv.style.border = "1px red solid";

	  }else {
		  document.loginForm.submit();
	  }
}

//체크 후 수정 하기
function checkModify(){
	if(document.getElementById("name").value==""){  
		  nameDiv.innerText = "이름을 입력하세요.";
	
	}else if(document.modifyForm.pwd.value=="" || document.modifyForm.repwd.value=="" ) {
		  alert("비밀번호를 입력하세요.");

	}else if(document.modifyForm.pwd.value != document.modifyForm.repwd.value) {
		  alert("비밀번호가 맞지 않습니다.");

	}else if(document.modifyForm.pwd.value != document.modifyForm.pwdcheck.value) {
		  alert("비밀번호를 잘못 입력 하였습니다..");

	}else {
		  document.modifyForm.submit();
	}
}


//비밀번호 변경하기
function updatePwd(){
	if(document.modifyForm.pwd.value=="" || document.modifyForm.repwd.value=="" ) {
		  alert("비밀번호를 입력하세요.");

	}else if(document.modifyForm.pwd.value != document.modifyForm.repwd.value) {
		  alert("비밀번호가 맞지 않습니다.");

	}else if(document.modifyForm.pwd.value != document.modifyForm.pwdcheck.value) {
		  alert("비밀번호를 잘못 입력 하였습니다..");

	}else {
		  if(win != null){
			 win.close();
	  	  }
	 	  win = window.open("checkPwd.do","change pwd","width=500 height=500 scrollbars=yes");
	}
}

//비밀번호 변경하기
function updatePwdOk(){
		var pwdDiv = document.getElementById("pwdDiv");
		var repwdDiv = document.getElementById("repwdDiv");
		
		pwdDiv.innerText = "";
		repwdDiv.innerText = "";

	
	if(document.checkPwd.pwd.value=="" || document.checkPwd.repwd.value==""  ) {
		 pwdDiv.innerText = "비밀 번호를 입력하세요.";

	}else if(document.checkPwd.pwd.value != document.checkPwd.repwd.value) {
		 repwdDiv.innerText = "비밀 번호가 맞지 않습니다.";

	}else {
		 document.checkPwd.submit(); 
	}
}


//글작성 시 유효성 검사
function checkBoardWrite(){
	var subjectDiv = document.getElementById("subjectDiv");
		var contentDiv = document.getElementById("contentDiv");
		
		subjectDiv.innerText = "";
		contentDiv.innerText = "";

	  if(document.getElementById("subject").value==""){  
		  subjectDiv.innerText = "제목은 필수 입력사항입니다.";
		  //nameDiv.style.border = "1px red solid";

	  }else if(document.getElementById("content").value==""){
		  contentDiv.innerText = "내용을 입력하지 않았습니다.";
		  //idDiv.style.border = "1px red solid";

	  }else {
		  document.boardWriteForm.submit();
	  }
	
}//글작성 시 유효성 검사 end






//id 중복체크 할 때
function checkId(){
	var idDiv = document.getElementById("idDiv");
	let id = document.getElementById("id").value;
	
	console.log("중복체크");
	if(document.getElementById("id").value==""){  
		  idDiv.innerText = "먼저 아이디를 입력하세요.";

	}else {
		window.name = "parentForm";
		window.open("checkId.do?id="+id,"chkForm","width=320 height=150")
	}
}



//id 중복체크 할 때
function checkIdAgain(){
	var idDiv = document.getElementById("idDiv");
	let id = document.getElementById("id").value;
	
	console.log("중복체크");
	if(document.getElementById("id").value==""){  
		  idDiv.innerText = "먼저 아이디를 입력하세요.";
	}else {
		location.href = 'checkId.do?id='+id
	}
}



//id창 입력했을 때 다시 체크 해야하게
function inputIdChk(){
	document.writeForm.idDuplication.value = "idUncheck";
}




//글쓰기로 이동
function page_write(){
		
	location.href = "/board/writeForm.do";
}


//회원가입시 체크 후 가입시키기
function checkWrite(){
		var nameDiv = document.getElementById("nameDiv");
		var idDiv = document.getElementById("idDiv");

	  	nameDiv.innerText = "";
		idDiv.innerText = "";

	  if(document.getElementById("name").value==""){  
		  nameDiv.innerText = "이름을 입력하세요.";
		  //nameDiv.style.border = "1px red solid";

	  }else if(document.getElementById("id").value==""){
		  idDiv.innerText = "아이디를 입력하세요.";
		  //idDiv.style.border = "1px red solid";

	  }else if(document.writeForm.pwd.value=="" || document.writeForm.repwd.value=="" ) {
		  alert("비밀번호를 입력하세요.");

	  }else if(document.writeForm.pwd.value != document.writeForm.repwd.value) {
		  alert("비밀번호가 맞지 않습니다.");

	  }else if(document.writeForm.idDuplication.value != "idCheck"){
		  alert("아이디 중복체크 해주세요.");
	//아이디 중복 체크 시 text로 value값을 또 가져온 후 아이디 text안의 값과 비교해서 같을 때 중복체크가 제대로
	//된 걸로 파악하고 가입 시키는 방법도 있음.
	  }else document.writeForm.submit();
}

//사용하기 클릭 시 부모창으로 값 전달
function sendCheckValue(inputId){

	console.log(opener)
	//아이디 전달
	opener.document.writeForm.id.value = inputId;
	//중복 체크 결과 전달
	opener.document.writeForm.idDuplication.value = "idCheck";
	
	window.close();
	
	//패스워드로 포커스 이동
	opener.writeForm.pwd.focus();
	if(opener != null){
		opener.chKform = null;
		self.close();
	}
}

var win;

//주소값
function checkPost(){
	
	 if(win != null){
		win.close();
	  }
	  win = window.open("checkPost.do",
						"search post","width=500 height=500 scrollbars=yes");
}

function serachPost(){
	if(win != null){
		win.close();
	  }
	
	document.checkPost.submit();
}



//주소 클릭시 보내기
function checkPostClose(inputZipcode, inputAddress){
	//아이디 전달
	//$(opener.document).find("#zipcode").val(inputZipcode);
	//$(opener.document).find("#address").val(inputAddress);
	
	//폼즈의 객체의 0번째 방 /어떤 폼이든...
	opener.document.forms[0].zipcode.value = inputZipcode;
	opener.document.forms[0].address.value = inputAddress;
	
	//writeForm에서만 가능...
	//opener.document.writeForm.zipcode.value = inputZipcode;
	//opener.document.writeForm.address.value = inputAddress;
	
	//opener.document.getElementById("zipcode").value = inputZipcode;
	//opener.document.getElementById("address").value = inputAddress;
	
	window.close();
	
	//상세 주소로 포커스 이동
	opener.document.getElementById("detailAddress").focus();
	//opener.writeForm.detailAddress.focus();
}

