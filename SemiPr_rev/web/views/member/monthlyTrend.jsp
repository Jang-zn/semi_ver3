<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/monthlyTrend.css">



<div id="container_progress_trend" class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<br>
		<div class='row'>

			<div class="col-md-12">
				<div class="col-md-12">
					<div class="col-md-4">이번주 계획</div>
					<div class="col-md-4">달성현황</div>
					<div class="col-md-4">건강기록</div>
				</div>
			</div>

		</div>
		<br>


		<div class="row">

			<div id="container_content_progress_trend" class="col-md-12">
				<div id="PracticeRate_img" class="col-md-2">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_qscX8L2bnZfZhslTsvDavnGhH16jUEsTRw&usqp=CAU">
				</div>
				
				
				<!-- Trend Area -->
				<div id="Practice_trend" class="col-md-8">
					<div class="row">
						<div class="col-md-12" style="height:230px">
							<canvas id="lineChart"></canvas>
						</div>
					</div>
				</div>
				
				<!-- Trend Area -->
				
				<div id="select_sort" class="col-md-2">
					<select id="dataType_select">
						<option name="dataType" value="">운동 실천현황</option>
						<option name="dataType" value="">식단 실천현황</option>
						<option name="dataType" value="">누적 운동량(reps)</option>
						<option name="dataType" value="">섭취 칼로리(kcal)</option>
					</select><br> <label><input type="radio" name="term" value="1m">
						1개월 </label><br> <label><input type="radio" name="term"
						value="3m"> 3개월 </label><br> <label><input
						type="radio" name="term" value="6m"> 6개월 </label><br> <label><input
						type="radio" name="term" value="12m"> 1년 </label><br>
					<button id="read_trend" name="read_trend">조회하기</button>
				</div>
			</div>

		</div>

		<div class="row">
			<div id="statistics_container" class="col-md-12">
				<div class="row">X월 운동 실천율</div>
				<div id="data_container" class="row">
					<div id="pieChart" class="col-md-6">
						<div class="row">
							<div class="col-md-2">1</div>
							<div class="col-md-2">2</div>
							<div class="col-md-2">3</div>
							<div class="col-md-2">4</div>
							<div class="col-md-2">5</div>
							<div class="col-md-2">6</div>
						</div>
						<div class="row cContainer">
						
							<canvas id="chart8" class="col-md-12" ></canvas>
						
						
						</div>
					</div>
					<div id="rank" class="col-md-6">
						<div class="row">
							<div class="col-md-2">1</div>
							<div class="col-md-2">2</div>
							<div class="col-md-2">3</div>
							<div class="col-md-2">4</div>
							<div class="col-md-2">5</div>
							<div class="col-md-2">6</div>
						</div>
						<div class="row">
							
						</div>
					</div>
				</div>

			</div>
		</div>
		
		
		
		<div class="row">
			<div id="statistics_container" class="col-md-12">
				<div class="row">X월 식단 실천율</div>
				<div id="data_container" class="row">
					<div id="pieChart" class="col-md-6">
						<div class="row">
							<div class="col-md-2">1</div>
							<div class="col-md-2">2</div>
							<div class="col-md-2">3</div>
							<div class="col-md-2">4</div>
							<div class="col-md-2">5</div>
							<div class="col-md-2">6</div>
						</div>
						<div class="row cContainer">
						
							<canvas id="chart9" class="col-md-12" ></canvas>
						
						
						</div>
					</div>
					<div id="rank" class="col-md-6">
						<div class="row">
							<div class="col-md-2">1</div>
							<div class="col-md-2">2</div>
							<div class="col-md-2">3</div>
							<div class="col-md-2">4</div>
							<div class="col-md-2">5</div>
							<div class="col-md-2">6</div>
						</div>
						<div class="row"></div>
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
	<div class="col-md-1"></div>
</div>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/calendar.css">

