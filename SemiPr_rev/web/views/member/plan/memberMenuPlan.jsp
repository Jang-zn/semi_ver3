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

</div>
<!--------------- 배너 ---------->
     <div id="banner_home" class="container-fluid">
    	<div class="row">
    		<div class="col-md-12">
    			<img src="<%=request.getContextPath()%>/Resource/img/banner_memberMenuPlan.png" alt="" style="width:100%; height:auto; margin:0;">
    		</div>
    	</div>
    </div>
	<br>
	<br>
<div class="container">	
	<div class=row>
		
		<div style="font-family: 'GongGothicMedium';
    font-size: 2.3rem;
    font-weight: bold;"id="sub_change" class="">
		       <div class="title02 col-md-2">> 식단 List</div>
		        
    	</div>
		<div id="sort_container" class="col-md-2">
			<div class="row">&nbsp;</div>
			<div class="row paddingb">
				<select id="excSort">
					<option>분류 선택</option>
					<option value="고기">- 고기 -</option>
					<option value="채소">- 채소 -</option>
					<option value="생선">- 생선 -</option>
					<option value="곡류">- 곡류 -</option>
					<option value="면/떡">- 면/떡 -</option>
					<option value="간식">- 간식 -</option>
				</select>
			</div>
		</div>
  	  </div>
    
    <div class=row style="
    border: 2px solid;
">
    	
	    <div id="list_container" class="">
	        <div id="exc_list" class="col-md-5">
	             <div id="sort_container"style="
    margin-top: 13px;
" class="row">
	
	               
	            </div>
	            <br>
	            
	            <%for(Menu me : list){ %>
	            	<div id="sort_list" class="row clickcheck">
	            		<div class="border col-md-3 listimgbox">
	            			<img src="<%=me.getFileList().get(0)%>">
	            		</div>
	            		<div id="exc_box" class="border col-md-9" style="padding-top:1%;padding-bottom:1%;">
	            			<div id="exc_box_name" class="col-md-9" style="margin-bottom:6px;"><%=me.getMenuName() %></div>
	            			<div id="exc_box_sort" class="col-md-3"><%=me.getMenuSort() %></div>
	            			<div id="exc_box_info" class="col-md-12" style="overflow:hidden"><%=me.getMenuManual()%></div>
	        	
	            		</div>
	            	</div>
	            <%} %>
	            <br>
	            <div id="sort_list" class="row">
	            	<div id="pageBar" class="row" style="text-align:center;">
	            		<%=pageBar%>
	            	</div>
	            </div>
	            
	        </div>
	        <div id="exc_list_info" class="col-md-7">
	        
	        <!-- Ajax 적용영역 -->
	        <br>
	            <div id="exc_name" class="row"><%=list.get(0).getMenuName()%></div>
	            <div id="exc_select" class="row">
	                <div id="exc_img" class="col-md-8"><img src="<%=list.get(0).getFileList().get(0)%>"></div>
	                <div id="exc_submit" class="col-md-4">
	                    <form action="<%=request.getContextPath()%>/member/menuPlan/submit" method="post" onsubmit="return menuSubmit();">
	                    	<br><br><br>
	                        <select name="week">
	                            <option value="월">월</option>
	                            <option value="화">화</option>
	                            <option value="수">수</option>
	                            <option value="목">목</option>
	                            <option value="금">금</option>
	                            <option value="토">토</option>
	                            <option value="일">일</option>
	                        </select><br><br>
	                        <select name="dayTime">
	                            <option value="아침">아침</option>
	                            <option value="점심">점심</option>
	                            <option value="저녁">저녁</option>
	                        </select><br><br>
	                        <input type="submit" value="등록하기"><br>
	                        <input id="excName" type="hidden" name="menuName">
	                    </form>
	                </div>
	            </div>
	            <div id="exc_detail_info_container" class="row" style="
    padding: 10px;
">
	            	<%for(int i=1;i<list.get(0).getFileList().size();i++){ %>
	            		<div class="col-md-12"><img style="width:40%" src="<%=list.get(0).getFileList().get(i)%>"></div>
	            	<%} %>
	                <div class="col-md-12" style="font-size:18px"><%=list.get(0).getMenuManual()%></div>
	            </div>
	 			<style>
	 			#exc_video>h2{
	 				margin:20px;
	 				border-right:1.5px dashed darkgray;
	 				border-left:1.5px dashed darkgray;
	 				padding:10px;
	 				font-size:27px;
	 			}
	 			</style>
	            <div id="exc_video" style="padding-bottom:0px;display:flex;margin-top:40px" class="row">
	            	<h2>열량 <br> <%=list.get(0).getKcal() %> kcal</h2><br>
	            	<h2>당질 <br> <%=list.get(0).getCh() %> g</h2><br>
	            	<h2>단백질 <br> <%=list.get(0).getProt() %> g</h2><br>
	            	<h2>지질 <br> <%=list.get(0).getFat() %> g</h2><br>
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
				$("#exc_detail_info_container>div").text(data.menuManual);
				$("#exc_img>img").attr("src",data.fileList[0]);
				for(let i=1;i<data.fileList.length;i++){
					let div = $("<div>").addClass("col-md-12");
					let img = $("<img>").attr("src",data.fileList[i]).attr("style','width:40%");
					div.append(img);
					if(i==1){
						$("#exc_detail_info_container").html(div);
					}else{
						$("#exc_detail_info_container").append(div);
					}
				}
				let div = $("<div>").addClass("col-md-12");
				div.text(data.menuManual);
				$("#exc_video").html("<h2>열량 <br>"+data.kcal+"kcal</h2><br>"+"<h2>당질 <br> "+data.ch+" g</h2><br>"+"<h2>단백질 <br> "+data.prot+" g</h2><br>"+"<h2>지질 <br> "+data.fat+" g</h2><br>");
			}
		});
	});
	
	$("#excSort").change(e=>{
		let menuSort = $(e.target).val();
		location.assign("<%=request.getContextPath()%>/member/menuPlan?numPerpage=6&menuSort="+menuSort);
	});
	

	$(function() {
		let sort = $("#exc_box_sort").text();
		$("#excSort").val(sort);
	}); 
	
	// 서브밋하면 확인창만 띄워주고 그 페이지 유지하게 처리

	const menuSubmit=()=>{
		$("#excName").val($("#exc_name").text());
		return true;
	}
	
</script>	

<%@ include file = "/views/common/footer.jsp"%>
