<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/../views/common/header.jsp"%>
<%@ page import="java.util.Calendar, java.util.List,
 com.semi.member.model.vo.MemberExcList, com.semi.member.model.vo.MemberMenuList,
 com.semi.statistic.model.vo.ExcInfo, com.semi.statistic.model.vo.MenuInfo"
 %>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/Resource/css/weeklyTrend.css">
<%
	// 오늘 날짜 생성
	Calendar today=Calendar.getInstance();

	int su=today.get(Calendar.DAY_OF_WEEK); //요일-숫자
	String week=""; //요일
	
	int su2=today.get(Calendar.WEEK_OF_MONTH);	
	String ju=""; //해당 월 몇주차?
	
	//몇째주?
	 switch(su2){
		case 1: ju="첫"; break;
		case 2: ju="두"; break;
		case 3: ju="세"; break;
		case 4: ju="네"; break;
		case 5: ju="다섯"; break;
		default: ju="null"; break;
	} 
	
	// 일간 계획 가져오기
	List<MemberExcList> excList=(List<MemberExcList>)request.getAttribute("list01");
	List<MemberMenuList> menuList=(List<MemberMenuList>)request.getAttribute("list02");
	
	
	//연속 달성일 받아오기
	int excAchieve=(int)request.getAttribute("excAchieve");
	int menuAchieve=(int)request.getAttribute("menuAchieve");
	
