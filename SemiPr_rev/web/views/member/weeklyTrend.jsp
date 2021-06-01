<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/../views/common/header.jsp"%>
<%@ page import="java.util.Calendar, java.util.List,
 com.semi.member.model.vo.MemberExcList, com.semi.member.model.vo.MemberMenuList" %>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/Resource/css/weeklyTrend.css">
<%
	// 오늘 날짜 생성
	Calendar today=Calendar.getInstance();

	int su=today.get(Calendar.DAY_OF_WEEK-1);
	String week=""; //요일
	
	//몇째주? - > 수정 필요
	/* switch(su){
		case 1: week="첫"; break;
		case 2: week="두"; break;
		case 3: week="세"; break;
		case 4: week="네"; break;
		case 5: week="다섯"; break;
		default: week="null"; break;
	} */
	
	// 일간 계획 가져오기
	List<MemberExcList> excList=(List<MemberExcList>)request.getAttribute("list01");
	List<MemberMenuList> menuList=(List<MemberMenuList>)request.getAttribute("list02");
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
                <%=today.get(Calendar.MONTH)+1 %>월 n번째 주 달성 현황
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2">운동</div>
                    <div class="weeklyLog">
                        <div class="col-md-1"><a>월</a></div>
                        <div class="col-md-1"><a>화</a></div>
                        <div class="col-md-1"><a>수</a></div>
                        <div class="col-md-1"><a>목</a></div>
                        <div class="col-md-1"><a>금</a></div>
                        <div class="col-md-1"><a>토</a></div>
                        <div class="col-md-1"><a>일</a></div>
                    </div>
                    <div class="col-md-3">연속 n일 달성</div>
                </div>
            </div>  
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2">식단</div>
                    <div class="weeklyLog">
                        <div class="col-md-1"><div class="weeklyStatus">월</div></div>
                        <div class="col-md-1"><div class="weeklyStatus">화</div></div>
                        <div class="col-md-1"><div class="weeklyStatus">수</div></div>
                        <div class="col-md-1"><div class="weeklyStatus">목</div></div>
                        <div class="col-md-1"><div class="weeklyStatus">금</div></div>
                        <div class="col-md-1"><div class="weeklyStatus">토</div></div>
                        <div class="col-md-1"><div class="weeklyStatus">일</div></div>
                        
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
	                    <span><%=m.getMenuId() %></span><span><%=m.getAmount() %> 양</span><span><%=m.getMenuDaytime()%> </span>
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