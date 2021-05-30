<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/boardWrite.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>



<div class="row">

	<div class="col-md-1"></div>
	<div class="col-md-10">
		<form action="" method="post" enctype="multipart/form-data">

			<div id="write_title_area" class="flex margin1 row">
				<div class="col-md-1">
					<select class="marginlr">
						<option>-분류-</option>
						<option value="자유">자유</option>
						<option value="눈바디">눈바디</option>
					</select>
				</div>
				<div class="col-md-11">
					<input type="text" id="write_title" name="title"
						placeholder="제목을 입력하세요" required style="width: 100%;">
				</div>
			</div>



			<div id="write_content_area" class="row">
				<textarea name="content" id="ir1" rows="30" cols="180" required> 내용을 입력하세요 </textarea>
			</div>


			<div id="write_upload_area" class="row">
				<div class="col-md-1 btn btnb">+</div>
				<div class="col-md-11">
					<input type="file" id="write_upload" name="upload"
						style="width: 100%">
				</div>
			</div>


			<div id="write_btn_area" class="row">
				<div class="col-md-4"></div>
				<div class="btnb col-md-2 btn ">
					<div class="col-md-3" style="margin-left:30px">
						<img src="<%=request.getContextPath()%>/Resource/img/btn-check.png" style="width:100%">
					</div>
					<div class="col-md-6" style="padding-left:0; text-align:left;">등록하기</div>
				</div>
				<div class="btn col-md-2 btnb">돌아가기</div>
				<div class="col-md-4"></div>
			</div>


		</form>
	</div>
	<div class="col-md-1"></div>

</div>







<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
 		oAppRef: oEditors,
 		elPlaceHolder: "ir1",
 		sSkinURI: "<%=request.getContextPath()%>/views/board/editor/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
			});
</script>
<%@ include file="/views/common/footer.jsp"%>