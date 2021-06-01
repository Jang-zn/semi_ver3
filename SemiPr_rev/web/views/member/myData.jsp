<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/../views/common/header.jsp"%>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
	<div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <img src="dummyImage.png"  alt="" style="width: 100%; height:45rem">
            </div>
        </div>        
    </div>
    
    <br>
    <br>
    
    <div class="container">
        <!-- 카테고리 버튼 -->
        <div class="row">
            <div class="col-md-2"><a href="<%=request.getContextPath()%>/member/weeklyTrend">주간 현황</a></div>
            <div class="col-md-2"><a href="<%=request.getContextPath()%>/member/monthlyTrend">월간 현황</a></div>
            <div class="col-md-2"><a href="<%=request.getContextPath()%>/member/myData">My Data</div>
        </div>
        <br><br>

        <!-- 주간 달성 현황 -->
        <div class="row">
            <div class="col-md-10"> 
           		<div>
           			<select name="duration" size="1">
           				<option value="1month">1개월</option>
           				<option value="3month">3개월</option>
           				<option value="6month">6개월</option>
           			</select>
           			<canvas id="myChart" style="width='100%', height='auto'"></canvas>           		
           		</div>
            </div>
            <div class="col-md-2"> 
                <!-- 항목 -->
                <div class="row">
                    <div class="col-md-12">운동</div>
                </div>
                <div class="row">
                    <div class="col-md-12">식단</div>
                </div>
                <div class="row">
                    <div class="col-md-12">체중</div>
                </div>
                <div class="row">
                    <div class="col-md-12">체지방량</div>
                </div>
                <div class="row">
                    <div class="col-md-12">골격근량</div>
                </div>
                <div class="row">
                    <!-- <div class="col-md-6"><a>공유하기 버튼</a></div> -->
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Trend 입력 -->
        </div>

    </div>


	<script>
	/* 임시 차트 */
	    var ctx = document.getElementById('myChart');
	    var myChart = new Chart(ctx, {
	         type: 'line',
	          data: { labels: ['월', '화', '수', '목', '금', '토' ,'일'], 
	          datasets: [{ label: '달성 여부', 
	          data: [1,2,2,1,0,0,1], 
	          backgroundColor: 'rgba(255, 200, 200, 0.2)', 
	          borderColor: 'gray', 
	          borderWidth: 1 }] },           
	          options: { 
	        	 
	        	  responsive: false,	        	  
	            lengnd:{
	                display: false
	            },
	            scales: {
	                yAxes: [{ 	
	                    ticks: {
	                        beginAtZero: true,
	                        display:false
	                    }
	                }],
	                xAxes: [{
	                    stacked: true
	                }],
	            } 
	            } 
	        }); 
    </script> 


	


<%@ include file = "/../views/common/footer.jsp"%>