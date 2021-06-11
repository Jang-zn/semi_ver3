<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/../views/common/header.jsp"%>
<%@ page import="java.util.Calendar, java.util.List,
 com.semi.member.model.vo.MemberExcList, com.semi.member.model.vo.MemberMenuList,
 com.semi.statistic.model.vo.ExcInfo, com.semi.statistic.model.vo.MenuInfo"
 %>

<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/Resource/css/02weeklyTrend.css">
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/Resource/css/font.css">

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
	

	//통계 결과 받아오기
	List<ExcInfo> excStatistic=(List<ExcInfo>)request.getAttribute("excStatistic");
	MenuInfo menuStatistic=(MenuInfo)request.getAttribute("menuStatistic");
	
%>
	</div>
	<!--------------- 배너 ---------->
     <div id="banner_home" class="container-fluid">
    	<div class="row">
    		<div class="col-md-12">
    			<img src="<%=request.getContextPath()%>/Resource/img/banner_weeklyTrend.png" alt="" style="width:100%; height:auto; margin:0;">
    		</div>
    	</div>
    </div>
    <br> <br> 
    
    <div class="container">
        <!-- 카테고리 버튼 -->
        <div class="row">
            <div class="col-md-2 title00"><a href="<%=request.getContextPath()%>/member/weeklyTrend" class="btn1">주간 현황</a></div>
            <div class="col-md-2 title00"><a href="<%=request.getContextPath()%>/member/monthlyTrend" class="btn1">월간 현황</a></div>
            <%-- <div class="col-md-2 title00"><a href="<%=request.getContextPath()%>/member/myData" class="btn1">My Data</a></div> --%>
        </div>
        <br><br>

        <!-- 주간 달성 현황 -->
        <div class="row">
            <div class="col-md-3 title01" style="margin-bottom:1rem;">
                > <%=today.get(Calendar.MONTH)+1 %>월 <%=ju %>번째 주 달성 현황
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-1 title02" style="text-align:right; font-weight:bolder;  margin-top:1rem;">운동</div>
                    <div id="weeklyExcStatus">
                        <div class="col-md-1"><div class="weeklyExcStatus">월</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">화</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">수</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">목</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">금</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">토</div></div>
                        <div class="col-md-1"><div class="weeklyExcStatus">일</div></div>
                    </div>
                    <div class="col-md-3 title01" >연속 <span id="excrecord2"></span>일 달성</div>
                </div>
            </div>  
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-1 title02" style="text-align:right; font-weight:bolder;  margin-top:1rem;">식단</div>
                    <div id="weeklyMenuStatus">
                        <div class="col-md-1"><div class="weeklyMenuStatus">월</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">화</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">수</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">목</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">금</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">토</div></div>
                        <div class="col-md-1"><div class="weeklyMenuStatus">일</div></div>
                    </div>
                    <div class="col-md-3 title01" style="margin-top:1.2rem;">연속 <span id="menurecord2"></span>일 달성 </div>                    
                    
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
	
	
        <!-- 일일 계획 -->
        <div class="row todayPlan">
            <div class="col-md-6">
                <!-- 운동 -->
                <div class="row">
                    <div class="col-md-6 title01">
                    	<div>> <%=today.get(Calendar.MONTH)+1 %>월 <%=today.get(Calendar.DATE) %>일 운동 계획</div>
                    </div>
                </div>
                <div class="row listContainer01">
                    <div class="col-md-12">
                    <%if(excList.isEmpty()){  %>
                    	<div class="list02 noPlan"> 오늘 예정된 운동이 없습니다.</div>
                    <%}else{%>
                    <div class="row">
                    	<div class="col-md-12">
                    		<div class="row list01">
	                    		<div class="col-md-5">운동 이름</div>
		                    	<div class="col-md-2">reps</div>
		                    	<div class="col-md-2">sets</div>
		                    	<div class="col-md-3">weight</div>
                    		</div>
                    	</div>
                    	
                    </div>
	                    	<!-- 운동 이름은 운동 id로 가져와야 됨 -->
	                    	
                    <%
                    int count=0;
                    for( MemberExcList m : excList){%>
                    <div class="row">
                    	<div class="col-md-12">
                    		<div class="row list02">
	                    		<div class="col-md-5 categoryLine todayPlan_l"><%=m.getExcId_c() %></div>
		                    	<div class="col-md-2 categoryLine todayPlan_l"><%=m.getReps() %> reps</div>
		                    	<div class="col-md-2 categoryLine todayPlan_l"><%=m.getSets()%> sets</div>
		                    	<div class="col-md-3 todayPlan_l"><%=m.getWeight() %> weight</div>
                    		</div>
                    	</div>                    	
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
                    <div class="col-md-4"><button onclick="excUpdate();" class="btn01">달성 확인</button></div>
                </div>
            </div>
            
             <script>
             $.ajax({
         		url:"<%=request.getContextPath()%>/ajax/dailyrecord",
         			type:"get",
         			dataType:"text",
         			success:data=>{
         				data=data.split(",");
         				$("#excrecord2").text(data[0].replace("[",""));
         				$("#menurecord2").text(data[1].replace("]",""));
         				console.log(data);
         			}		
         	});
             </script>
            
            
            
            
            <div class="col-md-6">
                <!-- 식단 -->
                <div class="row">
                    <div class="col-md-6 title01">
                    	<div>> <%=today.get(Calendar.MONTH)+1 %>월 <%=today.get(Calendar.DATE) %>일 식단 계획</div>
                    </div>
                </div>
                <div class="row listContainer">
                    <div class="col-md-12">
                    	<%if(excList.isEmpty()){  %>
	                    	<div class="list02 noPlan"> 오늘 예정된 식단이 없습니다.</div>
	                    <%}else{%>
	                    <div class="row">
							<div class="col-md-9">
								<div class="row list01">
									<div class="col-md-6">식단 이름</div>
			                    	<div class="col-md-3">양</div>
			                    	<div class="col-md-3">언제</div>
								</div>
							</div>	                    
	                    	
	              		  </div>
	                    	<!-- 식단 이름은 운동 id로 가져와야 됨 -->
	                    	
	                    <%
	                    int count=0;
	                    for( MemberMenuList m : menuList){%>
	                    <div class="row">
	                    	<div class="col-md-9">
								<div class="row list02">
									<div class="col-md-6 categoryLine todayPlan_l"><%=m.getMenuId_c() %></div>
			                    	<div class="col-md-3 categoryLine todayPlan_l"><%=m.getAmount() %> g</div>
			                    	<div class="col-md-3 todayPlan_l" ><%=m.getMenuDaytime() %></div>
								</div>
							</div>	    
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
                    <div class="col-md-4"><button onclick="menuUpdate();" class="btn01">달성 확인</button></div>
                </div>
            </div>
		</div>
			 <script>
			    	const excUpdate=()=>{
			    		location.replace("<%=request.getContextPath()%>/member/todayExcUpdate");
			    	}
			    	
			    	const menuUpdate=()=>{
			    		location.replace("<%=request.getContextPath()%>/member/todayMenuUpdate");
			    	}
			    </script>
		</div>
	<br><br>
	<div class="container">
		<div class="row" >
            <!-- 주간 통계 -->
            <div class="col-md-6">
                <!-- 운동 -->
                <div class="row">
                    <div class="col-md-6 title01" style="margin-bottom:1rem;">> 이번주 많이 한 운동 5</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                        	<!-- DB에서 데이터 받아와 순위 계산해서 값 넣기 -->                        	 
                        	 <%for(int i=0; i<5; i++){ %>
                        	 		<%if(excStatistic.isEmpty() || excStatistic.get(i)==null){ %>
	                        	 		<div class="col-md-1 num01"><%=i+1 %>. </div>
	                        			<div class="col-md-11 num02" style="color:gray; font-weight:light;">회원 통계 자료가 없습니다.</div>
                        	 		<%}else{ %>
	                        	 		<div class="col-md-1 num01"><%=i+1 %>. </div>
	                        			<div class="col-md-11 num02"><%=excStatistic.get(i).getExcName() %></div>
                        	 		<%} %>
                        	 <%} %>
			
                        </div>
                    </div>
                </div>                    
            </div>
            <div class="col-md-6">
                <!-- 식단 -->
                <div class="row">
                    <div class="col-md-6 title01" style="margin-bottom:1rem;">> 이번주 식단 분석</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        	<canvas id="menuChart" style="width='100%', height='auto'"></canvas>
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
         /* DB에서 데이터 받아와 주간 평균 내서 값 넣기 */
		var ch=<%=menuStatistic.getCh()%>;
		var prot=<%=menuStatistic.getProt()%>;
		var fat=<%=menuStatistic.getFat()%>;
	
		console.log(ch+" : "+prot+" : "+fat);
	 	var ctx = document.getElementById('menuChart');
    	var menuChart = new Chart(ctx, {
         type: 'pie',
          data: { 
            labels: ['탄수화물','단백질','지방'], 
            datasets: [{ 
            data: [ch,prot,fat],
            backgroundColor: ['rgba(223, 72, 51, 0.5)','rgba(230, 192, 80, 0.5)','rgba(84, 166, 53, 0.5)'], 
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