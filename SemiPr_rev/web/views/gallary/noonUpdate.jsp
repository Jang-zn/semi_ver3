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

<div class="container-fluid">
<br><br>
	<div class="row">
	<form action="<%=request.getContextPath() %>/gallary/updateGallaryEnd"  method="post" enctype="multipart/form-data" id="frm">
		<div id="n_title" class="col-md-12 title01"> > 눈바디
			<%-- <img src="<%=request.getContextPath()%>/Resource/img/noonbody.png"><hr/> --%>
		</div>
	</div>
	<br>
	<div class="row writeGap"> <!-- write 전체 -->	
		<div class="col-md-5"> <!-- write 프리뷰 시작 -->
			<div class="row" style="margin-bottom:1rem;">
				<div id="n_title" class="col-md-12">
					<input type="text" name ="writer" value="<%=m.getNickname() %> 님의 기록 " readonly class="title02"> <span><%=g.getGallaryDate()%></span>
					<input type="hidden" name="memberId" value="<%=m.getMemberId() %>">	
				</div>
			</div>
			<div class="row">
				<div id="n_content_img" class="col-md-12">
					<img id="img_preview" src="<%=request.getContextPath() %>/upload/gallary/<%=g.getImgName()%>">
				</div>
			</div>
		</div> <!--Write 프리뷰 끝  -->	
		
		<div class="col-md-7"> <!-- write작성란 -->
			<div id ="writegap" class="row">
				<div  class="col-md-12"> </div>
			</div>
			
			<div id="comment_area" class="row">
	        	<div class="col-md-12">
	        		<input type="hidden" name="galno" value="<%=g.getGalNo() %>" />
					<textarea name="content" id="ir1" rows="19" cols="" required> <%=g.getContent()%></textarea>
				</div>
			</div>
			<div class="row" >
				<div id="upload_area" class="col-md-7" >
					<input type="file" name="imgUp" id="imgInput"/>	
						<span id="fname"><%=g.getImgName() %></span>
						<input type="hidden" name="oldFile" value="<%=g.getImgName()%>">												
				</div>
				<div id="submit_area" class="col-md-3 btn02">
					<input type="submit" id="submit" value="수정">					
				</div>
			</div>
			</form>	
		</div>
		 
		
	</div> <!-- 전체 row끝 -->
</div> <!-- container 끝 -->

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
