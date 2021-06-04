<%@page import="com.semi.member.daily.model.vo.DailyMenu"%>
<%@page import="com.semi.member.model.vo.MemberExcList"%>
<%@page import="com.semi.member.model.vo.MemberMenuList"%>
<%@page import="com.semi.member.exc.model.vo.Exercise"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.semi.member.daily.model.vo.DailyExercise, java.util.List" %>
<%
	List<MemberExcList> list =(List<MemberExcList>)request.getAttribute("list");
	List<DailyExercise> delist =(List<DailyExercise>)request.getAttribute("list2");
	List<MemberMenuList> menulist =(List<MemberMenuList>)request.getAttribute("list3");
	List<DailyMenu> dmlist =(List<DailyMenu>)request.getAttribute("list4");
	String pagebar = (String)request.getAttribute("pageBar");
	String pagebar2 = (String)request.getAttribute("pageBar2");
	int num=1;
	int num2=1;
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/dailyExc.css">

<div class="row">
	<div class="col-md-1"></div>
	<div id="dailyExc_title" class="col-md-10">
		<h2>운동일지</h2>
	</div>
	<div class="col-md-1"></div>
</div>


<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">

		<div class="row">
			<div id="personal_record_container">
				<h3>연속 <span id="excrecord"></span>일째 계획 실천중</h3>
			</div>
		</div>

		<div id=dailyExc_content_container class="row">
			<div id="dailyExc_content" class="col-md-6" style="overflow:scroll; height:400px;">
				<div class="exc_plan_title row" >
					<span>(제목)운동 계획 날짜 +요일+ 실행여부로 색표현</span>
				</div>
				<div id="excdown">
				<%for(MemberExcList mel :list){ %>
				<div class="exc_plan_list row excday">
					<input type="hidden" name="excno" value="<%=mel.getExcNo() %>">
					<input type="hidden" name="excid" value="<%=mel.getExcId() %>">	
					<span><%=mel.getExcName() %></span><span><%=mel.getReps() %></span><span><%=mel.getSets() %></span>
				</div>
				<%} %>
				</div>
				<div class="row">
					<div class="col-md-5"></div>
					<div id="complete_exc" class="btn col-md-2" onclick="fn_excdaily();">실천 완료</div>
					<div class="col-md-5"></div>
				</div>
			</div>
			<div id="dailyExc_list" class="col-md-6">
				<div class="exc_plan_title row">
					<span>No</span><span>기록일</span>
				</div>
				<%for(DailyExercise de:delist){ %>
				<div class="exc_list row excday2">
					<input type="hidden" name="excdate" value="<%=de.getExcDate()%>">
					<span><%=num %></span><span><%=de.getExcDate()%></span>
				</div>
				<%num++;} %>
			
				<div id="pageBar" class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6"><h5><%=pagebar %></h5></div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</div>


<div class="row">
	<div class="col-md-1"></div>
	<div id="dailyExc_title" class="col-md-10">
		<h2>식단일지</h2>
	</div>
	<div class="col-md-1"></div>
</div>


<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">

		<div class="row">
			<div id="personal_record_container">
				<h3>연속 <span id="menurecord"></span>일째 계획 실천중</h3>
			</div>
		</div>

		<div id="dailyExc_content_container" class="row">
			<div id="dailyExc_content" class="col-md-6" style="overflow:scroll; height:400px;">

				<div class="exc_plan_title row">
					<span>(제목)운동 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div id="menudown">
				<%for(MemberMenuList mml:menulist){ %>
				<div class="exc_plan_list row">
				<input type="hidden" name="menuno" value="<%=mml.getMenuNo()%>">
					<span><%=mml.getMenuName() %></span><span>kcal</span><span>영양정보</span>
				</div>
				<%} %>
				</div>
				<div class="row">
					<div class="col-md-5"></div>
					<div id="complete_exc" class="btn col-md-2" onclick="fn_menudaily();">실천 완료</div>
					<div class="col-md-5"></div>
				</div>
			</div>
			<div id="dailyExc_list" class="col-md-6">
				<div class="exc_plan_title">
					<span>No</span><span>기록일</span>
				</div class="">
				<%for(DailyMenu dm:dmlist){ %>
				<div class="exc_list menuday">
					<span><%=num2 %></span><span><%=dm.getMenuDate()%></span>
				</div>
				<%num2++;} %>
				<div id="pageBar" class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6"><h5><%=pagebar2 %></h5></div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</div>
<%@ include file="/views/common/footer.jsp"%>
<script>
$(".excday").click(e=>{	
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date($(e.target).children().eq(1).text()).getDay()];

	$("#excdown").html("");
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/excdailylist",
		type:"get",
		data:{
			excday:dayOfWeek		
			},
		success:data=>{
	
			
			for(var i=0;i<data.length;i++){
				let div=$("<div>").attr("class","exc_plan_list row");
				console.log(div);
				let span=$("<span>")			
				$("#excdown").append(div.append(span.html(data[i].excName+" "+data[i].reps+" "+data[i].sets)));
				}
			}
		})
	})
	$(".menuday").click(e=>{	
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date($(e.target).children().eq(1).text()).getDay()];

	$("#menudown").html("");
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/menudailylist",
		type:"get",
		data:{
			menuday:dayOfWeek		
			},
		success:data=>{
			console.log(data);			
			for(var i=0;i<data.length;i++){				
				let div=$("<div>").attr("class","menu_plan_list row");
				let span=$("<span>")			
				$("#menudown").append(div.append(span.html(data[i].menuName+" "+data[i].amount)));
				}
			}
		})
	})
	const fn_excdaily=()=>{
			let excno="";
		$("input[name=excno]").each((v,i)=>{
				  excno +=","+$(i).val();			
		})
			let excnoArray=excno.split(",");

		 location.assign("<%=request.getContextPath()%>/daily/insertexcdaily?excArr="+excnoArray);
	}
	
	const fn_menudaily=()=>{
		let menuno="";
	$("input[name=menuno]").each((v,i)=>{
			  menuno +=","+$(i).val();			
	})
		let menunoArray=menuno.split(",");

	 location.assign("<%=request.getContextPath()%>/daily/insertmenudaily?menuArr="+menunoArray);
}
	
	$(function(){
		$("input[name=excdate]").each((i,v)=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/dailylogcheck",
			type:"get",
			data:{
				excdate:$("input[name=excdate]").eq(i).val()
				},
			success:data=>{
				if(data[0]==data[1]){
					$(".excday2").eq(i).css("background-color","green");
				}
			}
		})
	})
});
	
	$(function(){
		$("input[name=menudate]").each((i,v)=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/dailymenulogcheck",
			type:"get",
			data:{
				menudate:$("input[name=menudate]").eq(i).val()
				},
			success:data=>{
				if(data[0]==data[1]){
					$(".menuday2").eq(i).css("background-color","green");
				}
			}
		})
	})
});
	
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/dailyrecord",
			type:"get",
			dataType:"text",
			success:data=>{
				data=data.split(",");
				$("#excrecord").text(data[0].replace("[",""));
				$("#menurecord").text(data[1].replace("]",""));
				
			}		
	});
	
	
	
</script>