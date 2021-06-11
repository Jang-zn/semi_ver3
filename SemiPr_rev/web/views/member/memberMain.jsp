<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<%@ page import="java.util.Calendar" %>
<%
	Member minfo = (Member)request.getAttribute("memberinfo");
	String[] gal=(String[])request.getAttribute("galimg");
	String[] exclist=(String[])request.getAttribute("exclist");
	String[] menulist=(String[])request.getAttribute("menulist");
	
	// 오늘 날짜 생성
	Calendar today=Calendar.getInstance();

	int su=today.get(Calendar.DAY_OF_WEEK); //요일-숫자
	String week=""; //요일
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/02memberMain.css">
	
</div>
	<!--------------- 배너 ---------->
     <div id="banner_home" class="container-fluid">
    	<div class="row">
    		<div class="col-md-12">
    			<img src="<%=request.getContextPath()%>/Resource/img/banner_memberMain.png" alt="" style="width:100%; height:auto; margin:0;">
    		</div>
    	</div>
    </div>
    <br><br>
<!-- <div class="row">
	<div class="col-md-1"></div>
	<div id="member_rank" class="col-md-10"></div>
</div> -->
<div class="container">
<div class="row">	
	<div id="weekly_container">
		<div id="member_info" class="col-md-4">
			<div id="profile_area_content" class="col-md-6">
			<%if(minfo.getProfileImg()!=null) {%>
				<img src="<%=request.getContextPath()%>/upload/profile/<%=minfo.getProfileImg()%>">
			<%}else{ %>
				<img src="<%=request.getContextPath()%>/Resource/img/profile.png">
			<%} %>
			</div>
			<div id="member_info_area" class="col-md-6">
				<p class="profile01"><span class="memberName"><%=minfo.getNickname()%></span> 님과</p>
				<p class="profile01">ForMuscle이</p>
				<p class="profile01">함께한지 <%=minfo.getCha()%>일째</p>
				<p class="btn02" style="margin-left:1.5rem"><button onclick="location.assign('<%=request.getContextPath()%>/member/memberinfoupdate?memberid=<%=minfo.getMemberId()%>')">개인정보 수정</button></p>	
			</div>
		</div>
		
		<div id="weekly_check" class="col-md-8">
			<div id="weekly_check_title_main" class="row">
				<div class="col-md-10 title01" style="margin-right:4.8rem;">> 주간 달성 현황</div>
				<div class="col-md-2 btn01" onclick="location.assign('<%=request.getContextPath()%>/member/weeklyTrend')">상세보기</div>
			</div>
			<div id="weekly_check_daybyday_exc" class="row">
				<div class="text_plan col-md-4 title02" style="width:15rem; margin-top:1rem; text-align:right">운동 현황</div>
				<div class="day col-md-1 weeklyExcStatus">월</div>
				<div class="day col-md-1 weeklyExcStatus">화</div>
				<div class="day col-md-1 weeklyExcStatus">수</div>
				<div class="day col-md-1 weeklyExcStatus">목</div>
				<div class="day col-md-1 weeklyExcStatus">금</div>
				<div class="day col-md-1 weeklyExcStatus">토</div>
				<div class="day col-md-1 weeklyExcStatus">일</div>
			</div>
			<div id="weekly_check_daybyday_menu" class="row">
				<div class="text_plan col-md-4 title02" style="width:15rem; margin-top:1rem; text-align:right">식단 현황</div>
				<div class="day col-md-1 weeklyMenuStatus">월</div>
				<div class="day col-md-1 weeklyMenuStatus">화</div>
				<div class="day col-md-1 weeklyMenuStatus">수</div>
				<div class="day col-md-1 weeklyMenuStatus">목</div>
				<div class="day col-md-1 weeklyMenuStatus">금</div>
				<div class="day col-md-1 weeklyMenuStatus">토</div>
				<div class="day col-md-1 weeklyMenuStatus">일</div>
			</div>
		</div>
</div>
	</div><br><br>
