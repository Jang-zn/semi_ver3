<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<%
	Member m = (Member)session.getAttribute("logged");
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/monthlyTrend.css">



<div id="container_progress_trend" class="row">
	<div class="col-md-12">
	<br>
		
	<div class="row">
        <div class="col-md-2 title00"><a href="<%=request.getContextPath()%>/member/weeklyTrend" class="btn1">주간 현황</a></div>
        <div class="col-md-2 title00"><a href="<%=request.getContextPath()%>/member/monthlyTrend" class="btn1">월간 현황</a></div>
    </div>
	<br>
	<div class="row">
		<div id="container_content_progress_trend" class="col-md-12">
			<div id="PracticeRate_img" class="col-md-2">
				<%if(m.getProfileImg()!=null){ %>
					<img src="<%=request.getContextPath()%>/upload/profile/<%=m.getProfileImg()%>">
				<%} else{%>
					<img src="<%=request.getContextPath()%>/Resource/img/profile.png">
					
				<%}%>
			</div>


			<!-- Trend Area -->
			<div id="Practice_trend" class="col-md-8">
				<div class="col-md-12">
					<canvas id="lineChart"></canvas>
				</div>
			</div>
			
			
			<!-- Sort select -->
			<div id="select_sort" class="col-md-2">
				<div class="col-md-12">
					<select id="dataType_select" style="width:100%">
						<option name="dataType" value="monthlyExc">운동 실천현황</option>
						<option name="dataType" value="monthlyMenu">식단 실천현황</option>
						<option name="dataType" value="stackReps">누적 운동량</option>
						<option name="dataType" value="stackKcals">누적 섭취량</option>
					</select>
				</div>
				<br>
				<div class="col-md-12">
					<select id="dataPeriod" style="width:100%">
						<option name="term" value="1m">1개월 </option>
						<option name="term" value="3m"> 3개월 </option> 
						<option name="term" value="6m"> 6개월 </option> 
						<option name="term" value="12m"> 1년 </option>
					</select>
				</div>
				<div id="read_trend" class="col-md-12" name="read_trend" onclick="chartCall();">조회하기</div>
			</div>
		</div>
	</div>
	
	
	<!-- 운동 실천 현황 doughnut pie -->
	<div class="row">
		<div id="statistics_container" class="col-md-12">
			<div id="excMonth" class="row"></div>
			<div id="data_container" class="row">
				<div id="" class="col-md-6 pieChart">
					<div class="row cContainer">
						<canvas id="chart8"></canvas>
					</div>
				</div>
				<div id="" class="col-md-6 rank">
					<div class="row">
						<div class="col-md-8 cContainer"><canvas id="chart10" ></canvas></div>
						<div class="col-md-4"></div>		
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 식단 실천 현황 doughnut pie -->
	<div class="row">
		<div id="statistics_container" class="col-md-12">
			<div id="menuMonth" class="row"></div>
			<div id="data_container" class="row">
				<div id="" class="col-md-6 pieChart">
					<div class="row cContainer">
						<canvas id="chart9" ></canvas>
					</div>
				</div>
				<div id="" class="col-md-6 rank">
					<div class="row">
						<div class="col-md-8 cContainer">
							<canvas id="chart11" ></canvas>
						</div>
						<div class="col-md-4"></div>
					</div>
				</div>
			</div>
		</div>
	</div>







		<div class="row cheight">

			<div class="col-md-12">

				<!-- Calendar Area -->


				<div class="calendar">
					<div class="header">
						<div class="year-month"></div>
						<div class="nav">
							<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
							<button class="nav-btn go-today" onclick="goToday()">Today</button>
							<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
						</div>
					</div>
					<div class="main">
						<div class="days col-md-12 row7">
							<div class="day col-md-1">일</div>
							<div class="day col-md-1">월</div>
							<div class="day col-md-1">화</div>
							<div class="day col-md-1">수</div>
							<div class="day col-md-1">목</div>
							<div class="day col-md-1">금</div>
							<div class="day col-md-1">토</div>
						</div>
						<div class="dates col-md-12 row7"></div>
					</div>
				</div>


				<!-- Calendar Area -->
			</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/calendar.css">










<script>
//Piechart(10, 11) 작성 : 미실천 분류
const pieE = $("#chart10");
const pieChartE = new Chart(pieE, {
	type:'pie',
	data:{
		labels:["게으름","다른 일정","피치못할사정","기타"],
		datasets: [{
		    data: [0,0,0,0],
		    backgroundColor: ["rgba(255,0,0,0.7)","rgba(0,255,0,0.7)", "rgba(0,0,255,0.7)","rgba(255,255,0,0.7)"],
		}]
	},
	options: {
    	layout:{padding:0},
    	maintainAspectRatio: false,
    	plugins: {
			legend: {
				position:'right'
			},
			title: {
        		display: true,
        		text: '미실천 사유'
			}
    	},
	}
})

