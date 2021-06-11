<%@page import="com.semi.member.model.vo.MemberMenuList"%>
<%@page import="com.semi.member.model.vo.MemberExcList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List, com.semi.member.menu.model.vo.*" %>
<%@ page import="com.semi.member.model.service.*" %>
<%
	List<MemberExcList> exclist=(List<MemberExcList>)request.getAttribute("list");
	List<MemberMenuList> menulist=(List<MemberMenuList>)request.getAttribute("list2");
	String excpagebar = (String)request.getAttribute("pageBar");
	String menupagebar = (String)request.getAttribute("pageBar2");
	String today=(String)request.getAttribute("today");
	String time=(String)request.getAttribute("time");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/02memberMyList.css">
</div>
<!--------------- 배너 ---------->
     <div id="banner_home" class="container-fluid">
    	<div class="row">
    		<div class="col-md-12">
    			<img src="<%=request.getContextPath()%>/Resource/img/banner_memberMyList.png" alt="" style="width:100%; height:auto; margin:0;">
    		</div>
    	</div>
    </div>
    <br> <br> 
    
    <div class="container">
<div id="memberMyList" class="row">

	<!-- 요일선택 -->
	<div class="row">
		<div class="col-md-1"></div>
		<div id="select_weekday" class="col-md-9" style="align-text:center;">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="day_myList col-md-1" style="background-color:#df4833;">월</div>
				<div class="day_myList col-md-1" style="background-color:orange">화</div>
				<div class="day_myList col-md-1" style="background-color:#e6c050">수</div>
				<div class="day_myList col-md-1" style="background-color:#54a635">목</div>
				<div class="day_myList col-md-1" style="background-color:#28a0c8">금</div>
				<div class="day_myList col-md-1" style="background-color:#4650aa">토</div>
				<div class="day_myList col-md-1" style="background-color:#7850b4">일</div>
			</div>
		</div>
		<div class="col-md-2">
			<br><br><br>
			<div class="col-md-12 btn01" onclick="location.assign('<%=request.getContextPath()%>/plan/submit')">모든 계획 등록하기</div>
		</div>
	</div>


	<!-- 운동계획 / 식단계획 -->
	<div class="row">
		<div id="list_title_container" class="col-md-12">
			<div class="col-md-6">
			<div id="myexc" class="list_title_area col-md-12">
				<%=today %>요일 운동 계획
			</div>
			</div>
			<div class="col-md-6">
			<div id="mymenu" class="list_title_area col-md-12 ">
				<div class="col-md-10">
					<%=today %>요일 식단 계획
				</div>
				<div class="col-md-2">
					<select style="width:100%" class="selectBtn">
						<option value="아침" <%=time!=null&&time.equals("아침")?"selected":"" %>>아침</option>
						<option value="점심" <%=time!=null&&time.equals("점심")?"selected":"" %>>점심</option>
						<option value="저녁" <%=time!=null&&time.equals("저녁")?"selected":"" %>>저녁</option>
					</select>
				</div>
			</div>
			</div>
		</div>
	</div>


	<!-- 운동 / 식단 리스트 -->
	<div class="row">
		<div id="list_container_myList" class="col-md-12">
			<!-- 운동리스트 -->	
			<div class="col-md-6">			
			<div id="my_list_exc" class="col-md-12">
				<%int ecount=1; %>
				<%for(MemberExcList mel : exclist) {%>
				<div class="col-md-12 excinfocho">
					<div class="list_img_area col-md-2"  style="height:80px;">
 					<img src="" class="excimg"> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<input type="hidden" class="excid" name="excid" value="<%=mel.getExcId()%>">
						<div class="excname data row">대충 저장한 운동이름1</div> 
						<div class="row data">
							<div class="data col-md-4 categoryLine data">무게 : <%=mel.getWeight() %>kg</div>
							<div class="data col-md-4 categoryLine data">횟수 : <%=mel.getReps() %>reps</div>
							<div class="data col-md-4 data">세트수 : <%=mel.getSets() %>sets</div>
						</div>
					</div>
					<div class="list_button_area col-md-1">
						<div class="row btn01" onclick="window.open('<%=request.getContextPath() %>/member/myexclistupdate?no=<%=mel.getExcNo()%>&excid=<%=mel.getExcId() %>',
							'운동편집','left=500,top=300,width=400,height=400,location=no,status=no,scrollbars=yes');">수정</div>
						<div class="row btn01" onclick="location.replace('<%=request.getContextPath()%>/member/myexclistdelete?excno=<%=mel.getExcNo()%>')">삭제</div>
					</div>
				</div>
				<%} %>
		
		
				<!-- pageBar -->
				<div id="pageBar_mylist_exc col-md-12">
					<%=excpagebar %>
				</div>
			</div>
			</div>
			
			
			<!-- 식단리스트 -->	
			<div class="col-md-6">	
			<div id="my_list_menu" class="col-md-12">
				<%int mcount=1; %>
				<%for(MemberMenuList mml:menulist){%>
				<div class="col-md-12 menuinfocho">
					<div class="list_img_area col-md-2" style="height:80px;">
						<img src="" class="menuimg">
					</div>
					<div class="list_name_area2 col-md-9">
						<input type="hidden" class="menuid" name="menuid" value=<%=mml.getMenuId() %>>
						<div class="menuname data row"></div>
						<div class="row data">
							<div class="menuamount data col-md-3 categoryLine data"><%=mml.getAmount() %></div>
							<div class="menukcal data col-md-3 categoryLine data"></div>
							<div class="menuget data col-md-3 data categoryLine"></div>
							<div class="menuget2 data col-md-3 data"></div>
						</div>
					</div>
					<div class="list_button_area col-md-1">
						<div class="row btn01" onclick="window.open('<%=request.getContextPath() %>/member/mymenulistupdate?no=<%=mml.getMenuNo()%>&menuid=<%=mml.getMenuId() %>',
							'메뉴편집','left=500,top=300,width=400,height=400,location=no,status=no,scrollbars=yes');">
							수정
						</div>
						<div class="row btn01" onclick="location.replace('<%=request.getContextPath()%>/member/mymenulistdelete?menuno=<%=mml.getMenuNo()%>')">
							삭제
						</div>
					</div>
				</div>
				<%} %>
				
				
				<!-- pageBar -->
				<div id="pageBar_mylist_menu col-md-12">
					<%=menupagebar %>
				</div>
			</div>
			</div>
		</div>
	</div>
	
	
	<div class="row">
		<div id="mylist_info_container" class="col-md-12">
			<div id="myExc_info" class="mylist_info col-md-6">
				<div class="list_title_area col-md-12">운동 정보</div>
				<div id="myExc_info_box" class="mylist_box col-md-12"></div>
			</div>
			<div id="myMenu_info" class="mylist_info col-md-6">
				<div class="list_title_area col-md-12">메뉴 정보</div>
				<div id="myMenu_info_box" class="mylist_box col-md-12"></div>
			</div>
		</div>
	</div>
