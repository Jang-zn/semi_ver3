<%@page import="com.semi.member.model.vo.MemberMenuList"%>
<%@page import="com.semi.member.model.vo.MemberExcList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List, com.semi.member.menu.model.vo.*" %>
<%@ page import="com.semi.member.model.service.*" %>
<%
	String today = (String)request.getAttribute("today");
	List<MemberExcList> exclist =(List<MemberExcList>)request.getAttribute("list");
	List<MemberMenuList> menulist=(List<MemberMenuList>)request.getAttribute("list2");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/dailyExc.css">
	<div id="dailyExc_title">
                <h2>운동일지</h2>
            </div>
            <div>
                <div id="personal_record_container">
                    <h3>연속 x일째 계획 실천중</h3>
                </div>
            <div id = dailyExc_content_container>
                <div id="dailyExc_content">
                    <ul id="exc_plan_list">
                        <li class="exc_plan_title"><span>(제목)운동 계획 <%=today %> 실행여부로 색표현</span></li>
                        <%for(MemberExcList mel : exclist) {%>
                        <input type="hidden" name="excid" value="<%=mel.getExcId()%>">
                        <li class="exc_plan_list"><span class="excname">운동이름</span><span>Reps:<%=mel.getReps()%></span><span>sets:<%=mel.getSets() %></span></li>
               			<%} %>
                    </ul>
                    <div id="complete_exc">
                        <button>실천 완료</button>
                    </div>
                </div>
                <div id="dailyExc_list">
                    <ul id="exc_list">
                        <li class = "exc_plan_title"><span>No</span><span>기록일</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현(이 위치는 항상 오늘날짜)</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                    </ul>
                    <div id="pageBar">
                        <h4>◀ &nbsp1&nbsp &nbsp2&nbsp &nbsp3&nbsp &nbsp4&nbsp &nbsp5&nbsp ▶</h4>
                    </div>
                </div>
            </div>
        </div>
        <div id="dailyExc_title">
                <h2>식단일지</h2>
            </div>
            <div>
                <div id="personal_record_container">
                    <h3>연속 x일째 계획 실천중</h3>
                </div>
            <div id = dailyExc_content_container>
                <div id="dailyExc_content">
                    <ul id="exc_plan_list">
                        <li class="exc_plan_title"><span>(제목)운동 계획  <%=today %> 실행여부로 색표현</span></li>
                        <%for(MemberMenuList mml: menulist){ %>
                        <input type="hidden" name="menuid" value="<%=mml.getMenuId()%>">
                         <input type="hidden" name="menuamount" value="<%=mml.getAmount()%>">
                        <li class="exc_plan_list"><span class="menuname">메뉴명</span><span class="menukcal">kcal</span><span class="menuinfo">영양정보</span><span>시간:<%=mml.getMenuDaytime()%></span></li>
						<%} %>
                    </ul>
                    <div id="complete_exc">
                        <button>실천 완료</button>
                    </div>
                </div>
                <div id="dailyExc_list">
                    <ul id="exc_list">
                        <li class = "exc_plan_title"><span>No</span><span>기록일</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현(이 위치는 항상 오늘날짜)</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                    </ul>
                    <div id="pageBar">
                        <h4>◀ &nbsp1&nbsp &nbsp2&nbsp &nbsp3&nbsp &nbsp4&nbsp &nbsp5&nbsp ▶</h4>
                    </div>
                </div>
            </div>
        </div>
        <script>
    	$(function(){
    		
    		$("input[name=excid]").each((i,v)=>{
    			console.log($(".exc_plan_list").eq(i).children(0).text())
    		$.ajax({
    			url:"<%=request.getContextPath()%>/ajax/exclist",
    			type:"get",
    			data:{  				
    				excid:$("input[name=excid]").eq(i).val()
    				},
    				success:data=>{
    				console.log(data);
    				$(".excname").eq(i).html(data.excName);
    							
    					}
    				})
    			})
    		});
    	
    	$(function(){
    		
    		$("input[name=menuid]").each((i,v)=>{
    			console.log($("input[name=menuamount]").eq(i).val())
    		$.ajax({
    			url:"<%=request.getContextPath()%>/ajax/selectmenu",
    			type:"get",
    			data:{  				
    				Menuid:$("input[name=menuid]").eq(i).val()
    				},
    				success:data=>{
    				console.log(data);
    				$(".menuname").eq(i).html(data.menuName);
    				let amount = $("input[name=menuamount]").eq(i).val();
    				$(".menukcal").eq(i).html(Math.ceil((data.kcal)/amount))
    				$(".menuinfo").eq(i).html((data.ch)/amount+",,"+(data.fat)/amount)
    					}
    				})
    			})
    		});
    	</script>
<%@ include file = "/views/common/footer.jsp"%>

