<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp"%>
<%@ page import ="com.semi.member.exc.model.vo.Exercise"%>
<%@ page import ="java.util.List" %>
<%
List<Exercise> list =(List<Exercise>)request.getAttribute("excList");

String pageBar = (String)request.getAttribute("pageBar");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberExcPlan.css">
	<br>
	<div class=row>
		<div class="col-md-1"></div>
		<div id="sub_change" class="col-md-10">
		        <div class="btn col-md-2">운동 List</div>
		        <div class="btn col-md-2">나만의 운동 등록</div>
		        <div class="btn col-md-2">운동 등록하기(ADMIN)</div>
    	</div>
    </div>
    
    <div class=row>
    	<div class="col-md-1"></div>
	    <div id="list_container" class="col-md-10">
	        <div id="exc_list" class="col-md-5">
	            <div id="sort_container" class="row">
	                <div class="col-md-2">
	                	<select id="excSort">
		                    <option name="chest" value="상체">상체</option>
		                    <option name="lowerbody" value="하체">하체</option>
	                	</select>
	                </div>
	                <div class="btn col-md-2">인기 운동</div>
	            </div>
	            <br>
	            
	            <%for(Exercise e : list){ %>
	            	<div id="sort_list" class="row clickcheck">
	            		<div class="border col-md-2 listimgbox"><img src="<%=request.getContextPath()%>/upload/excList/<%=e.getFileList().get(0)%>"></div>
	            		<!-- Exercise에 요약정보 row 추가해줘야됨 -->
	            		<div class="border col-md-10" style="padding-top:1%;padding-bottom:1%; "><%=e.getExcName() %><br><%=e.getExcManual()%> <br><%=e.getExcSort() %></div>
	            	</div>
	            <%} %>
	            <div id="sort_list" class="row">
	            	<div id="pageBar" class="row" style="text-align:center;">
	            		<%=pageBar%>
	            	</div>
	            </div>
	            
	        </div>
	        <div id="exc_list_info" class="col-md-7">
	        
	        <!-- Ajax 적용영역 -->
	            <div id="exc_name" class="row"><%=list.get(0).getExcName()%></div>
	            <div id="exc_select" class="row">
	                <div id="exc_img" class="col-md-8"><img src="<%=request.getContextPath()%>/upload/excList/<%=list.get(0).getFileList().get(0)%>"></div>
	                <div class="col-md-1"></div>
	                <div id="exc_submit" class="col-md-3">
	                    <form action="" method="post">
	                        <select name="week">
	                            <option value="월">월</option>
	                            <option value="화">화</option>
	                            <option value="수">수</option>
	                            <option value="목">목</option>
	                            <option value="금">금</option>
	                            <option value="토">토</option>
	                            <option value="일">일</option>
	                        </select><br>
	                        <input type="number" name="weight" placeholder="kg"><br>
	                        <input type="number" name="reps" placeholder="횟수"><br>
	                        <input type="number" name="sets" placeholder="세트수"><br>
	                        <input type="submit" onclick="" value="등록하기">
	                    </form>
	                </div>
	            </div>
	            <div id="exc_detail_info_container" class="row">
	                <p><%=list.get(0).getExcManual()%></p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	            </div>
	            <div id="exc_video" class="row">
					<a href="<%=list.get(0).getExcVideo()%>">참고 영상 : <%=list.get(0).getExcVideo()%></a><br>
	                <p>아니면 영상 띄우기<p>
	            </div>
	        <!-- Ajax 적용영역 --> 
	            
	        </div>
	    </div>
    </div>
    
<script>
	$(".clickcheck").click(e=>{
		$(e.target).parents(".clickcheck").attr("style","border:3px solid gold");
	});
</script>
<%@ include file = "/views/common/footer.jsp"%>