<div class="row">
	<div id="monthly_container" class="col-md-12">
		<div id="monthly_check_title_main" class="row">
			<div class="col-md-7 title01">> 월간 달성 현황</div>
			<div class="col-md-1">
				<select id="trendSort" name="trendSort">
					<option value="운동">운동</option>
					<option value="식단">식단</option>
				</select>
			</div>
			<div class="col-md-3"></div>
			<div class="col-md-1">
				<div class="col-md-12 btn01" onclick="location.assign('<%=request.getContextPath()%>/member/monthlyTrend')">
					상세보기
				</div>
			</div>
		</div>
		
		
		<!-- 차트영역 -->
		<div id="monthly_check_content" class="row" >
			<div id="monthly_plan_trend" class="col-md-8" style="height:25rem;">
				<canvas id="line"></canvas>
			</div>
			<div id="monthly_plan_analysis" class="col-md-4" style="height:25rem;">
				<canvas id="pie"></canvas>
			</div>
		</div>
		<!-- 차트영역 -->
		
		
	</div>
</div>
<br><br>
<div class="row">
	<div id="noonbody_container_main" class="col-md-12">
		<div id="noonbody_title_main" class="row">
			<div class="col-md-11 title01">> 눈바디</div>
				<div class="col-md-1">
					<div class="btn01" onclick="location.assign('<%=request.getContextPath()%>/gallary/list')">
					상세보기
					</div>
				</div>
		</div>
	</div>
	<div id="noonbody_thumb_area" class="col-md-12">
		<%for(int i=0;i<gal.length;i++){
			if(gal[i]!=null){%>
				<div class="noonbody_thumb col-md-3"><img src="<%=request.getContextPath()%>/upload/gallary/<%=gal[i]%>"></div>
			<%}else{ %>
				<div class="noonbody_thumb col-md-3"><img src="<%=request.getContextPath()%>/Resource/img/profile.png"></div>
			<%} %>
		<%} %>
	</div>
</div>
<br><br><br>
<div class="row">	
	<div id="daily_log_container_main">
		<div id="daily_log_exc_area" class="col-md-6">
			<div id="daily_log_exc_title_main" class="row">
				<div class="col-md-10 title01">> 운동일지</div>
				<div class="col-md-2">
					<div class="col-md-12 btn01" onclick="location.assign('<%=request.getContextPath()%>/member/dailyLog')">
						상세보기
					</div>
				</div>
			</div>
			<div id="daily_log_exc_list" class="row">			
			<%for(int i=0;i<menulist.length;i++){ %>
				<%if(menulist[i]!=null){%>
					<p class="date">- <%=exclist[i]%></p>	
				<%}else{%>
					<%if(i==0){ %>
						<p class="date">- 계획을 등록하고 실천해보세요!</p>
					<%}else{ %>
						<p class="date">-C</p>
					<%} %>
				<%} %>
			<%} %>
			</div>
		</div>
		<div id="daily_log_menu_area" class="col-md-6">
			<div id="daily_log_menu_title_main" class="row">
				<div class="col-md-10 title01">> 식단일지</div>
				<div class="col-md-2">
					<div class="col-md-12  btn01" onclick="location.assign('<%=request.getContextPath()%>/member/dailyLog')">
						상세보기
					</div>
				</div>
			</div>
			<div id="daily_log_menu_list" class="row">
			<%for(int i=0;i<menulist.length;i++){ %>
				<%if(menulist[i]!=null){%>
					<p class="date">- <%=menulist[i]%></p>	
				<%}else{%>
					<%if(i==0){ %>
						<p class="date">- 계획을 등록하고 실천해보세요!</p>
					<%}else{ %>
						<p class="date">-C</p>
					<%} %>
				<%} %>
			<%} %>
			</div>
		</div>
	</div>
</div>

<script>
let pieChart;

const Pie=()=>{
	let ctx = $('#pie').get(0).getContext("2d");
	let Data = {
		    //ajax 처리
	    labels: ["실천","미실천","계획없음"],
	    datasets: [{
	        data: [0, 0, 0],
	        backgroundColor: ['rgba(84, 166, 53, 0.5)','rgba(223, 72, 51, 0.5)','rgba(230, 192, 80, 0.5)'],
	    }]
	};	
	let Config ={
			type: 'doughnut',
			data:Data,
			options: {
		        layout:{padding:0},
		        maintainAspectRatio: false,
		        cutoutPercentage:10,
		        rotation: 270,
		        circumference: 180
		    }
	};
	
	 pieChart = new Chart(ctx,Config);
};