</div>

<!-- <style>
.data { pointer-events: none; }
</style> -->
<script>
	
	$(".day_myList").click(e=>{
		var dayval=$(e.target).text().trim();
		
		location.assign("<%=request.getContextPath()%>/member/myList?val="+dayval);	
	});
	
	$("#mymenu>div>select").change(e=>{
		var dayval="<%=today%>";
		
		const daytime=$(e.target).val();
		location.assign("<%=request.getContextPath()%>/member/myList?val="+dayval+"&time="+daytime);	
	})
	
	$(".excinfocho").click(e=>{	
		$("#myExc_info_box").html("");
		let tlist
		if($(e.target).parents(".excinfocho").length!=0){
			 tlist= $(e.target).parents(".excinfocho");
		}else{
			tlist = $(e.target);
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/exclist",
			type:"post",
			data:{
				excid:tlist.children(".list_name_area").children(".excid").val()
				},
			success:data=>{
				
				const div=$("<div>");
				const excvideo=$("<iframe>").attr({
					"src":data.excVideo,
					"width":"550px",
					"height":"300px"
				})
				div.html(data.excManual);
				$("#myExc_info_box").append(div);
				$("#myExc_info_box").append(excvideo);
				}
			})
		})
		
	$(".menuinfocho").click(e=>{	
		$("#myMenu_info_box").html("");
		let tlist
		if($(e.target).parents(".menuinfocho").length!=0){
			 tlist= $(e.target).parents(".menuinfocho");
		}else{
			tlist = $(e.target);
		}
		console.log(tlist);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/selectmenu",
			type:"post",
			data:{
				Menuid:tlist.children(".list_name_area2").children(".menuid").val()
				},
			success:data=>{
				
				const div=$("<div>");
				const menuvideo=$("<img>").attr({
					"src":data.menuVideo,
					"width":"550px",
					"height":"300px"
				})
				div.html(data.menuManual);
				$("#myMenu_info_box").append(div);
				$("#myMenu_info_box").append(menuvideo);
				}
			})
		})
		
	$(function(){
		$("input[name=excid]").each((i,v)=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/exclist",
			type:"get",
			data:{			
				excid:$("input[name=excid]").eq(i).val()
				},
				success:data=>{
				$(".excimg").eq(i).attr({
					"src":data.fileList[0],
					"width":"50px",
					"height":"50px"
				});
				$(".excname").eq(i).html(data.excName);
							
					}
				})
			})
		});
	
	$(function(){
		$("input[name=menuid]").each((i,v)=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/selectmenu",
			type:"get",
			data:{		
				Menuid:$("input[name=menuid]").eq(i).val()
				},
				success:data=>{
					$(".menuimg").eq(i).attr({
						"src":data.fileList[0],
						"width":"50px",
						"height":"50px"
					})
					$(".menuname").eq(i).html(data.menuName);
					$(".menuamount").eq(i).html("칼로리"+"<br>"+data.kcal);
					$(".menukcal").eq(i).html("탄수화물"+"<br>"+data.ch);		
					$(".menuget").eq(i).html("지방"+"<br>"+data.fat);
					$(".menuget2").eq(i).html("단백질"+"<br>"+data.prot);
					
					}
				})
			})
		});

</script>	
	<%@ include file="/views/common/footer.jsp"%>