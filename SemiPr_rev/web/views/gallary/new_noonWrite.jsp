<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/noonWrite.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	
<div id="n_title">
	<h2>눈바디</h2>
</div>

<form action="" method="post" enctype="multipart/form-data">
<div id="n_content_area">
	
	<div id="n_content">
		<div id="n_date">
			<input type="text" name="title" value="21.5.26 / xxx님의 기록" readonly style="font-size:20px; font-weight:bold;">
			<label>자유게시판 공유하기 : <input type = "checkbox" name="share"></label>
		</div>
		<div id="n_content_img">
			<img src="">
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
			<button> + </button>
			<input type="file" name="imgUp">
		</div>
		
		
		<div id="submit_area">
			<button type="submit" onclick="test();"><img src="<%=request.getContextPath()%>/Resource/img/btn-check.png"><span>등록</span></button>
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

</script>




<%@ include file="/views/common/footer.jsp"%>