let lineChart;
const Line=()=>{
	let ctx = $('#line').get(0).getContext("2d");
	let Data ={
		data: {
			labels: [],
			datasets: []
		}
	};
	
	let Config={
	    type: 'line',
	    data:Data,
	    options:{
	    	plugins: {
	            legend: {
	                display: false,
	            },
	        },
	    	maintainAspectRatio : false,
	    	scales:{
	    		y: {
	                suggestedMax: 1.3,
	                display:false
	            },
	            
	    	},
	        
		}
	};
	
	lineChart = new Chart(ctx,Config);
};

const reloadPie=(chart, y, n, l)=>{
	Data = {data: [y, n, l-y-n]};
	chart.data.datasets.forEach((dataset) => {
        dataset.data.pop();
        dataset.data.pop();
        dataset.data.pop();
        dataset.data.push(Data.data[0]);
        dataset.data.push(Data.data[1]);
        dataset.data.push(Data.data[2]);
    });
	chart.update();	//차트 업데이트
}	



$("#trendSort").change(e=>{
	let today = new Date();
	let sysdate=null;
	let mm = today.getMonth()+1;
	let yy = today.getFullYear();
	let dd = today.getDate();
	if(mm<10){
		sysdate=yy+"/0"+mm+"/";
	}else{
		sysdate=yy+"/"+mm+"/";
	}
	if(dd<10){
		sysdate+="0"+dd;
	}else{
		sysdate+=dd;
	}
	let length=31;
	
	switch($("#trendSort").val()){
		case "운동":  
			$.ajax({
				url:"<%=request.getContextPath()%>/member/monthlyChart?length="+length+"&sysdate="+sysdate+"&key=monthlyExc",
				dataType:"json",
				success:data=>{
					//labels
					let labels=[];
					let countIndex=0;
					data.forEach(function(el){
						if(el.check!=null){
							labels[countIndex++]=el.date;
						}else{
							labels[countIndex++]='0/0';
						}
					});
					
					//YN check
					let planYN=[];
					let y=0;
					let n=0;
					countIndex=0;
					data.forEach(function(el){
						if(el.check!=null){
							planYN[countIndex++]=el.check=='Y'?1:0;
							el.check=='Y'?y++:n++;
						}else{
							planYN[countIndex++]=0;
						}
					});
					reloadPie(pieChart,y,n,length);
					
					
					lineChart.options={
						responsive: true,
						plugins: {
							legend: {
								display: false,
							},
							title: {
			            		display: true,
			            		text: '운동 실천현황',
			            		fontSize:20
			    			}
						},    
						maintainAspectRatio : false,
						scales:{
						   	y: {
						   	suggestedMax: 1.2,
						   	display:false
						    },
					},
				},
		        lineChart.data={
					datasets:[{
						label: '운동',
				       	borderColor : '#5f9ea0',
				       	backgroundColor:'rgba(95, 158, 160, 0.5)',
				        borderWidth:2,
				        fill:true,
					}]
				}
					
				lineChart.data.labels=labels;
				lineChart.data.datasets[0].data=planYN;
				lineChart.update();
				
			}
				
				
		});
			break;
			
			
			case "식단":  
				$.ajax({
				url:"<%=request.getContextPath()%>/member/monthlyChart?length="+length+"&sysdate="+sysdate+"&key=monthlyMenu",
				dataType:"json",
				success:data=>{
					//labels
					let labels=[];
					let countIndex=0;
					data.forEach(function(el){
						if(el.check!=null){
							labels[countIndex++]=el.date;
						}else{
							labels[countIndex++]='0/0';
						}
					});
					//YN check
					let planYN=[];
					let y=0;
					let n=0;
					countIndex=0;
					data.forEach(function(el){
						if(el.check!=null){
							planYN[countIndex++]=el.check=='Y'?1:0;
							el.check=='Y'?y++:n++;
						}else{
							planYN[countIndex++]=0;
						}
					});
					reloadPie(pieChart,y,n,length);
					
					
					lineChart.options={
						plugins: {
							legend: {
								display: false,
							},
							title: {
			            		display: true,
			            		text: '식단 실천현황',
			    			}
						},    
						maintainAspectRatio : false,
						scales:{
						   	y: {
						   	suggestedMax: 1.2,
						   	display:false
						    },
						},
					}
					length>31?
						lineChart.data={
							datasets:[{
								label: '식단',
						          borderColor : '#da7316',
					          backgroundColor:'rgba(218, 115, 22, 0.5)',
						          borderWidth:2,
							          fill:true,
						          pointRadius:2
							}]
						}
			        :lineChart.data={
							datasets:[{
								label: '식단',
						           borderColor : '#da7316',
						           backgroundColor:'rgba(218, 115, 22, 0.5)',
						           borderWidth:2,
						           fill:true,
							}]
						}

					lineChart.data.labels=labels;
					lineChart.data.datasets[0].data=planYN;
					lineChart.update();
				}
			});
			break;
	}
});

