<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/boardWrite.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<form action="" method="post" enctype="multipart/form-data">
	<div id="write_title_area" class="flex margin1">
		<select class="marginlr">
			<option>-분류-</option>
			<option value="자유">자유</option>
			<option value="눈바디">눈바디</option>
		</select>
		<input type="text" id="write_title" name="title" size="130" placeholder="제목을 입력하세요" required>
	</div>
	<div id="write_content_area">
		<textarea name="content" id="ir1" rows="30" cols="180" required> 내용을 입력하세요 </textarea>
	</div>
	<div id="write_upload_area">
		<input type="file" id="write_upload" name="upload">
	</div>
	<div id="write_btn_area" class="margin1">
		<button type="submit"><img src="<%=request.getContextPath()%>/Resource/img/btn-check.png">등록</button>
		<button>돌아가기</button>
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