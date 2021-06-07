<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.semi.gallary.model.vo.Gallary"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/noonWrite.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	Gallary g =(Gallary)request.getAttribute("gallary");
	Member m=(Member)session.getAttribute("logged");
	
	
%>	
	
	
	
<div class="row">
	<div class="col-md-1"></div>
	<div id="n_title" class="col-md-10">
		<h2>눈바디</h2>
	</div>
	<div class="col-md-1"></div>
</div>
<form action="<%=request.getContextPath() %>/gallary/updateGallaryEnd"  method="post" enctype="multipart/form-data" id="frm">
	<div class="row">
		<div class="col-md-1"></div>

		<div id="n_content_area" class="col-md-10">


			<div id="n_content" class="col-md-6">
				<div class="col-md-1"></div>s
				<div id="n_date" class="col-md-5">
					<input type="text" name="title" value="<%=g.getGallaryDate()%> " readonly
						style="font-size: 20px; font-weight: bold;">
					<input type="text" name ="writer" value="<%=m.getNickname() %>님의 기록 " readonly />
					<input type="hidden" name="memberId" value="<%=m.getMemberId() %>" />	
				</div>
				<div class="col-md-2"></div>
<!-- 				<div id="n_date" class="col-md-4">
					<label>자유게시판공유하기 : <input type="checkbox" name="share">
					</label>
				</div> -->
				<div class="row">
					<div id="n_content_img" class="col-md-12">
						<img id="img_preview" src="<%=request.getContextPath() %>/upload/gallary/<%=g.getImgName()%>">
					</div>
				</div>
			</div>


			<div id="n_list" class="col-md-6">
				<br><br>
				
				<div id="comment_area" class="row">
					<input type="hidden" name="galno" value="<%=g.getGalNo() %>" />
					<textarea name="content" id="ir1" rows="19" cols="100" required><%=g.getContent()%></textarea>
				</div>
				


				<div id="upload_area" class="row">
					<div class="col-md-1 btn">+</div>
					<div class="col-md-10">					
						<input type="file" name="imgUp" id="imgInput"/>
						<span id="fname"><%=g.getImgName() %></span>
						<input type="hidden" name="oldFile" value="<%=g.getImgName()%>">
						
						</div>
				</div>

				<br>
				<div id="submit_area" class="row">
					<div class="col-md-9"></div>
					<div class="col-md-3 btn">
						<div class="col-md-1"></div>
						<div class="col-md-4"><img src="<%=request.getContextPath()%>/Resource/img/btn-check.png"></div>
						<div class="col-md-5"><button type="submit" id="submit"><img src="<%=request.getContextPath()%>/Resource/img/btn-check.png"><span>등록</span></button></div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="col-md-1"></div>
	</div>
</form>

<script type="text/javascript">

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "<%=request.getContextPath()%>/views/board/editor/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
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
	$("input[type=file]").change(e=>{
		if($(e.target).val()==""){
			$("#fname").show();
		}else{
			$("#fname").hide();
		}
	});



</script>

<%@ include file="/views/common/footer.jsp"%>