window.onload=Pie(0,0,1);
window.onload=Line();
window.onload=$("#trendSort").trigger("change");

$(".date").each((i,v)=>{
	if($(".date").eq(i).text().indexOf("Y")>0){
		var text=$(".date").eq(i).text();
		$(".date").eq(i).text(text.replace("Y",""));	
		$(".date").eq(i).css("background-color","rgba(84, 166, 53, 0.7)");
		
	}else if($(".date").eq(i).text().indexOf("N")>0){
		var text=$(".date").eq(i).text();
		$(".date").eq(i).text(text.replace("N",""));
		$(".date").eq(i).css("background-color","rgba(223, 72, 51, 0.7)");
		
	}else{
		var text=$(".date").eq(i).text();
		$(".date").eq(i).text(text.replace("C",""));
		$(".date").eq(i).css("background-color","rgba(230, 192, 80, 0.7)");
		
	}
});


/* 주간 달성 현황 색상 */
	$("div.weeklyExcStatus").each(function(){
		var weekNum=0;
		const weekCheck=$(this).html(); //어느 요일?
		 switch(weekCheck){
			case '월': weekNum=1; break;
			case '화': weekNum=2; break;
			case '수': weekNum=3; break;
			case '목': weekNum=4; break;
			case '금': weekNum=5; break;
			case '토': weekNum=6; break;
			case '일': weekNum=7; break;
		}	
		if( weekNum < <%=su%>){ //오늘 포함 이전일 DB값에 따라 색상 변함
			
			//해당 요일 메뉴 계획 달성 여부 체크
			//요일을 service로 보내야됨
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/weeklyExcCheck",
				type:"post",
				data:{"weekCheck":weekCheck},
				dataType:"json",
				success:data=>{//해당 요일 달성 여부를 data로 받아옴
					switch(data["weekCheck"]){
					case 'Y': $(this).css('background-color','#54a635'); break;//달성했을 경우 green					
					case 'N': $(this).css('background-color','#df4833'); break; //달성하지 못했을 경우 red
					default : $(this).css('background-color','#e6c050'); break;
					}
					
				},error : (request, status, error)=>{
					console.log(request);
					console.log(status);
					console.log(error);
					console.log("--------------------");
					//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 출력용
				}
			});			
			
		}else{ //이후라면 -> default 색상
			$(this).css('background-color','gray');
		}
		
	});	

	
	$("div.weeklyMenuStatus").each(function(){
		var weekNum=0;
		const weekCheck=$(this).html(); //어느 요일?
		 switch(weekCheck){
			case '월': weekNum=1; break;
			case '화': weekNum=2; break;
			case '수': weekNum=3; break;
			case '목': weekNum=4; break;
			case '금': weekNum=5; break;
			case '토': weekNum=6; break;
			case '일': weekNum=7; break;
		}	
		if( weekNum < <%=su%>){ //오늘 포함 이전일 DB값에 따라 색상 변함
			
			//해당 요일 메뉴 계획 달성 여부 체크
			//요일을 service로 보내야됨
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/weeklyMenuCheck",
				type:"post",
				data:{"weekCheck":weekCheck},
				dataType:"json",
				success:data=>{//해당 요일 달성 여부를 data로 받아옴
					switch(data["weekCheck"]){
					case 'Y': $(this).css('background-color','#54a635'); break;//달성했을 경우 green					
					case 'N': $(this).css('background-color','#df4833'); break; //달성하지 못했을 경우 red
					default : $(this).css('background-color','#e6c050'); break;
					}
					
				},error : (request, status, error)=>{
					console.log(request);
					console.log(status);
					console.log(error);
					console.log("--------------------");
					//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 출력용
				}
			});			
			
		}else{ //이후라면 -> default 색상
			$(this).css('background-color','gray');
		}
		
	});	
	
</script>
<%@ include file="/../views/common/footer.jsp"%>