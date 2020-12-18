<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="imageboardWriteForm" method="post" enctype="multipart/form-data" action="imageboardWrite.do">
 <h2 style="margin-left:230px; color:#61615b; font-family:한컴 백제 M;"><b>이미지 올리기</b></h2>
 <hr>
 <br>
<div style="margin-left:70px; float:left">
 <table bgcolor="#feffe0" border="3" cellpadding="3" cellspacing="0">
	<tr>
		<td width="90" height="20" align="center"><b>상품코드</b></td>
		<td>
			<input type="text" id="imageId" name="imageId" value="img_" size="45" placeholder="상품코드 입력">
			<div id="imageIdDiv" style="font-size:8px; color:red; font-weight:bold;"></div>		
		</td>
	</tr>
	<tr>
		<td width="90" height="20" align="center"><b>상품 명</b></td>
		<td>
			<input type="text" id="imageName" name="imageName" size="45" placeholder="상품 명 입력">
			<div id="imageNameDiv" style="font-size:8px; color:red; font-weight:bold;"></div>		
		</td>
	</tr>
	<tr>
		<td width="90" height="20" align="center"><b>단 가</b></td>
		<td>
			<input type="text" id="imagePrice" name="imagePrice" size="45" placeholder="단가 입력">
			<div id="imagePriceDiv" style="font-size:8px; color:red; font-weight:bold;"></div>		
		</td>
	</tr>
	<tr>
		<td width="90" height="20" align="center"><b>개 수</b></td>
		<td>
			<input type="text" id="imageQty" name="imageQty" size="45" placeholder="개수 입력">
			<div id="imageQtyDiv" style="font-size:8px; color:red; font-weight:bold;"></div>		
		</td>
	</tr>
	<tr>
		<td width="90" height="20" align="center"><b>내 용</b></td>
		<td>
		    <textarea id="imageContent" name="imageContent" cols="46" rows="15" placeholder="내용을 입력"
		    		  ></textarea>	
		    <div id="imageContentDiv" style="font-size:8px; color:red; font-weight:bold;"></div>   
		</td>
	</tr>
	<tr bgcolor="#fffff0">
		<td colspan="2" width="90" height="35">
			<input type="file" id="image1" name="image1" size="50">
			<div id="image1Div" style="font-size:8px; color:red; font-weight:bold;"></div>   
		</td>
	</tr>
	<tr bgcolor="#fffff0">
		<td colspan="2" align="center" width="90" height="35">
			<input type="button" value="상품 등록" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0"
				   onclick="javascript:checkImageboardWrite()">&emsp;
			<input type="reset" value="다시 작성"
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0">&emsp;
			<input type="button" value="상품 목록" 
				   style="height:30px;font-size:15px; border-radius:10px; cursor:pointer;
				  		  background-color:#feffe0"
				   onclick='location.href = "imageboardList.do?pg=1"'>
		</td>
	</tr>
	</table>
</div>	
<div style="float:left; margin-top:230px;"> 
 <img style="text-align:right;" src="../image/pikasanta2.png" width="229" height="232">	
</div>		 

</form>  

<script type="text/javascript" src="../js/imageboard.js?ver=1"></script>