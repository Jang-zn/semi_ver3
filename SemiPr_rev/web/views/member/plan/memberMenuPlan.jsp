<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp"%>
<%@ page import ="com.semi.member.menu.model.vo.Menu"%>
<%@ page import ="com.semi.member.model.vo.Member"%>
<%@ page import ="java.util.List" %>
<%
List<Menu> list =(List<Menu>)request.getAttribute("menuList");

Member m = (Member)session.getAttribute("logged");
String pageBar = (String)request.getAttribute("pageBar");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberExcPlan.css">
	<br>
	<div class=row>
		<div class="col-md-1"></div>
		<div id="sub_change" class="col-md-10">
		        <div class="btn col-md-2">식단 List</div>
		        <div class="btn col-md-2">나만의 식단 등록</div>
		        <div class="btn col-md-2">식단 등록하기(ADMIN)</div>
    	</div>
    </div>
    
    <div class=row>
    	<div class="col-md-1"></div>
	    <div id="list_container" class="col-md-10">
	        <div id="exc_list" class="col-md-5">
	            <div id="sort_container" class="row">
	                <div class="col-md-3">
	                	<select id="excSort">
	                		<option>분류 선택</option>
		                    <option value="고기">- 고기 -</option>
		                    <option value="채소">- 채소 -</option>
	                	</select>
	                </div>
	                <div class="btn col-md-2">인기 식단</div>
	            </div>
	            <br>
	            
	            <%for(Menu me : list){ %>
	            	<div id="sort_list" class="row clickcheck">
	            		<div class="border col-md-2 listimgbox"><img src="<%=request.getContextPath()%>/upload/menuList/<%=me.getFileList().get(0)%>"></div>
	            		<div id="exc_box" class="border col-md-10" style="padding-top:1%;padding-bottom:1%; ">
	            			<div id="exc_box_name" class="col-md-12"><%=me.getMenuName() %></div>
	            			<div id="exc_box_info" class="col-md-12"><%=me.getMenuManual()%></div>
	            			<div id="exc_box_sort" class="col-md-12"><%=me.getMenuSort() %></div>
	            		</div>
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
	            <div id="exc_name" class="row"><%=list.get(0).getMenuName()%></div>
	            <div id="exc_select" class="row">
	                <div id="exc_img" class="col-md-8"><img src="<%=request.getContextPath()%>/upload/menuList/<%=list.get(0).getFileList().get(0)%>"></div>
	                <div class="col-md-1"></div>
	                <div id="exc_submit" class="col-md-3">
	                    <form action="<%=request.getContextPath()%>/member/menuPlan/submit" method="post" onsubmit="return menuSubmit();">
	                        <select name="week">
	                            <option value="월">월</option>
	                            <option value="화">화</option>
	                            <option value="수">수</option>
	                            <option value="목">목</option>
	                            <option value="금">금</option>
	                            <option value="토">토</option>
	                            <option value="일">일</option>
	                        </select><br>
	                        <select name="dayTime">
	                            <option value="아침">아침</option>
	                            <option value="점심">점심</option>
	                            <option value="저녁">저녁</option>
	                        </select><br>
	                        <input type="number" name="amount" placeholder="양(g)" required><br>
	                        <input type="submit" value="등록하기"><br>
	                        <input id="excName" type="hidden" name="menuName">
	                    </form>
	                </div>
	            </div>
	            <div id="exc_detail_info_container" class="row">
	            	<%for(int i=1;i<list.get(0).getFileList().size();i++){ %>
	            		<div class="col-md-12"><img style="width:40%" src="<%=request.getContextPath()%>/upload/menuList/<%=list.get(0).getFileList().get(i)%>"></div>
	            	<%} %>
	                <div class="col-md-12"><%=list.get(0).getMenuManual()%></div>
	            </div>
	            <div id="exc_video" class="row">
					<a href="<%=list.get(0).getMenuVideo()%>">참고 영상 : <%=list.get(0).getMenuVideo()%></a><br>
	                <p>아니면 영상 띄우기<p>
	            </div>
	        <!-- Ajax 적용영역 --> 
	            
	        </div>
	    </div>
    </div>
    
    

<script>
	$(".clickcheck").click(e=>{
		let name =$(e.target).parents(".clickcheck").find("#exc_box_name").text();
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/menuListClick.do?name="+name,
			dataType:"json",
			success:data=>{
				$("#exc_name").text(data.menuName);
				$("#exc_img>img").attr("src","<%=request.getContextPath()%>/upload/menuList/"+data.fileList[0]);
				for(let i=1;i<data.fileList.length;i++){
					let div = $("<div>").addClass("col-md-12");
					let img = $("<img>").attr("src","<%=request.getContextPath()%>/upload/menuList/"+data.fileList[i]).attr("style","width:40%");
					div.append(img);
					if(i==1){
						$("#exc_detail_info_container").html(div);
					}else{
						$("#exc_detail_info_container").append(div);
					}
				}
				let div = $("<div>").addClass("col-md-12");
				div.text(data.menuManual);
				$("#exc_video").html($("<a>").attr("href",data.menuVideo).text("참고영상 : "+data.menuVideo));
			}
		});
	});
	
	$("#excSort").change(e=>{
		let menuSort = $(e.target).val();
		location.assign("<%=request.getContextPath()%>/member/menuPlan?numPerpage=10&menuSort="+menuSort);
	});
	
	// 운동 중복등록시 처리 / 숫자 음수 / 0일때 처리
	// 서브밋하면 확인창만 띄워주고 그 페이지 유지하게 처리
	
	
	//확인창은 알림이나 모달로 띄워주는걸로
	const menuSubmit=()=>{
		$("#excName").val($("#exc_name").text());
		return true;
	}
	
</script>	

<%@ include file = "/views/common/footer.jsp"%>