const pieM = $("#chart11");
const pieChartM = new Chart(pieM, {
	type:'pie',
	data:{
		labels:["게으름","회식","야식","기타"],
		datasets: [{
		    data: [0,0,0,0],
		    backgroundColor: ["rgba(255,0,0,0.7)","rgba(0,255,0,0.7)", "rgba(0,0,255,0.7)","rgba(255,255,0,0.7)"],
		}]
	},
	options: {
    	layout:{padding:0},
    	maintainAspectRatio: false,
    	plugins: {
			legend: {
				position:'right'
			},
			title: {
        		display: true,
        		text: '미실천 사유'
			}
    	},
	}	
})


const pieCall=()=>{
let list = $("span.thism");
let yymm01=null;
if(viewMonth<10){
	yymm01=viewYear+"/0"+(viewMonth+1)+"/01"
}else{
	yymm01=viewYear+"/"+(viewMonth+1)+"/01"
}
$.ajax({
	url:"<%=request.getContextPath()%>/member/monthlyTrend/piecall?length="+list.length+"&yymm01="+yymm01,
	dataType:"json",
	success:data=>{
		console.log(data);
		let dataE = [0,0,0,0];
		let dataM = [0,0,0,0];
		data[0].forEach(function(ep){
			if(ep!=null&&ep.check=='N'){
				dataE[ep.reason]+=1
			}
		});
		data[1].forEach(function(mp){
			if(mp!=null&&mp.check=='N'){
				dataM[mp.reason]+=1
			}
		});
		
		pieChartE.data.datasets[0].data=dataE;
		pieChartE.update();
		
		pieChartM.data.datasets[0].data=dataM;
		pieChartM.update();

	}
});
}




const callPlan=()=>{
	let list = $("div.thism");
	let yymm01=null;
	if(viewMonth<10){
		yymm01=viewYear+"/0"+(viewMonth+1)+"/01"
	}else{
		yymm01=viewYear+"/"+(viewMonth+1)+"/01"
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/member/monthlyTrend/plancall?length="+list.length+"&yymm01="+yymm01,
		dataType:"json",
		success:data=>{
			let ey=0;
			let en=0;
			let my=0;
			let=mn=0;
			for(let i=0;i<list.length;i++){
				if(data[0][i]!=null && data[0][i].date==$($("span.thism")[i]).text() && data[0][i].count>0){
					$($(".eCheck.thism")[i]).text("운동계획");
					if(data[0][i].check=="Y"){
						$($(".eCheck.thism")[i]).attr("style","background-color:rgba(0,150,255,0.7); color:white;");
						ey++;
					}else if(data[0][i].check=="N"){
						$($(".eCheck.thism")[i]).attr("style","background-color:rgba(255,0,0,0.6); color:white;").addClass("eReason");
						en++
					}else{
						$($(".eCheck.thism")[i]).attr("style","background-color:rgba(204,204,204,0.8); color:white;");
					}
				}
				if(data[1][i]!=null && data[1][i].date==$($("span.thism")[i]).text() && data[1][i].count>0){
					$($(".mCheck.thism")[i]).text("식단계획");
					if(data[1][i].check=="Y"){
						$($(".mCheck.thism")[i]).attr("style","background-color:rgba(0,150,255,0.7); color:white;");
						my++;
					}else if(data[1][i].check=="N"){
						$($(".mCheck.thism")[i]).attr("style","background-color:rgba(255,0,0,0.6); color:white;").addClass("mReason");
						mn++;
					}else{
						$($(".mCheck.thism")[i]).attr("style","background-color:rgba(204,204,204,0.8); color:white;");
						
					}
				}
			}
			try{
				excPie(ey,en, list.length);
				menuPie(my,mn, list.length);
			}catch{
				reloadChart(eChart, ey, en, list.length);
				reloadChart(mChart, my, mn, list.length);
			}
			pieCall();
		}		
	});
}




const excPie=(y, n, l)=>{
	let ctx = $('#chart8').get(0).getContext("2d");
	eData = {
		    //ajax 처리
	    labels: ["실천","미실천","남은 일자"],
	
	    datasets: [{
	        data: [y, n, l-y-n],
	        backgroundColor: ["rgba(0,150,255,0.7)","rgba(255,0,0,0.6)", "#AAA"],
	    }]
	};
	
	eConfig ={
			type: 'doughnut',
			data:eData,
			options: {
		        layout:{padding:0},
		        maintainAspectRatio: false,
		        cutoutPercentage:10,
		        rotation: 270,
		        circumference: 180
		    }
	}
	 eChart = new Chart(ctx,eConfig);
};

