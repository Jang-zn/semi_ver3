<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberDietPlan.css">
	<div id="sub_change">
        <button>식단 List</button>
        <button>나만의 식단 등록</button>
        <button>식단 등록하기(ADMIN)</button>
    </div>
    <div id="list_container">
        <div id="diet_list">
            <div id="sort_container">
                <select>
                    <option id="meat" name="meat" value="육류">육류</option>
                    <option id="fruit" name="fruit" value="과일">과일/야채</option>
                    <option id="nut" name="nut" value="견과류">견과류</option>
                    <option id="product" name="product" value="완제품">완제품</option>
                </select>
                <button>인기 식단</button>
            </div>
            <div id="sort_list">
                <ul>
                    <li class="list">삼겹살</li>
                    <li class="list">안심</li>
                    <li class="list">등심</li>
                    <li class="list">111</li>
                    <li class="list">111</li>
                    <li class="list">111</li>
                    <li class="list">111</li>
                </ul>
            </div>
        </div>
        <div id="diet_list_info">
            <div id="diet_name">식단 name</div>
            <div id="diet_select">
                <div id="diet_img"><img src=""></div>
                <div id="diet_submit">
                    <form action="" method="post">
                        <select name="week">
                            <option value="월">월</option>
                            <option value="화">화</option>
                            <option value="수">수</option>
                            <option value="목">목</option>
                            <option value="금">금</option>
                            <option value="토">토</option>
                            <option value="일">일</option>
                        </select><br>
                        <input type="text" name="day" placeholder="아침/점심/저녁"><br>
                        <input type="number" name="kcal" placeholder="kcal"><br>
                        <input type="submit" onclick="" value="등록하기">
                    </form>
                </div>
            </div>
            <div id="diet_detail_info_container">
                <p>식단</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <div id="diet_video">
                    <a href="">식단 영상</a><br>
                   
                </div>
                <a href="">대충 추가 정보 링크</a>
            </div>
        </div>
    </div>
<%@ include file = "/views/common/footer.jsp"%>
