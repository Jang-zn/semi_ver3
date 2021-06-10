<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="com.semi.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	SimpleDateFormat sf2 = new SimpleDateFormat("a hh시 mm분");
	Member m=(Member)session.getAttribute("logged");
%>


<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/noonWrite.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/board/editor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>

<div class="container-fluid">
	<div class="row">
	<form action="<%=request.getContextPath() %>/gallary/writeEnd" method="post" enctype="multipart/form-data" id="frm">
		<div id="n_title" class="col-md-12">
			<img src="<%=request.getContextPath()%>/Resource/img/noonbody.png"><hr/>
		</div>
	</div>
	<div class="row"> <!-- write 전체 -->	
		<div class="col-md-5"> <!-- write 프리뷰 시작 -->
			<div class="row">
				<div id="n_title" class="col-md-12">
						<p><%= sf.format(nowTime)%> / <%=sf2.format(nowTime) %><p><br/>
					<input type="text" name ="writer" value="<%=m.getNickname() %>님의 기록 " readonly />
					<input type="hidden" name="memberId" value="<%=m.getMemberId() %>" />	
				</div>
			</div>
			<div class="row">
				<div id="n_content_img" class="col-md-12">
					<img id="img_preview" src="<%=request.getContextPath()%>/Resource/img/noonwrite.png">
				</div>
			</div>
		</div> <!--Write 프리뷰 끝  -->	
		
		<div class="col-md-7"> <!-- write작성란 -->
			<div id ="writegap" class="row">
				<div  class="col-md-12"> </div>
			</div>
			
			<div id="comment_area" class="row">
	        	<div class="col-md-12">
					<textarea name="content" id="ir1" rows="19" cols="" required> 내용을 입력하세요 </textarea>
				</div>
			</div>
			<div class="row" >
				<div id="upload_area" class="col-md-5" >
					<input type="file" name="imgUp" id="imgInput"/>								
				</div>
				<div id="submit_area" class="col-md-7">
					<input type="submit" id="submit" value="등록"/>					
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
			
		
		
</script>




<%@ include file="/views/common/footer.jsp"%>