const menuPie=(y, n, l)=>{
	mData = {
			  //ajax 처리
		labels: ["실천","미실천","남은 일자"],
		datasets: [{
		    data: [y, n, l-y-n],
		    backgroundColor: ["rgba(0,150,255,0.7)","rgba(255,0,0,0.6)", "#AAA"],
		}]
	};
	mConfig ={
			type: 'doughnut',
			data:mData,
			options: {
		        layout:{padding:0},
		        maintainAspectRatio: false,
		        cutoutPercentage:10,
		        rotation: 270,
		        circumference: 180
		    }
	}
	let ctx = $('#chart9').get(0).getContext("2d");
	mChart = new Chart(ctx, mConfig);
};


const reloadChart=(chart, y, n, l)=>{
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




	
	


//Linechart 작성 / 업데이트


//line chart
const line = $("#lineChart");
const lineChart = new Chart(line, {
    type: 'line',
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
	},
    data: {
        labels: [       
        ],
        datasets: [
            {
            },
        ]},
});





const chartCall=()=>{
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
	let length;
	switch($("#dataPeriod").val()){
		case "1m": length=31; break;
		case "3m": length=93; break;
		case "6m": length=186; break;
		case "12m": length=365; break;
	}
	
	switch($("#dataType_select").val()){
		case "monthlyExc":  
			$.ajax({
				url:"<%=request.getContextPath()%>/member/monthlyChart?length="+length+"&sysdate="+sysdate+"&key=monthlyExc",
				dataType:"json",
				success:data=>{
					//labels
					let labels=[];
					let countIndex=0;
					data.forEach(function(el){
						if(el!=null&&el.check!=null){
							labels[countIndex++]=el.date;
						}
					});
					
					//YN check
					let planYN=[];
					countIndex=0;
					data.forEach(function(el){
						if(el.check!=null){
							planYN[countIndex++]=el.check=='Y'?1:0;
						}
					});
					
					
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
					}
					,
			        length>31?
			        	lineChart.data={
							datasets:[{
								label: '운동',
						        borderColor : 'blue',
						        backgroundColor:'rgba(0,0,255,0.3)',
						        borderWidth:2,
						        fill:true,
						        pointRadius:2
							}]
						}
			        :	lineChart.data={
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
			
			
		case "monthlyMenu":  
			$.ajax({
				url:"<%=request.getContextPath()%>/member/monthlyChart?length="+length+"&sysdate="+sysdate+"&key=monthlyMenu",
				dataType:"json",
				success:data=>{
					//labels
					let labels=[];
					let countIndex=0;
					if(el!=null){
						data.forEach(function(el){
							if(el.check!=null){
								labels[countIndex++]=el.date;
							}
						});
						//YN check
						let planYN=[];
						countIndex=0;
						data.forEach(function(el){
							if(el.check!=null){
								planYN[countIndex++]=el.check=='Y'?1:0;
							}
						});
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
					}else{
						$("#Practice_trend").html("<div class='lineEmpty col-md-12'>계획을 세우고 실천해보세요! 결과를 그래프로 확인해 볼 수 있습니다</div>");
					}
				}
			});
			break;
			
			
		case "stackReps":
			$.ajax({
				url:"<%=request.getContextPath()%>/member/monthlyChart?length="+length+"&sysdate="+sysdate+"&key=stackReps",
				dataType:"json",
				success:data=>{
					
					//labels
					let labels=[];
					let countIndex=0;
					data.forEach(function(el){
						labels[countIndex++]=el.date;
					});
					//YN check
					let planYN=[];
					countIndex=0;
					data.forEach(function(el){
						if(el.check==null){
							planYN[countIndex++]=null;
						}else{
							planYN[countIndex++]=el.check=='Y'?1:0;
						}
					});
					
					
					let stackExcW=[];
					let stack=0;
					for(let i=0;i<planYN.length;i++){
						if(planYN[i]!=0&&planYN[i]!=null){
							stack+=data[i].repsetwei;
							stackExcW[i]=stack;
						}else{
							stackExcW[i]=stack;
						}
						
					}
					
					
					lineChart.options={
						plugins: {
							legend: {
								display: false,
							},
							title: {
			            		display: true,
			            		text: '누적 운동량'
			    			}
						},    
						maintainAspectRatio : false,
					}
					length>31?
							lineChart.data={
							datasets:[{
								label: '운동무게(rep*set*weight)',
					            borderColor : 'blue',
					            backgroundColor:'rgba(0,0,255,0.3)',
					            borderWidth:2,
					            pointBorderWidth:1,
							    pointRadius:2
								}]
							}
				        :	lineChart.data={
								datasets:[{
									label: '운동무게(rep*set*weight)',
						            borderColor : 'blue',
						            backgroundColor:'rgba(0,0,255,0.3)',
						            borderWidth:2,
						            pointBorderWidth:1,
						            
								}]
							}
					
					lineChart.data.labels=labels;
					lineChart.data.datasets[0].data=stackExcW;
					lineChart.update();
				}
			});
			break;
			
			
		case "stackKcals":  
			$.ajax({
				url:"<%=request.getContextPath()%>/member/monthlyChart?length="+length+"&sysdate="+sysdate+"&key=stackKcals",
				dataType:"json",
				success:data=>{
					console.log(data);
					//labels
					let labels=[];
					let countIndex=0;
					data.forEach(function(el){
						labels[countIndex++]=el.date;
					});
					//YN check
					let planYN=[];
					countIndex=0;
					data.forEach(function(el){
						if(el.check==null){
							planYN[countIndex++]=null;
						}else{
							planYN[countIndex++]=el.check=='Y'?1:0;
						}
					});
					let stackKcal=[];
					let stack=0;
					for(let i=0;i<planYN.length;i++){
						if(planYN[i]!=0&&planYN[i]!=null){
							stack+=data[i].kcal;
							stackKcal[i]=stack;
						}else{
							stackKcal[i]=stack;
						}
						
					}
					let stackCH=[];
					stack=0;
					for(let i=0;i<planYN.length;i++){
						if(planYN[i]!=0&&planYN[i]!=null){
							stack+=data[i].ch;
							stackCH[i]=stack;
						}else{
							stackCH[i]=stack;
						}
						
					}
					let stackProt=[];
					stack=0;
					for(let i=0;i<planYN.length;i++){
						if(planYN[i]!=0&&planYN[i]!=null){
							stack+=data[i].prot;
							stackProt[i]=stack;
						}else{
							stackProt[i]=stack;
						}
						
					}
					let stackFat=[];
					stack=0;
					for(let i=0;i<planYN.length;i++){
						if(planYN[i]!=0&&planYN[i]!=null){
							stack+=data[i].fat;
							stackFat[i]=stack;
						}else{
							stackFat[i]=stack;
						}
						
					}

					lineChart.options={
						plugins: {
							title: {
			            		display: true,
			            		text: '누적 섭취량'
			    			}
						},    
						maintainAspectRatio : false,
					}
					length>31?
							lineChart.data={
							datasets:[{
								label: 'Kcal',
					            borderColor : 'rgba(0,255,0,1)',
					            backgroundColor:'rgba(0,255,0,0.3)',
					            borderWidth:2,
					            pointBorderWidth:1,
					            pointRadius:1
					            
							},{
								label: '탄수화물',
					            borderColor : 'rgba(102,102,153,1)',
					            backgroundColor:'rgba(102,102,153,0.3)',
					            borderWidth:2,
					            pointBorderWidth:1,
					            pointRadius:1
					            
							},{
								label: '단백질',
					            borderColor : 'rgba(255,51,51,1)',
					            backgroundColor:'rgba(255,51,51,0.3)',
					            borderWidth:2,
					            pointBorderWidth:1,
					            pointRadius:1
					            
							},{
								label: '지방',
					            borderColor : 'rgba(204,153,51,1)',
					            backgroundColor:'rgba(204,153,51,0.3)',
					            borderWidth:2,
					            pointBorderWidth:1,
					            pointRadius:1
							}]
						}
				        :lineChart.data={
								datasets:[{
									label: 'Kcal',
						            borderColor : 'rgba(0,255,0,1)',
						            backgroundColor:'rgba(0,255,0,0.3)',
						            borderWidth:2,
						            pointBorderWidth:1,
								},{
									label: '탄수화물',
						            borderColor : 'rgba(102,102,153,1)',
						            backgroundColor:'rgba(102,102,153,0.3)',
						            borderWidth:2,
						            pointBorderWidth:1,
								},{
									label: '단백질',
						            borderColor : 'rgba(255,51,51,1)',
						            backgroundColor:'rgba(255,51,51,0.3)',
						            borderWidth:2,
						            pointBorderWidth:1,
								},{
									label: '지방',
						            borderColor : 'rgba(204,153,51,1)',
						            backgroundColor:'rgba(204,153,51,0.3)',
						            borderWidth:2,
						            pointBorderWidth:1,
								}]
							}

					lineChart.data.labels=labels;
					console.log(lineChart.data.datasets);
					console.log(stackKcal);
					console.log(stackCH);
					console.log(stackProt);
					
					lineChart.data.datasets[0].data=stackKcal;
					lineChart.data.datasets[1].data=stackCH;
					lineChart.data.datasets[2].data=stackProt;
					lineChart.data.datasets[3].data=stackFat;
					lineChart.update();
				}
			});
			break;
	}
};

window.onload=chartCall();

</script>
<script src="<%=request.getContextPath()%>/Resource/js/calendar.js"></script>
<%@ include file="/../views/common/footer.jsp"%>