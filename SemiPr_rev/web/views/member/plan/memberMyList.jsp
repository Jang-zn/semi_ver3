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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberMyList.css">
<div id="memberMyList">
	<div id="select_weekday">
		<div class="day_myList">일</div>
		<div class="day_myList">월</div>
		<div class="day_myList">화</div>
		<div class="day_myList">수</div>
		<div class="day_myList">목</div>
		<div class="day_myList">금</div>
		<div class="day_myList">토</div>
	</div>
	<div id="list_title_container">
		<div id="myexc" class="list_title_area">
			<h3><%=today%> 요일 운동계획</h3>
		</div>
		<div id="mymenu" class="list_title_area">
			<h3><%=today%> 요일 식단계획</h3>
			<select>
				<option value="아침" <%=time!=null&&time.equals("아침")?"selected":"" %>>아침</option>
				<option value="점심" <%=time!=null&&time.equals("점심")?"selected":"" %>>점심</option>
				<option value="저녁" <%=time!=null&&time.equals("저녁")?"selected":"" %>>저녁</option>
			</select>
		</div>
	</div>
	<div id="list_container_myList">
		<div id="my_list_exc">
			<ul>
			<%if(exclist==null){ %>
				<div>운동 기록이 없읍니다</div>
			<%}else{
			for(MemberExcList mel : exclist) {%>
				<li class="weekDay_list excinfocho" id="">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span><%=mel.getExcId()%></span><br> 
						<span>무게 : <%=mel.getWeight() %> kg</span>
						<span>횟수 : <%=mel.getReps() %> reps</span>
						<span>세트수 : <%=mel.getSets() %>sets</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<%}
			}%>
				
				
				
				
			</ul>
			<style>
				#pageBar_mylist>h3>a{color:black;}
			</style>
			<div id="pageBar_mylist">
				<h3><%=excpagebar %></h3>
			</div>
		</div>
		<div id="my_list_menu">
			<ul>
			
		 	<%if(menulist==null){ %>
				<div>식단 기록이 없읍니다</div>
			<%}else{ %>
			<%for(MemberMenuList mml:menulist){%>
				<li class="weekDay_list menuinfocho">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span class="MenuVal"><%=mml.getMenuId() %></span>
						<br> 
						<span>양 :<%=mml.getAmount() %></span>
						<span class="kacl">칼로리: xx kcal</span>
					
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<%}
				}%>
				
			</ul>
			<div id="pageBar_mylist">
				<h3><%=menupagebar %></h3>
			</div>
		</div>
	</div>
	<div id="mylist_info_container">
		<div id="myExc_info" class="mylist_info">
			<h3>대충 선택한 운동 정보</h3>
			<div id="myExc_info_box" class="mylist_box"></div>
		</div>
		<div id="myMenu_info" class="mylist_info">
			<h3>대충 선택한 메뉴 정보</h3>
			<div id="myMenu_info_box" class="mylist_box"></div>
		</div>

	</div>
</div>
<script>
		
	$(".day_myList").click(e=>{
		var dayval=$(e.target).text();
		console.log(dayval);
		location.assign("<%=request.getContextPath()%>/member/myList?val="+dayval);	
	});
	$("#mymenu>select").change(e=>{
		var dayval="<%=today%>";
		console.log(dayval);
		const daytime=$(e.target).val();
		location.assign("<%=request.getContextPath()%>/member/myList?val="+dayval+"&time="+daytime);	
	})
	
	
	$(".excinfocho").click(e=>{	
		$("#myExc_info_box").html("");
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/exclist",
			type:"get",
			data:{
				excid:$(e.target).children().eq(0).text()
				},
			success:data=>{
				console.log(data);
				const div=$("<div>");
				const div2=$("<div>");
				div.html(data.excManual);
				div2.html(data.excVideo);
				$("#myExc_info_box").append(div);
				$("#myExc_info_box").append(div2);
				}
			})
		})
			
	$(".menuinfocho").click(e=>{	
		console.log($(e.target).children().eq(0).first().text())
		$("#myMenu_info_box").html("");
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/selectmenu",
			type:"get",
			data:{
				Menuid:$(e.target).children().eq(0).first().text()
				},
			success:data=>{
				console.log(data);
				const div=$("<div>");
				const div2=$("<div>");
				div.html(data.menuManual);
				div2.html(data.menuVideo);
				$("#myMenu_info_box").append(div);
				$("#myMenu_info_box").append(div2);
				}
			})
		})
		
		
		
		$(function(){
		$(".MenuVal").each((i,v)=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/selectmenu",
			type:"get",
			data:{
				
				Menuid:$(".MenuVal").eq(i).text()
				},
				success:data=>{
				console.log($(".MenuVal").eq(i).text());
				console.log(data);
					$(".kacl").eq(i).html(data.kcal+"kcal 영양소 탄수화물"+data.prot+"나트륨"+data.na+"팻:"+data.fat);				
					}
				})
			})
		});
		
</script>
<%@ include file="/views/common/footer.jsp"%>