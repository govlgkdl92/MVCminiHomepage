//전체선택
function checkAll(all){
    var check = document.getElementsByName("check");
    document.getElementsByName("check").length;

    if (all.checked) {﻿
        for (var i=0; i<=check.length-1; i++){
         if(check[i].type == "checkbox")
             check[i].checked = true;
        }
    } else {
        for (var i=0; i<=check.length-1; i++) {
         if(check[i].type == "checkbox"){
             check[i].checked = false;
         }
        }
    }
} 
//전체선택end



//선택 삭제
 function choiceDelete(){
	let check = document.getElementsByName("check");
	let count = 0;
	
	for(var i=0; i<check.length; i++){
		if(check[i].checked) count++;
	}//for
	
	if(count = 0){
		alert("삭제할 상품을 체크해 주세요");	
	}else {
		if(confirm("정말로 삭제하시겠습니까?")){
			document.imageboardListForm.submit();
		}
	}

 }﻿
//선택 삭제 둥

function isLogin(id, pg, seq) {
	if(id == ""){
		alert("먼저 로그인하세요");
		location.href="../member/loginForm.do"
	}
	else {
		location.href="../imageboard/imageboardView.do?seq="+seq+"&pg="+pg;
	}	
}

// page 받아서 submit
// 검색어
function imageboardPaging(pg){
	
	location.href="imageboardList.do?pg="+pg;
	
}

//글작성 시 유효성 검사
function checkImageboardWrite(){
	var subjectDiv = document.getElementById("imageIdDiv");
	var contentDiv = document.getElementById("imageNameDiv");
	var contentDiv = document.getElementById("imagePriceDiv");
	var contentDiv = document.getElementById("imageQtyDiv");
	var contentDiv = document.getElementById("imageContentDiv");
	var contentDiv = document.getElementById("image1Div");
		
		subjectDiv.innerText = "";
		imageNameDiv.innerText = "";
		imagePriceDiv.innerText = "";
		imageQtyDiv.innerText = "";
		imageContentDiv.innerText = "";
		image1Div.innerText = "";
		
	  if(document.getElementById("imageId").value==""){  
		  imageIdDiv.innerText = "상품 코드를 입력하지 않았습니다.";

	  }else if(document.getElementById("imageName").value==""){
		  imageNameDiv.innerText = "상품명을 입력하지 않았습니다.";

	  }else if(document.getElementById("imagePrice").value==""){
		  imagePriceDiv.innerText = "단가를 입력하지 않았습니다.";

	  }else if(document.getElementById("imageQty").value==""){
		  imageQtyDiv.innerText = "개수를 입력하지 않았습니다.";

	  }else if(document.getElementById("imageContent").value==""){
		  imageContentDiv.innerText = "상품 내용을 입력하지 않았습니다.";

	  }else if(document.getElementById("image1").value==""){
		  image1Div.innerText = "이미지를 등록하지 않았습니다.";

	  }else {
		  document.imageboardWriteForm.submit();
	  }
	
}//글작성 시 유효성 검사 end