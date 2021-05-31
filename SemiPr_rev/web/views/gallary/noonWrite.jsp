<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/noonWrite.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	
<div id="n_title">
	<h2>눈바디</h2>
</div>

<form action="<%=request.getContextPath() %>/gallary/writeEnd" method="post" enctype="multipart/form-data" id="frm">
<div id="n_content_area">
	
	<div id="n_content">
		<div id="n_date">
			<input type="text" name="title" value="21.5.26 / xxx님의 기록" readonly style="font-size:20px; font-weight:bold;">
			<label>자유게시판 공유하기 : <input type = "checkbox" name="share"></label>
		</div>
		<div id="n_content_img">
			<img id="img_preview" src="#">
		</div>
	</div>
	
	
	<div id="n_list">
		<div id="n_img_list">
			<div id="n_comment">
				<div id="comment_area">
					<textarea name="content" id="ir1" rows="22" cols="84" required > 내용을 입력하세요 </textarea>
				</div>
			</div>
		</div>
		
		
		<div id="upload_area">
			<button > + </button>
			<input type="file" name="imgUp" id="imgInput"/>
			<img id="img_section" src="#" >
		</div>
		
		
		<div id="submit_area">
			<button type="submit" id="submit"><img src="<%=request.getContextPath()%>/Resource/img/btn-check.png"><span>등록</span></button>
		</div>
	</div>
	
	
	
</div>
</form>

<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
 		oAppRef: oEditors,
 		elPlaceHolder: "ir1",
 		sSkinURI: "<%=request.getContextPath()%>/views/board/editor/SmartEditor2Skin.html",
 		fCreator: "createSEditor2"
		});
		
		$("#submit").click(function(){ 
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
			$("#frm").submit(); 
			})

		
		
		//업로드이미지 미리보기 
		function readURL(input) {
			 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  
			  reader.onload = function (e) {
			   $('#img_preview').attr('src', e.target.result);  
			  }
			  
			  reader.readAsDataURL(input.files[0]);
			  }
			}			 
			// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행.
			$("#imgInput").change(function(){
			   readURL(this);
			});
		
</script>




<%@ include file="/views/common/footer.jsp"%>