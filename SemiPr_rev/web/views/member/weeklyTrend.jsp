<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/../views/common/header.jsp"%>
<%@ page import="java.util.Calendar, java.util.List,
 com.semi.member.model.vo.MemberExcList, com.semi.member.model.vo.MemberMenuList" %>
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
	
	//주간 현황 가져오기
	
	
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
                    <div class="weeklyLog">
                        <div class="col-md-1"><div class="weeklyExcStatus">월</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">화</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">수</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">목</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">금</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">토</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">일</div></div>
                    </div>
                    <div class="col-md-3">연속 n일 달성</div>
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
                        
                        <!-- #weeklyStatus
                        	1. 오늘 포함 이후 날짜 -> 연회색
                        	2. 오늘 이전 날짜 -> 달성 현황에 따라 색상 변경                    
                         -->
                    </div>                    

                    <div class="col-md-3">
                    	<div>연속 n일 달성</div>  <!-- 회원 DB에 따라 연속 달성일 표시 -->
                    </div>                    
                    
                </div>
            </div>         
        </div>
        <br><br><br>
	<script>
		$("div.weeklyMenuStatus").each(function(){
			var weekNum=0;
			const weekCheck=$(this).html(); //어느 요일?
			/* if(weekCheck.equals("월")) weekNum=1;
			else if(weekCheck.equals("화")) weekNum=2;
			else if(weekCheck.equals("수")) weekNum=3;
			else if(weekCheck.equals("목")) weekNum=4;
			else if(weekCheck.equals("금")) weekNum=5;
			else if(weekCheck.equals("토")) weekNum=6;
			else if(weekCheck.equals("일")) weekNum=7; */
			
			 switch(weekCheck){
				case '월': weekNum=1; break;
				case '화': weekNum=2; break;
				case '수': weekNum=3; break;
				case '목': weekNum=4; break;
				case '금': weekNum=5; break;
				case '토': weekNum=6; break;
				case '일': weekNum=7; break;
			}	 
			
			if( weekNum < <%=su%>){ //오늘 날짜가 n요일 이전이라면 -> DB값에 따라 색상 변함
				
				//해당 요일 메뉴 계획 달성 여부 체크
				//요일을 service로 보내야됨
				
				const weekMenuCheck=""; //해당 요일 달성 여부는?
				$.ajax({
					url:"<%=request.getContextPath()%>/ajax/weeklyCheck",
					type:"post",
					data:{"weekCheck":weekCheck},
					success:data=>{
						if(weekMenuCheck.equals("Y")){ //달성했을 경우 green
							$(this).css('background-color','green'); 
						}else if(weekMenuCheck.equals("N")){ //달성하지 못했을 경우 red
							$(this).css('background-color','red');
						}else{//체크되지 않았을 경우 yellow
							$(this).css('background-color','yellow');
						}
					}
				})		
				// -> 조회된 값을 제대로 가져오지 못하고 있는 듯. 확인 필요
				
				
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
                    <span>운동이름</span><span>reps</span><span>sets</span>
	                    	<!-- 운동 이름은 운동 id로 가져와야 됨 -->
                    <%for( MemberExcList m : excList){%>
                    <span><%=m.getExcId() %></span><span><%=m.getReps() %> reps</span><span><%=m.getSets()%> sets</span>
                    <%}
                    }%>
                        


                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        예상 소요 시간
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4"><button onclick="">달성 확인 버튼</button></div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- 식단 -->
                <div class="row">
                    <div class="col-md-4">
                    	<div><%=today.get(Calendar.MONTH)+1 %>월 <%=today.get(Calendar.DATE) %>일 </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                    	<%if(excList.isEmpty()){  %>
	                    	<div> 오늘 예정된 식단이 없습니다.</div>
	                    <%}else{%>
	                    <span>식단이름</span><span>양</span><span>아침/점심/저녁</span>
		                    	<!-- 식단 이름은 식단 id로 가져와야 됨 -->
	                    <%for( MemberMenuList m : menuList){%>
	                    <span><%=m.getMenuId()%></span><span><%=m.getAmount() %> 양</span><span><%=m.getMenuDaytime()%> </span>
	                    <%}
	                    }%>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                     전체 kcal
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4"><button onclick="">달성 확인 버튼</button></div>
                </div>
            </div>
            <br><br><br><br><br><br>
             <br><br><br><br><br><br>


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
     </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
	<script>
	/* 임시 식단 pie차트 */
	 	var ctx = document.getElementById('menuChart');
    	var menuChart = new Chart(ctx, {
         type: 'pie',
          data: { 
            labels: ['탄수화물','단백질','지방'], 
            datasets: [{ 
            data: [30,20,50],
            /* DB에서 데이터 받아와 주간 평균 내서 값 넣기 */
            backgroundColor: ['rgba(255, 200, 200, 0.2)','rgba(255, 255, 255, 0.2)','rgba(100, 200, 200, 0.2)'], 
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
                    	display:false
                    }                	
                }],
                xAxes: [{
                    stacked: true,
                    gridLines: {
                    	display:false
                    }
                	
                }],
            } 
            } 
        }); 
    	
    	
	</script>
	
	



<%@ include file = "/../views/common/footer.jsp"%>