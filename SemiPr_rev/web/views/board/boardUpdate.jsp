<%@page import="com.semi.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Board b = (Board)request.getAttribute("board");
	String[] filelist = (String[])request.getAttribute("filelist");
%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/02boardWrite.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/font.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>


<br>
<br>
<div class="row">

	<div class="col-md-12">
		<form action="<%=request.getContextPath()%>/board/updateEnd" method="post" enctype="multipart/form-data"
		onsubmit="submitContents();">
			<input type="hidden" value="<%=b.getContentNo()%>" name="contentNo">
			<div id="write_title_area" class="row"style="    text-align: center;
    align-self: center;
    font-family: 'GongGothicLight';
    font-size: 1.7rem;
    border-radius: 0.2em;
    border: 1.5px solid lightgray;"class="flex margin1 row">
				<div class="col-md-1" style="    font-family: 'PFStardust';
    font-size: 1.7rem;
    font-weight: bold;
    padding: 0.3rem;
    border-radius: 0.2em;
    border: 1.5px solid black;">
					<select  name="classfication" required>
						<option value="">분류</option>
						<option value="자유" <%=b.getCategory()==null?"":"selected" %>>자유</option>
						<option value="눈바디" <%=b.getCategory()==null?"":"selected" %>>눈바디</option>
					</select>
				</div>
				<div class="col-md-11" style="    font-family: 'PFStardust';
    font-size: 1.7rem;
    font-weight: bold;
    padding: 0.3rem;
    border-radius: 0.2em;
    border: 1.5px solid black;">
					<input type="text" id="write_title" name="title"
						placeholder="제목을 입력하세요" required style="width: 100%;" value="<%=b.getTitle()%>">
					<!-- 임의로 준부분  -->
					<input type="hidden" name="writer" value="aaa">
					<input type="hidden" name="memberId" value="aaa">	
				</div>
			</div>



			<div id="write_content_area" class="row" style="border-radius:0.2em;
		border:1.5px solid black;">
				<textarea name="content" id="ir1" rows="30" cols="180" required><%=b.getContent() %></textarea>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn-reply btnb btn">추가</button>
			</div>
			<%if(filelist[0]==null){ %>
				<div id="write_upload_area" class="row filecount"style="
			    font-family: 'GongGothicLight';
			    font-size: 1.7rem;
			    border-radius: 0.2em;
			    border: 1.5px solid lightgray;
			    ">
							<div class="col-md-4">
								<input type="file" id="write_upload" name="upload0" style="width: 100%">	
							</div>
							<div class="col-md-8">
									<button class="btnb btn"type="button" onclick="bbb(event);">삭제</button>
							</div>
				</div>
			<%} else{%>
			<%for(int i=0; i<5; i++) {%>
				<%if(filelist[i]==null) break; else{%>
					<div id="write_upload_area" class="row filecount" style="
			    font-family: 'GongGothicLight';
			    border-radius: 0.2em;
			    border: 1.5px solid lightgray;
			    ">
						<div class="col-md-4">
							<input type="file" id="write_upload" name="upload<%=i %>" style="width: 100%">	
						</div>
						<div class="col-md-4 spanstr" style="position: absolute; margin-left: 82px; padding-bottom: 12px; ">
							<span style="background: white; font-size: 19px; position: absolute; width: 150px;"><%=filelist[i] %></span>
							<input type="hidden" name="oldfile<%=i%>" value="<%=filelist[i]%>">
						</div>
						<div style="text-align:center"class="col-md-4">
								<button class="btn btnb"type="button" onclick="bbb(event);">삭제</button>
						</div>
						<%if(filelist[i]!=null){ %>	
							<input type="hidden" name="oldfileR<%=i%>" value="<%=filelist[i]%>">
						<%} %>
					</div>
				<%} %>
			<%} %>
			<%} %>
			
			<br>
			<div id="write_btn_area" class="row">
				<div class="col-md-4"></div>
					<button style="margin-right:20px;"class= "col-md-2 btnb btn"type="submit" >수정하기</button>
				<div class="btn col-md-2 btnb"  onclick='location.assign("<%=request.getContextPath()%>/board/content?no=<%=b.getContentNo()%>")'>돌아가기</div>
				<div class="col-md-4"></div>
			</div>
		</form>
	</div>
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
				alert("더이상 생성 할 수 없습니다.");
				
			}else{
			const imgaddclone = $(e.target).parent("div").next().clone(true);
			imgaddclone.find("input").val("");
			imgaddclone.find("span").remove();
			imgaddclone.find(".spanstr").remove();
			$(e.target).parent("div").next().after(imgaddclone);
				const for1= $(e.target).parent("div").nextUntil("#write_btn_area");
				console.log(for1);
				for1.each((i,v)=>{
					const zz =$(v).find("input").attr("name");
					if(zz!='upload'+i){
						$(v).find("input[type=file]").attr("name","upload"+i);
						$(v).find("input[type=hidden]").attr("name","oldfileR"+i);
					}
				})
			
			}
		});
		
		
		
		
		
		const bbb=(e)=>{
			const filecount = $(".filecount").length;
			if(filecount==1){
				//console.log($(e.target).parent().siblings().find("span").html());
				$.ajax({
					url:"<%=request.getContextPath()%>/board/fileD",
					data:{"deletefile" : $(e.target).parent().siblings().find("span").html()},
					success:data=>{
						
					}
				})
				
				$(".spanstr").remove();
				$("input[type=file]").val("");
				$(e.target).off("click");
			}else{
				//alert($(e.target).parent().siblings().find("input").attr("name")+"삭제");
					console.log($(e.target).parent().siblings().find("span").length);
				if($(e.target).parent().siblings().find("span").length==1){
					console.log($(e.target).parent().siblings().find("span").html());
					$.ajax({
						url:"<%=request.getContextPath()%>/board/fileD",
						data:{"deletefile" : $(e.target).parent().siblings().find("span").html()},
						success:data=>{
						
						}
					})
				}
				$(e.target).parent().parent().remove();
			}
			
		}
		$("input[type=file]").change(e=>{
    		if($(e.target).val()==""){
    			$(e.target).parent().next().find("span").show();
    		}else{
    			$(e.target).parent().next(".spanstr").remove();
    		}
    	})
    	
		

		
		const submitContents=()=>{
			const ir1 = oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("[name=content]").html(ir1);
		
		}
</script>
<%@ include file="/views/common/footer.jsp"%>