%>
	

	<!--------------- 배너 ---------->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                배너 이미지
            </div>
        </div>        
    </div>
    
    <br>
    <br>
    
    <div class="container">
        <!-- 카테고리 버튼 -->
        <div class="row">
            <div class="col-md-2"><a href="<%=request.getContextPath()%>/member/weeklyTrend" class="btn1">주간 현황</a></div>
            <div class="col-md-2"><a href="<%=request.getContextPath()%>/member/monthlyTrend" class="btn1">월간 현황</a></div>
            <div class="col-md-2"><a href="<%=request.getContextPath()%>/member/myData" class="btn1">My Data</a></div>
        </div>
        <br><br>

        <!-- 주간 달성 현황 -->
        <div class="row">
            <div class="col-md-3">
                <%=today.get(Calendar.MONTH)+1 %>월 <%=ju %>번째 주 달성 현황
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2">운동</div>
                    <div id="weeklyExcStatus">
                        <div class="col-md-1"><div class="weeklyExcStatus">월</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">화</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">수</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">목</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">금</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">토</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">일</div></div>
                    </div>
                    <div class="col-md-3">연속 <%=excAchieve %>일 달성</div>
                </div>
            </div>  
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2">식단</div>
                    <div id="weeklyMenuStatus">
                        <div class="col-md-1"><div class="weeklyMenuStatus">월</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">화</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">수</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">목</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">금</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">토</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">일</div></div>
                    </div>                    

                    <div class="col-md-3"><div>연속 <%=menuAchieve %>일 달성</div> </div>                    
                    
                </div>
            </div>         
        </div>
        <br><br><br>

	<!-- 주간 달성 현황 색상 -->
	<script>	
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
					case 'Y': $(this).css('background-color','green'); break;//달성했을 경우 green					
					case 'N': $(this).css('background-color','red'); break; //달성하지 못했을 경우 red
					default : $(this).css('background-color','yellow'); break;
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
					case 'Y': $(this).css('background-color','green'); break;//달성했을 경우 green					
					case 'N': $(this).css('background-color','red'); break; //달성하지 못했을 경우 red
					default : $(this).css('background-color','yellow'); break;
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
	
	
        <!-- 일일 계획 -->
        <div class="row">
            <div class="col-md-6">
                <!-- 운동 -->
                <div class="row">
                    <div class="col-md-4">
                    	<div><%=today.get(Calendar.MONTH)+1 %>월 <%=today.get(Calendar.DATE) %>일 운동 계획</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                    <%if(excList.isEmpty()){  %>
                    	<div> 오늘 예정된 운동이 없습니다.</div>
                    <%}else{%>
                    <div class="row">
                    	<div class="col-md-3">운동 이름</div>
                    	<div class="col-md-3">reps</div>
                    	<div class="col-md-3">sets</div>
                    	<div class="col-md-3">weight</div>
                    </div>
	                    	<!-- 운동 이름은 운동 id로 가져와야 됨 -->
	                    	
                    <%
                    int count=0;
                    for( MemberExcList m : excList){%>
                    <div class="row">
                    
	                    		<!-- 첫번째 이름으로 다 받아오고 있음.. 수정해야 됨 -->
                    	<div class="col-md-3"><%=m.getExcId_c() %></div>
                    	<div class="col-md-3"><%=m.getReps() %> reps</div>
                    	<div class="col-md-3"><%=m.getSets()%> sets</div>
                    	<div class="col-md-3"><%=m.getWeight() %> weight</div>
                    </div>
                    <%
                    	count++;
                    	if (count>10) break;                    	
                    }
                    }%>
                        


                    </div>
                </div>
                <!-- <div class="row">
                    <div class="col-md-12">
                        예상 소요 시간
                    </div>
                </div> -->
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4"><button onclick="">달성 확인 버튼</button></div>
                </div>
            </div>
            
                
            
            
            
            
            <div class="col-md-6">
                <!-- 식단 -->
                <div class="row">
                    <div class="col-md-4">
                    	<div><%=today.get(Calendar.MONTH)+1 %>월 <%=today.get(Calendar.DATE) %>일 식단 계획</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                    	<%if(excList.isEmpty()){  %>
	                    	<div> 오늘 예정된 식단이 없습니다.</div>
	                    <%}else{%>
	                    <div class="row">
	                    	<div class="col-md-3">식단 이름</div>
	                    	<div class="col-md-3">양</div>
	                    	<div class="col-md-3">아침/점심/저녁</div>
	              		  </div>
	                    	<!-- 식단 이름은 운동 id로 가져와야 됨 -->
	                    	
	                    <%
	                    int count=0;
	                    for( MemberMenuList m : menuList){%>
	                    <div class="row">
	                    		<!-- 첫번째 이름으로 다 받아오고 있음.. 수정해야 됨 -->
	                    	<div class="col-md-3"><%=m.getMenuId_c() %></div>
	                    	<div class="col-md-3"><%=m.getAmount() %> 양</div>
	                    	<div class="col-md-3"><%=m.getMenuDaytime() %></div>
	                    </div>
	                   <%
	                    	count++;
	                    	if (count>10) break;                    	
	                    	}
	                    }%>  
                    </div>
                </div>
                <!-- <div class="row">
                    <div class="col-md-12">
                        전체 kcal
                    </div>
                </div> -->
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4"><button onclick="">달성 확인 버튼</button></div>
                </div>
            </div>


            <!-- 주간 통계 -->
            <div class="col-md-6">
                <!-- 운동 -->
                <div class="row">
                    <div class="col-md-6">이번주 많이 한 운동 5</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                        	<!-- DB에서 데이터 받아와 순위 계산해서 값 넣기 -->
                            <div class="col-md-12">1 </div>
                            <div class="col-md-12">2 </div>
                            <div class="col-md-12">3 </div>
                            <div class="col-md-12">4 </div>
                            <div class="col-md-12">5 </div>
                        </div>
                    </div>
                </div>                    
            </div>
            <div class="col-md-6">
                <!-- 식단 -->
                <div class="row">
                    <div class="col-md-6">식단 분석</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div>
                        	<canvas id="menuChart" style="width='100%', height='auto'"></canvas>
                        </div>
                    </div>
                </div> 
            </div>
                

        </div>

    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
	<script>
	
	/* 임시 식단 pie차트 */
	
         /* DB에서 데이터 받아와 주간 평균 내서 값 넣기 */
		var ch=10;
		var prot=20;
		var fat=100-ch-prot;
	
	 	var ctx = document.getElementById('menuChart');
    	var menuChart = new Chart(ctx, {
         type: 'pie',
          data: { 
            labels: ['탄수화물','단백질','지방'], 
            datasets: [{ 
            data: [ch,prot,fat],
            backgroundColor: ['rgba(255, 200, 200, 0.2)','rgba(255, 230, 255, 0.2)','rgba(100, 200, 200, 0.2)'], 
            borderColor: 'black', 
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
                    },
                    gridLines: {
                    	 drawOnChartArea: false,
                    	display:false
                    }                	
                }],
                xAxes: [{
                    stacked: true,
                    gridLines: {
                   	 drawOnChartArea: false,
                    	display:false
                    }
                }],
            } 
            } 
        }); 
    	
    	
	</script>
	
	



<%@ include file = "/../views/common/footer.jsp"%>