<script>
const callPlan=()=>{
	let list = $("span.thism");
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
						$($(".eCheck.thism")[i]).attr("style","background-color:green; color:white;");
						ey++;
					}else{
						$($(".eCheck.thism")[i]).attr("style","background-color:red; color:white;");
						en++
					}
				}
				if(data[1][i]!=null && data[1][i].date==$($("span.thism")[i]).text() && data[1][i].count>0){
					$($(".mCheck.thism")[i]).text("식단계획");
					if(data[1][i].check=="Y"){
						$($(".mCheck.thism")[i]).attr("style","background-color:green; color:white;");
						my++;
					}else{
						$($(".mCheck.thism")[i]).attr("style","background-color:red; color:white;");
						mn++;
					}
				}
			}
			excPie(ey,en, list.length);
			menuPie(my,mn, list.length);
		}		
	});
}


const excPie=(y, n, l)=>{
	var data = {
		    //ajax 처리
	    labels: ["실천","미실천","남은 일자"],
	
	    datasets: [{
	        data: [y/l, n/l, 1-(y/l+n/l)],
	        backgroundColor: ["rgba(0,150,255,0.7)","rgba(255,0,0,0.6)", "#AAA"],
	    }]
	};
	let ctx = $('#chart8').get(0).getContext("2d");
	let theChart = new Chart(ctx, {
	    type: 'doughnut',
	    data: data,
	    options: {
	        layout:{padding:0},
	        maintainAspectRatio: false,
	        cutoutPercentage:10,
	        rotation: 270,
	        circumference: 180
	    }
	});
	chart.update();
};

const menuPie=(y, n, l)=>{
	let data = {
			  //ajax 처리
		    labels: ["실천","미실천","남은 일자"],
		    datasets: [{
		        data: [y/l, n/l, 1-(y/l+n/l)],
		        backgroundColor: ["rgba(0,150,255,0.7)","rgba(255,0,0,0.6)", "#AAA"],
		    }]
		};
	    let ctx = $('#chart9').get(0).getContext("2d");
	    let theChart = new Chart(ctx, {
	        type: 'doughnut',
	        data: data,
	        layout:{padding:0},
	        maintainAspectRatio: false,
	        cutoutPercentage:10,
	        rotation: 270,
	        circumference: 180
	    }
	});
};


const reloadChart=()=>{
	
	//데이터셋 수 만큼 반복
	var dataset = config.data.datasets;
	for(var i=0; i<dataset.length; i++){
		console.log(dataset);
		//데이터 갯수 만큼 반복
		var data = dataset[i].data;
		for(var j=0 ; j < data.length ; j++){
			data[j] = Math.floor(Math.random() * 50);
		}
	}
	
	myChart.update();	//차트 업데이트
}






//line chart
const line = $("#lineChart");
const lineChart = new Chart(line, {
    type: 'bar',
    options:{
        legend:{
         	display:false
    	},
    	maintainAspectRatio : false,
	},
    data: {
        labels: [
            '1일', '2일', '3일', '4일', '5일', '6일', '7일', '8일', '9일', '10일',
            '11일', '12일','13일', '14일','15일', '16일','17일', '18일','19일', '20일',
            '21일', '22일','23일', '24일','25일', '26일','27일', '28일','29일', '30일',
        ],
        datasets: [
            {
                label: '운동',
                data: [1, 1, 1, 1, 1, 0, 1, 1, 1, 0,
                        1, 1, 0, 1, 0, 1, 0, 1, 0, 1,
                        1, 1, 1, 0, 1, 1, 1, 0, 1, 1,
                ],
                borderColor : 'blue',
                backgroundColor:'rgba(0,0,255,0.3)',
                borderWidth:3,
                
            },
            {
                label: "",
                type:'line',
                data: [1, 1, 1, 1, 0, 0, 1, 0, 1, 0,
                        1, 0, 0, 1, 0, 1, 0, 1, 0, 1,
                        1, 1, 1, 0, 1, 0, 1, 0, 1, 1,
                ],
                borderColor : 'rgba(0,0,255,0.3)',
                borderWidth:3,
                
            },
            {
                type:'line',
                label: '실천완료',
                data: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                ],
                borderColor : 'lightgreen',
                borderWidth:2,
                borderDash:[10,10],
                pointRadius:0,
                options: {
                       legend: {
                            display: false
                        }
                }
            }
        ]},
});





</script>
<script src="<%=request.getContextPath()%>/Resource/js/calendar.js"></script>
<%@ include file="/../views/common/footer.jsp"%>