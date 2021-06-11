<%@page import="com.semi.member.daily.model.vo.DailyMenuList"%>
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
	List<DailyMenuList> menulist =(List<DailyMenuList>)request.getAttribute("list3");
	List<DailyMenu> dmlist =(List<DailyMenu>)request.getAttribute("list4");
	String pagebar = (String)request.getAttribute("pageBar");
	String pagebar2 = (String)request.getAttribute("pageBar2");
	String day=(String)request.getAttribute("day");

%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/02_dailylog.css">
</div>
<!--------------- 배너 ---------->
     <div id="banner_home" class="container-fluid">
    	<div class="row">
    		<div class="col-md-12">
    			<img src="<%=request.getContextPath()%>/Resource/img/banner_dailyLog.png" alt="" style="width:100%; height:auto; margin:0;">
    		</div>
    	</div>
    </div>
   <br>
   <br>
  <div class="container"> 
<div class="row">
	
	<div id="dailyExc_title" class="col-md-12">
		<h2>> 운동일지</h2>
	</div>
</div>


<div class="row">
	
	<div class="col-md-12">

		<div class="row">
			<div id="personal_record_container">
				<h3>연속 <span id="excrecord"></span>일째 계획 실천중</h3>
			</div>
		</div>

		<div id=dailyExc_content_container class="row">
			<div id="dailyExc_content" class="col-md-6" style="overflow:auto; overflow-x:hidden; height:498px;">
				<div class="exc_plan_title row" >
					<span>운동 목록</span>
				</div>
				<div id="excdown">
				<%for(MemberExcList mel :list){ %>
				<div class="exc_plan_list row excday">
					<input type="hidden" name="excno" value="<%=mel.getExcNo() %>">
					<input type="hidden" name="excid" value="<%=mel.getExcId() %>">	
					<span>운동이름: <%=mel.getExcName() %></span><span>reps: <%=mel.getReps() %></span><span>sets: <%=mel.getSets() %></span>
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
					<span class="categoryLine">No</span><span>기록일</span>
				</div>
				<%for(DailyExercise de:delist){ %>
				<div class="exc_list row excday2">
					<input type="hidden" name="excdate" value="<%=de.getExcDate()%>">
					<span class="categoryLine"><%=de.geteLogNo() %></span><span class="date categoryLine2"><%=de.getExcDate()%></span><span class="plancheck"><%=de.getExcPlanCheck()%></span>
				</div>
				<%} %>
			
				<div id="pageBar" class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6"><h5><%=pagebar %></h5></div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	
</div>


<div class="row">
	
	<div id="dailyExc_title" class="col-md-12">
		<h2>> 식단일지</h2>
	</div>
	
</div>


<div class="row">
	
	<div class="col-md-12">

		<div class="row">
			<div id="personal_record_container">
				<h3>연속 <span id="menurecord"></span>일째 계획 실천중</h3>
				<div class="col-md-2" style="font-size: 2rem" id="timecho">
					<select>
						<option value="아침" >아침</option>
						<option value="점심" >점심</option>
						<option value="저녁" >저녁</option>
					</select>
				</div>
			</div>
			
		</div>
		
		<div id="dailyExc_content_container" class="row">
			<div id="dailyExc_content" class="col-md-6" style="overflow:auto; overflow-x:hidden; height:498px;">

				<div class="exc_plan_title row">
					<span>식단 목록</span>
				</div>
				<input type="hidden" name="getday" value="<%=day%>">
				<div id="menudown">
				
				<%for(DailyMenuList dml:menulist){ %>
				<%int am=1;%>
				<div class="exc_plan_list row">
				<input type="hidden" name="menuno" value="<%=dml.getMenuNo()%>">
					<span><%=dml.getMenuName() %> <%=dml.getMenuDaytime() %></span><span class="menuData">kcal:<%=dml.getKcal()*am%>
					탄수화물:<%=dml.getCh()*am%> 단백질:<%=dml.getProt()*am%> 지방:<%=dml.getFat()*am%> </span>
					<input type="hidden" name="menudaytime" value="<%=dml.getMenuDaytime()%>">
				</div>
				<%} %>
				</div>
				<div class="row">
					<div class="col-md-5"></div>
					<div id="complete_menu" class="btn col-md-2" onclick="fn_menudaily();">실천 완료</div>
					<div class="col-md-5"></div>
				</div>
			</div>
			<div id="dailyExc_list" class="col-md-6">
				<div class="exc_plan_title">
					<span class="categoryLine">No</span><span>기록일</span>
				</div>
				<%for(DailyMenu dm:dmlist){ %>
				<div class="exc_list menuday2">
					<input type="hidden" name="menudate" value="<%=dm.getMenuDate()%>">
					<span class="categoryLine"><%=dm.getmLogNo() %></span><span class="date categoryLine2"><%=dm.getMenuDate()%></span><span class="plancheck"><%=dm.getMenuPlanCheck()%></span>
				</div>
				<%} %>
				<div id="pageBar" class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6"><h5><%=pagebar2 %></h5></div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	
</div>
<%@ include file="/views/common/footer.jsp"%>
<style>
.date { pointer-events: none; }
</style>
<script>
$(".plancheck").each((i,v)=>{
	console.log($(v).text())
	if($(v).text()=="Y"){
		$(v).parent().css("background-color","rgba(84, 166, 53, 0.7)");
	}else if($(v).text()=="C"){
		$(v).parent().css("background-color","rgba(223, 72, 51, 0.7)");
	}else{
		$(v).parent().css("background-color","rgba(230, 192, 80, 0.7)");
	}
	$(v).text("");
})
$(".excday2").click(e=>{	
	e.stopPropagation();
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date($(e.target).children().eq(2).text()).getDay()];
	var sysdate=new Date();
	var clickdate=new Date($(e.target).children().eq(2).text());
	sysdate=sysdate.getFullYear()+'-'+sysdate.getMonth()+'-'+sysdate.getDate();
	clickdate=clickdate.getFullYear()+'-'+clickdate.getMonth()+'-'+clickdate.getDate();
	if(sysdate!=clickdate){
		$("#complete_exc").css("display","none");
	}else{
		$("#complete_exc").css("display","block");
	}
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
				$("#excdown").append(div.append(span.html("운동이름:"+data[i].excName+"reps:"+data[i].reps+"sets:"+data[i].sets)));
				}
			}
		})
	})
	$(".menuday2").click(e=>{	
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date($(e.target).children().eq(2).text()).getDay()];
	console.log(dayOfWeek)
	var sysdate=new Date();
	var clickdate=new Date($(e.target).children().eq(2).text());
	sysdate=sysdate.getFullYear()+'-'+sysdate.getMonth()+'-'+sysdate.getDate();
	clickdate=clickdate.getFullYear()+'-'+clickdate.getMonth()+'-'+clickdate.getDate();
	if(sysdate!=clickdate){
		$("#complete_menu").css("display","none");
	}else{
		$("#complete_menu").css("display","block");
	}
	$("#menudown").html("");
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/menudailylist",
		type:"get",
		data:{
			menuday:dayOfWeek		
			},
		success:data=>{
			console.log(data)
			$("input[name=getday]").val(data[0].menuWeek);			
			for(var i=0;i<data.length;i++){		
				let am =1;
				let div=$("<div>").attr("class","exc_plan_list row");
				let span=$("<span>")			
				div.append($("<input>").attr({
					type:"hidden",
					name:"menuno",
					value:data[i].menuNo
				})
				)
				$("#menudown").append(div.append(span.html(data[i].menuName+" "+data[i].menuDaytime)));
				div.append($("<span>").attr("class","menuData").html("칼로리:"+data[i].kcal*am+"탄수화물:"+data[i].ch*am+"지방:"+data[i].fat*am+"단백질:"+data[i].prot*am));
				div.append($("<input>").attr({
					type:"hidden",
					name:"menudaytime",
					value:data[i].menuDaytime
				}))
				}morning();
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
	
<%--	$(function(){
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
				console.log(data);
				if(data[0]==data[1]){
					$(".menuday2").eq(i).css("background-color","green");
				}
			}
		})
	})
});--%>
	
	$.ajax({
		url:"<%=request.getContextPath()%>/ajax/dailyrecord",
			type:"get",
			dataType:"text",
			success:data=>{
				data=data.split(",");
				$("#excrecord").text(data[0].replace("[",""));
				$("#menurecord").text(data[1].replace("]",""));
				console.log(data);
			}		
	});
	
	const morning=()=>{
	$("input[name=menudaytime]").each((i,v)=>{
		if($(v).val()!="아침"){
			$("input[name=menudaytime]").eq(i).parent().css("display","none");
			}
		})
	};morning();
	

	$("#timecho>select").change(e=>{
		let time=$(e.target).val();
		$("input[name=menudaytime]").each((i,v)=>{
			if(time!=$("input[name=menudaytime]").eq(i).val()){
				$("input[name=menudaytime]").eq(i).parent().css("display","none");
			}else{
				$("input[name=menudaytime]").eq(i).parent().css("display","block");
			}
			
		})
	});
	


	
</script>