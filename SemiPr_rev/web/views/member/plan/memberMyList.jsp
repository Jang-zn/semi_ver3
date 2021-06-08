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
<div id="memberMyList" class="row">

	<!-- 요일선택 -->
	<div class="row">
		<div class="col-md-1"></div>
		<div id="select_weekday" class="col-md-10">
			<div class="day_myList col-md-1">
				<br>월<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br>화<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br>수<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br>목<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br>금<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br>토<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br>일<br> <br>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>


	<!-- 운동계획 / 식단계획 -->
	<div class="row">
		<div id="list_title_container" class="col-md-12">
			
			<div id="myexc" class="list_title_area col-md-6">
				<%=today %>요일 운동계획
			</div>
			
			<div id="mymenu" class="list_title_area col-md-6">
				<div class="col-md-10">
					<%=today %>요일 식단계획
				</div>
				<div class="col-md-2">
					<select style=""width:100%">
						<option value="아침" <%=time!=null&&time.equals("아침")?"selected":"" %>>아침</option>
						<option value="점심" <%=time!=null&&time.equals("점심")?"selected":"" %>>점심</option>
						<option value="저녁" <%=time!=null&&time.equals("저녁")?"selected":"" %>>저녁</option>
					</select>
				</div>
			</div>
			
		</div>
	</div>


	<!-- 운동 / 식단 리스트 -->
	<div class="row">
		<div id="list_container_myList" class="col-md-12">
			<!-- 운동리스트 -->		
			<div id="my_list_exc" class="col-md-6">
				<%for(MemberExcList mel : exclist) {%>
				<div class="col-md-12 excinfocho">
					<div class="list_img_area col-md-2">
					<!-- br은 리스트 사이즈 맞출라고 넣은거니까 이미지 들어가면 지워주면 됩니다 -->
						<br> <img src="" class="excimg"> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<input type="hidden" name="excid" value="<%=mel.getExcId() %>">
						<div class="excname data row">대충 저장한 운동이름1</div> 
						<div class="row">
							<div class="data col-md-4">무게 : <%=mel.getWeight() %>kg</div>
							<div class="data col-md-4">횟수 : <%=mel.getReps() %>reps</div>
							<div class="data col-md-4">세트수 : <%=mel.getSets() %>sets</div>
						</div>
					</div>
					<div class="list_button_area col-md-1">
						<div class="row" onclick="window.open('<%=request.getContextPath() %>/member/myexclistupdate?no=<%=mel.getExcNo()%>&excid=<%=mel.getExcId() %>',
							'운동편집','left=500,top=300,width=400,height=400,location=no,status=no,scrollbars=yes');">수정</div>
						<div class="row" onclick="location.replace('<%=request.getContextPath()%>/member/myexclistdelete?excno=<%=mel.getExcNo()%>')">삭제</div>
					</div>
				</div>
				<%} %>
		
		
				<!-- pageBar -->
				<div id="pageBar_mylist_exc col-md-12">
					<%=excpagebar %>
				</div>
			</div>
			
			
			<!-- 식단리스트 -->			
			<div id="my_list_menu" class="col-md-6">
				<%for(MemberMenuList mml:menulist){%>
				<div class="col-md-12 menuinfocho">
				
					<div class="list_img_area col-md-2">
						<br> <img src="" class="menuimg"> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<input type="hidden" name="menuid" value=<%=mml.getMenuId() %>>
						<div class="data row">대충 저장한 메뉴이름1</div>
						<div class="row">
							<div class="menuamount data col-md-4"><%=mml.getAmount() %></div>
							<div class="menukcal data col-md-4">칼로리: xx kcal</div>
							<div class="menuget data col-md-4">영양소 : ~~~~</div>
						</div>
					</div>
					<div class="list_button_area col-md-1">
						<div class="row" onclick="window.open('<%=request.getContextPath() %>/member/mymenulistupdate?no=<%=mml.getMenuNo()%>&menuid=<%=mml.getMenuId() %>',
							'메뉴편집','left=500,top=300,width=400,height=400,location=no,status=no,scrollbars=yes');">
							수정
						</div>
						<div class="row" onclick="location.replace('<%=request.getContextPath()%>/member/mymenulistdelete?menuno=<%=mml.getMenuNo()%>')">
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
	
	
	<div class="row">
		<div id="mylist_info_container" class="col-md-12">
			<div id="myExc_info" class="mylist_info col-md-6">
				<h3>대충 선택한 운동 정보</h3>
				<div id="myExc_info_box" class="mylist_box"></div>
			</div>
			<div id="myMenu_info" class="mylist_info col-md-6">
				<h3>대충 선택한 메뉴 정보</h3>
				<div id="myMenu_info_box" class="mylist_box"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>
<style>
.data { pointer-events: none; }
</style>
<script>
	
	$(".day_myList").click(e=>{
		var dayval=$(e.target).text().trim();
		console.log(dayval);
		location.assign("<%=request.getContextPath()%>/member/myList?val="+dayval);	
	});
	
	$("#mymenu>div>select").change(e=>{
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
				excid:$(e.target).children(1).eq(0).val()
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
		$("#myMenu_info_box").html("");
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/selectmenu",
			type:"get",
			data:{
				Menuid:$(e.target).children(1).eq(0).val()
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
		$("input[name=excid]").each((i,v)=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/exclist",
			type:"get",
			data:{			
				excid:$("input[name=excid]").eq(i).val()
				},
				success:data=>{
				console.log(data);
				$(".excimg").eq(i).attr("src",data.fileList[0]);
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
					console.log(data)
					let amount =$(".menuamount").eq(i).text();
					$(".menuimg").eq(i).attr("src",data.fileList[0]);
					$(".menukcal").eq(i).html("kcal:"+Math.ceil((data.kcal)/amount));		
					$(".menuget").eq(i).html("ch:"+Math.ceil(data.ch/amount))
					}
				})
			})
		});

</script>	
	