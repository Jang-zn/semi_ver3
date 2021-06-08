<%@page import="com.semi.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%@ include file="/views/common/header.jsp"%>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/boardWrite.css"> --%>
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/02boardWrite.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/font.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>



<div class="row">

	<div class="col-md-1"></div>
	<div class="col-md-10">
		<form action="<%=request.getContextPath()%>/board/boardWriteEnd" method="post" enctype="multipart/form-data"
		onsubmit="return submitContents();">
			
			<div id="write_title_area" class="row">
				<div class="col-md-1">
					<select  name="classfication" required>
						<option value="">분류</option>
						<option value="자유" >자유</option>
						<option value="눈바디" >눈바디</option>
					</select>
				</div>
				<div class="col-md-11">
					<input type="text" id="write_title" name="title"
						placeholder="제목을 입력하세요" required style="width: 100%;">
						<!-- 여기에 아이디값,닉네임값 받을것. -->
					<%if(loginMember!=null){ %>
						<input type="hidden" name="writer" value="<%=loginMember.getNickname()%>">
						<input type="hidden" name="memberId" value="<%=loginMember.getMemberId()%>">	
					<%}else{ %>
						<input type="hidden" name="writer" value="">
						<input type="hidden" name="memberId" value="">
					<%} %>
				</div>
			</div>



			<div id="write_content_area" class="row">
				<div class="col-md-12">
					<textarea name="content" id="ir1" rows="30" cols="180" required> 내용을 입력하세요 </textarea>
				</div>
				<br>
				<button type="button" class="btn-reply">추가</button>
			</div>

			<div id="write_upload_area" class="row filecount">
					<div class="col-md-4">
						<input type="file" id="write_upload" name="upload0" style="width: 100%">	
					</div>
					<div class="col-md-8">
						<button type="button" onclick="bbb(event);">삭제</button>
					</div>
			</div>

			<div id="write_btn_area" class="row">
				<div class="col-md-4"></div>
				<div class="btnb col-md-2 btn ">
					<div class="col-md-3" style="margin-left:30px">
						<img src="<%=request.getContextPath()%>/Resource/img/btn-check.png" style="width:100%">
					</div>
					<div class="col-md-6"><button type="submit">등록하기</button></div>
				</div>
				<div class="btn col-md-2 btnb"  onclick='location.assign("<%=request.getContextPath()%>/board/boardList?numPerpage=15")'>돌아가기</div>
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
		$(".btn-reply").click(e=>{
			const filecount = $(".filecount").length;
			if(filecount==5){
				alert("그만!!");
				
			}else{
			const imgaddclone = $(e.target).parent("div").next().clone(true);
			imgaddclone.find("input").val("");
			$(e.target).parent("div").next().after(imgaddclone);
				const for1= $(e.target).parent("div").nextUntil("#write_btn_area");
				for1.each((i,v)=>{
					const zz =$(v).find("input").attr("name");
					if(zz!='upload'+i){
						$(v).find("input").attr("name","upload"+i);
					}
				})
			
			}
		});
		const bbb=(e)=>{
			const filecount = $(".filecount").length;
			if(filecount==1){
				alert("그만!!");
				$(e.target).off("click");
			}else{
			alert($(e.target).parent().siblings().find("input").attr("name")+"삭제");
			$(e.target).parent().parent().remove();
				
			}
			
		}
		
		const submitContents=()=>{
			const ir1 = oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			
			$("[name=content]").html(ir1);
			if($("[name=writer]").val().length==0){
				alert("로그인 후 이용해 주세요.");
				location.assign("<%=request.getContextPath()%>/member/login");
				return false;
			}
			
		}	
</script>
<%@ include file="/views/common/footer.jsp"%>