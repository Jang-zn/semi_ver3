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
				<div id="Practice_trend" class="col-md-8">trend</div>
				<div id="select_sort" class="col-md-2">
					<select id="dataType_select">
						<option name="dataType" value="">운동량</option>
						<option name="dataType" value="">일일 섭취 칼로리</option>
						<option name="dataType" value="">몸무게</option>
						<option name="dataType" value="">체지방률</option>
						<option name="dataType" value="">근골격량</option>
						<option name="dataType" value="">인바디점수</option>
						<option name="dataType" value="">운동 실천률</option>
						<option name="dataType" value="">식단 실천률</option>
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
						<div class="row">
						
							<canvas id="chart8" class="col-md-12" style="height:100%"></canvas>
						
						
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
						<div class="row">
							<canvas id="menuDonut" class="col-md-12"></canvas>
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
			for(let i=0;i<list.length;i++){
				if(data[0][i]!=null && data[0][i].date==$($("span.thism")[i]).text() && data[0][i].count>0){
					$($(".eCheck.thism")[i]).text("운동계획");
					if(data[0][i].check=="Y"){
						$($(".eCheck.thism")[i]).attr("style","background-color:green; color:white;");
					}else{
						$($(".eCheck.thism")[i]).attr("style","background-color:red; color:white;");
					}
				}
				if(data[1][i]!=null && data[1][i].date==$($("span.thism")[i]).text() && data[1][i].count>0){
					$($(".mCheck.thism")[i]).text("식단계획");
					if(data[1][i].check=="Y"){
						$($(".mCheck.thism")[i]).attr("style","background-color:green; color:white;");
					}else{
						$($(".mCheck.thism")[i]).attr("style","background-color:red; color:white;");
					}
				}
			}
		}		
	});
}
var num = Math.random();
var data = {
    labels: ["실천","미실천","남은 일자"],
    datasets: [{
        data: [num/2, 1 - num, num/2],
        backgroundColor: ["#FF6384","#DDD", "#AAA"],
        hoverBackgroundColor: ["#FF6384", "#AAA", "#FFF"]
    }]
};
window.onload = function () {
    var ctx8 = $('#chart8').get(0).getContext("2d");
    window.theChart8 = new Chart(ctx8, {
        type: 'doughnut',
        data: data,
        options: {

            elements: {
                center: {
                    text: Math.round(num * 100),
                    sidePadding: 15
                }
            },
            layout:{padding:0},
            maintainAspectRatio: false,
            cutoutPercentage: 100,
            rotation: 270,
            circumference: 300
        }
    });
}





</script>
<script src="<%=request.getContextPath()%>/Resource/js/calendar.js"></script>
<%@ include file="/../views/common/footer.jsp"%>