<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<%
	Member minfo = (Member)request.getAttribute("memberinfo");
	String[] gal=(String[])request.getAttribute("galimg");
	String[] exclist=(String[])request.getAttribute("exclist");
	String[] menulist=(String[])request.getAttribute("menulist");
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberMain.css">
<div class="row">
	<div class="col-md-1"></div>
	<div id="member_rank" class="col-md-10"></div>
</div>
<div class="row">
	
	<div id="weekly_container" class="col-md-12">
		<div id="member_info" class="col-md-4">
			<div id="profile_area_content" class="col-md-6">
				<img src="<%=request.getContextPath()%>/<%=minfo.getProfileImg()%>">
			</div>
			<div id="member_info_area" class="col-md-6">
				<p><%=minfo.getNickname()%> 환영합니다.</p>
				<p><%=minfo.getCha()%>일쨰 formnuscle과 함께하고있습니다.</p>
				<p><button onclick="location.assign('<%=request.getContextPath()%>/member/memberinfoupdate?memberid=<%=minfo.getMemberId()%>')">개인정보 수정</button></p>
				<p></p>
				<p></p>
			</div>
		</div>
		<div id="weekly_check" class="col-md-8">
			<div id="weekly_check_title_main" class="row">
				<div class="col-md-10">주간 달성 현황</div>
				<div class="col-md-2">상세보기(버튼)</div>
			</div>
			<div id="weekly_check_daybyday_exc" class="row">
				<div class="text_plan col-md-4">운동 현황</div>
				<div class="day col-md-1">일</div>
				<div class="day col-md-1">월</div>
				<div class="day col-md-1">화</div>
				<div class="day col-md-1">수</div>
				<div class="day col-md-1">목</div>
				<div class="day col-md-1">금</div>
				<div class="day col-md-1">토</div>
				<div class="col-md-1"></div>
			</div>
			<div id="weekly_check_daybyday_menu" class="row">
				<div class="text_plan col-md-4">식단 현황</div>
				<div class="day col-md-1">일</div>
				<div class="day col-md-1">월</div>
				<div class="day col-md-1">화</div>
				<div class="day col-md-1">수</div>
				<div class="day col-md-1">목</div>
				<div class="day col-md-1">금</div>
				<div class="day col-md-1">토</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	
	<div id="monthly_container" class="col-md-12">
		<div id="monthly_check_title_main" class="row">
			<div class="col-md-4">월간 달성 현황</div>
			<div class="col-md-2">
				<select id="trendSort" name="trendSort">
					<option value="운동">운동</option>
					<option value="식단">식단</option>
				</select>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-2">
				<div class="col-md-12" onclick="location.assign('<%=request.getContextPath()%>/member/monthlyTrend')">
					상세보기(버튼)
				</div>
			</div>
		</div>
		
		
		<!-- 차트영역 -->
		<div id="monthly_check_content" class="row">
			<div id="monthly_plan_trend" class="col-md-8">
				<canvas id="line"></canvas>
			</div>
			<div id="monthly_plan_analysis" class="col-md-4">
				<canvas id="pie"></canvas>
			</div>
		</div>
		<!-- 차트영역 -->
		
		
	</div>
</div>
<div class="row">
	
	<div id="noonbody_container_main" class="col-md-12">
		<div id="noonbody_title_main" class="col-md-12">
			<div class="col-md-10">눈바디</div>
			<div class="col-md-2">
				<div class="col-md-12" onclick="location.assign('<%=request.getContextPath()%>/gallary/list')">
				상세보기(버튼)
				</div>
			</div>
		</div>
		<div id="noonbody_thumb_area" class="col-md-12">
			<div class="noonbody_thumb" class="col-md-3"><img src="<%=request.getContextPath()%>/<%=gal[0]%>"></div>
			<div class="noonbody_thumb" class="col-md-3"><img src="<%=request.getContextPath()%>/<%=gal[1]%>"></div>
			<div class="noonbody_thumb" class="col-md-3"><img src="<%=request.getContextPath()%>/<%=gal[2]%>"></div>
			<div class="noonbody_thumb" class="col-md-3"><img src="<%=request.getContextPath()%>/<%=gal[3]%>"></div>
		</div>
	</div>
</div>
<div class="row">
	
	<div id="daily_log_container_main" class="col-md-12">
		<div id="daily_log_exc_area" class="col-md-6">
			<div id="daily_log_exc_title_main" class="row">
				<div class="col-md-9">운동일지</div>
				<div class="col-md-3">
					<div class="col-md-12" onclick="location.assign('<%=request.getContextPath()%>/member/dailyLog')">
						상세보기(버)
					</div>
				</div>
			</div>
			<div id="daily_log_exc_list" class="row">
			
			<%for(int i=0;i<exclist.length;i++){ %>
				<p class="date"><%=exclist[i]%></p>
				<%} %>
	
			</div>
		</div>
		<div id="daily_log_menu_area" class="col-md-6">
			<div id="daily_log_menu_title_main" class="row">
				<div class="col-md-9">식단일지</div>
				<div class="col-md-3">
					<div class="col-md-12" onclick="location.assign('<%=request.getContextPath()%>/member/dailyLog')">
						상세보기(버)
					</div>
				</div>
			</div>
			<div id="daily_log_menu_list" class="row">
			<%for(int i=0;i<menulist.length;i++){ %>
				<p class="date"><%=menulist[i]%></p>
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
	    labels: ["실천","미실천","남은 일자"],
	    datasets: [{
	        data: [0, 0, 0],
	        backgroundColor: ["rgba(0,150,255,0.7)","rgba(255,0,0,0.6)", "#AAA"],
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
	            }
	        },
	    	maintainAspectRatio : false,
	    	scales:{
	    		y: {
	                suggestedMax: 1.3,
	                display:false
	            },
	            
	    	}
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
						}
					});
					reloadPie(pieChart,y,n,length);
					console.log(pieChart);
					
					
					lineChart.options={
						responsive: true,
						plugins: {
							legend: {
								display: false,
							},
							title: {
			            		display: true,
			            		text: '운동 실천현황'
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
				       	borderColor : 'blue',
				       	backgroundColor:'rgba(0,0,255,0.3)',
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
			            		text: '식단 실천현황'
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
						          borderColor : 'green',
					          backgroundColor:'rgba(0,255,0,0.3)',
						          borderWidth:2,
							          fill:true,
						          pointRadius:2
							}]
						}
			        :lineChart.data={
							datasets:[{
								label: '식단',
						           borderColor : 'green',
						           backgroundColor:'rgba(0,255,0,0.3)',
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
	$(".date").eq(i).css("background-color","green");
}else{
	var text=$(".date").eq(i).text();
	$(".date").eq(i).text(text.replace("N",""));	
}
	
})



</script>
<%@ include file="/../views/common/footer.jsp"%>