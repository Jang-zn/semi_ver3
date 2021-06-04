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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberMyList.css">
<div id="memberMyList">
	<div class="row">
		<div class="col-md-1"></div>
		<div id="select_weekday" class="col-md-10">
			<div class="day_myList col-md-1">
				<br> <br>월<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>화<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>수<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>목<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>금<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>토<br> <br>
			</div>
			<div class="day_myList col-md-1">
				<br> <br>일<br> <br>
			</div>

		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div id="list_title_container" class="col-md-10">
			<div id="myexc" class="list_title_area col-md-6"
				style="font-size: 3rem"><%=today %>요일 운동계획</div>
			<div id="mymenu" class="list_title_area col-md-6">
				<div class="col-md-10" style="font-size: 3rem"><%=today %> 요일 식단계획</div>
				<div class="col-md-2" style="font-size: 2rem">
					<select>
						<option value="아침" <%=time!=null&&time.equals("아침")?"selected":"" %>>아침</option>
						<option value="점심" <%=time!=null&&time.equals("점심")?"selected":"" %>>점심</option>
						<option value="저녁" <%=time!=null&&time.equals("저녁")?"selected":"" %>>저녁</option>
					</select>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div id="list_container_myList" class="col-md-10">
			<div id="my_list_exc" class="col-md-6">
			
				<%for(MemberExcList mel : exclist) {%>
				<div class="row excinfocho">
					<div class="list_img_area col-md-2">
						<br> <img src="" class="excimg"> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<input type="hidden" name="excid" value="<%=mel.getExcId() %>">
						<span class="excname">대충 저장한 운동이름1</span><br> 
						<span>무게 : <%=mel.getWeight() %> kg</span>
						<span>횟수 : <%=mel.getReps() %> reps</span>
						<span>세트수 : <%=mel.getSets() %>sets</span>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn" onclick="window.open('<%=request.getContextPath() %>/member/myexclistupdate?no=<%=mel.getExcNo()%>&excid=<%=mel.getExcId() %>',
						'운동편집','left=500,top=300,width=400,height=400,location=no,status=no,scrollbars=yes');">수정</div>
						<br>
						<div class="btn" onclick="location.replace('<%=request.getContextPath()%>/member/myexclistdelete?excno=<%=mel.getExcNo()%>')">삭제</div>
					</div>
				</div>
				<%} %>
		

	
		
				<div id="pageBar_mylist_exc">
					<h3><%=excpagebar %></h3>
				</div>
			</div>
			<div id="my_list_menu" class="col-md-6">
				<%for(MemberMenuList mml:menulist){%>
				<div class="row menuinfocho">
				
					<div class="list_img_area col-md-2">
						<br> <img src="" class="menuimg"> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<input type="hidden" name="menuid" value=<%=mml.getMenuId() %>>
						<span>대충 저장한 메뉴이름1</span>
						<br><span class="menuamount"><%=mml.getAmount() %></span>
						<span class="menukcal">칼로리: xx kcal</span>
						<span class="menuget">영양소 : ~~~~</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn" onclick="window.open('<%=request.getContextPath() %>/member/mymenulistupdate?no=<%=mml.getMenuNo()%>&menuid=<%=mml.getMenuId() %>',
						'메뉴편집','left=500,top=300,width=400,height=400,location=no,status=no,scrollbars=yes');">수정</div>
						<br>
						<div class="btn" onclick="location.replace('<%=request.getContextPath()%>/member/mymenulistdelete?menuno=<%=mml.getMenuNo()%>')">삭제</div>
					</div>
				</div>
				<%} %>
				
				
				<div id="pageBar_mylist_menu">
					<h3><%=menupagebar %></h3>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div id="mylist_info_container" class="col-md-10">
			<div id="myExc_info" class="mylist_info col-md-6">
				<h3>대충 선택한 운동 정보</h3>
				<div id="myExc_info_box" class="mylist_box"></div>
			</div>
			<div id="myMenu_info" class="mylist_info col-md-6">
				<h3>대충 선택한 메뉴 정보</h3>
				<div id="myMenu_info_box" class="mylist_box"></div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>
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
	