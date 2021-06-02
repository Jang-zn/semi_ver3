<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/boardWrite.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<form action="<%=request.getContextPath()%>/board/boardWriteEnd" method="post" enctype="multipart/form-data" 
	onsubmit="submitContents();">
	<div id="write_title_area" class="flex margin1">
		<select name ="classfication" "class="marginlr" required>
			<option value="">-분류-</option>
			<option value="자유">자유</option>
			<option value="눈바디">눈바디</option>
		</select>
		<input type="text" id="write_title" name="title" size="130" placeholder="제목을 입력하세요" required>
		<input type="hidden" name="writer" value="aaa">
		<input type="hidden" name="memberId" value="aaa">
	</div>
	<div id="write_content_area">
		<textarea name="content" id="ir1" rows="30" cols="180" required>내용을 입력하세요</textarea>
		 <br>
		<button type="button" class="btn-reply">추가</button>
	</div>
	
	<div id="write_upload_area" class="cloneimg">
			<input type="file" id="write_upload" name="upload">
	</div>
	<div id="write_btn_area" class="margin1">
		<button type="submit"><img src="<%=request.getContextPath()%>/Resource/img/btn-check.png">등록</button>
		<button type="button" onclick='location.assign("<%=request.getContextPath()%>/board/boardList")'>돌아가기</button>
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
		
		var count = 2;
		$(".btn-reply").click(e=>{
			const imgaddclone = $(e.target).parent("div").next().clone();
			switch(count){
			case 2 : imgaddclone.children("input").attr("name","upload2");
					break;
			case 3 : imgaddclone.children("input").attr("name","upload3");
					break;
			case 4 : imgaddclone.children("input").attr("name","upload4");
					break;
			case 5 : imgaddclone.children("input").attr("name","upload5");
					break;
			}
			$(e.target).parent("div").next().after(imgaddclone);
			count=count+1;
			
			if(count==6){
				alert("그만!!");
				$(e.target).off("click");
			}
		});
		const submitContents=()=>{
			const ir1 = oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("[name=content]").html(ir1);
			
		}
		
	</script>
<%@ include file="/views/common/footer.jsp"%>