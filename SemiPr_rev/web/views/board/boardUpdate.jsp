<%@page import="com.semi.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Board b = (Board)request.getAttribute("board");
	String[] filelist = (String[])request.getAttribute("filelist");
%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/boardWrite.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>



<div class="row">

	<div class="col-md-1"></div>
	<div class="col-md-10">
		<form action="<%=request.getContextPath()%>/board/updateEnd" method="post" enctype="multipart/form-data"
		onsubmit="submitContents();">
			<input type="hidden" value="<%=b.getContentNo()%>" name="contentNo">
			<div id="write_title_area" class="flex margin1 row">
				<div class="col-md-1">
					<select class="marginlr" name="classfication" required>
						<option value="">-분류-</option>
						<option value="자유" <%=b.getCategory()==null?"":"selected" %>>자유</option>
						<option value="눈바디" <%=b.getCategory()==null?"":"selected" %>>눈바디</option>
					</select>
				</div>
				<div class="col-md-11">
					<input type="text" id="write_title" name="title"
						placeholder="제목을 입력하세요" required style="width: 100%;" value="<%=b.getTitle()%>">
					<input type="hidden" name="writer" value="aaa">
					<input type="hidden" name="memberId" value="aaa">	
				</div>
			</div>



			<div id="write_content_area" class="row">
				<textarea name="content" id="ir1" rows="30" cols="180" required><%=b.getContent() %></textarea>
				<br>
				<button type="button" class="btn-reply">추가</button>
			</div>
			<%if(filelist[0]==null){ %>
				<div id="write_upload_area" class="row filecount">
							<div class="col-md-4">
								<input type="file" id="write_upload" name="upload" style="width: 100%">	
							</div>
							<div class="col-md-8">
									<button type="button" onclick="bbb(event);">삭제</button>
							</div>
				</div>
			<%} %>
			<%for(String str : filelist) {%>
				<%if(str==null) break; else{%>
					<div id="write_upload_area" class="row filecount">
						<div class="col-md-4">
							<input type="file" id="write_upload" name="upload" style="width: 100%">	
						</div>
						<div class="col-md-4 spanstr" style="position: absolute; margin-left: 91px; padding-bottom: 12px; ">
							<span style="background: white; font-size: 19px"><%=str %></span>
						</div>
						<div class="col-md-4">
								<button type="button" onclick="bbb(event);">삭제</button>
						</div>
					</div>
				<%} %>
			<%} %>
			

			<div id="write_btn_area" class="row">
				<div class="col-md-4"></div>
				<div class="btnb col-md-2 btn ">
					<div class="col-md-3" style="margin-left:30px">
						<img src="<%=request.getContextPath()%>/Resource/img/btn-check.png" style="width:100%">
					</div>
					<div class="col-md-6" style="padding-left:0; text-align:left;"><button type="submit" style="font-size:9px">수정하기</button></div>
				</div>
				<div class="btn col-md-2 btnb"  onclick='location.assign("<%=request.getContextPath()%>/board/content?no=<%=b.getContentNo()%>")'>돌아가기</div>
				<div class="col-md-4"></div>
			</div>
		</form>
	</div>
	<div class="col-md-1"></div>
</div>


<script type="text/javascript">
		$(".deleteDiv").click(e=>{
			$(e.target).parentsUntil(".filecount").find("input").remove();
		});

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
			imgaddclone.find("span").remove();
			imgaddclone.find(".spanstr").remove();
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
				$(e.target).off("click");
			}else{
				alert($(e.target).parent().siblings().find("input").attr("name")+"삭제");
				$(e.target).parent().parent().remove();
				
			}
			
		}
		$("input[type=file]").change(e=>{
    		if($(e.target).val()==""){
    			$(e.target).perent().next().find("span").show();
    		}else{
    			$(".spanstr").hide();
    		}
    	})
		

		
		const submitContents=()=>{
			const ir1 = oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("[name=content]").html(ir1);
			
		}
</script>
<%@ include file="/views/common/footer.jsp"%>