<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberExcPlan.css">
	<div id="sub_change">
        <button>운동 List</button>
        <button>나만의 운동 등록</button>
        <button>운동 등록하기(ADMIN)</button>
    </div>
    <div id="list_container">
        <div id="exc_list">
            <div id="sort_container">
                <select>
                    <option id="chest" name="chest" value="가슴">가슴</option>
                    <option id="back" name="back" value="등">등</option>
                    <option id="lowerbody" name="lowerbody" value="하체">하체</option>
                </select>
                <button>인기 운동</button>
            </div>
            <div id="sort_list">
                <ul>
                    <li class="list">111</li>
                    <li class="list">111</li>
                    <li class="list">111</li>
                    <li class="list">111</li>
                    <li class="list">111</li>
                    <li class="list">111</li>
                    <li class="list">111</li>
                </ul>
            </div>
        </div>
        <div id="exc_list_info">
            <div id="exc_name">대충 운동이름</div>
            <div id="exc_select">
                <div id="exc_img"><img src=""></div>
                <div id="exc_submit">
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
                        <input type="number" name="weight" placeholder="kg"><br>
                        <input type="number" name="reps" placeholder="횟수"><br>
                        <input type="number" name="sets" placeholder="세트수"><br>
                        <input type="submit" onclick="" value="등록하기">
                    </form>
                </div>
            </div>
            <div id="exc_detail_info_container">
                <p>대충 운동정보</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <p>1</p>
                <div id="exc_video">
                    <a href="">대충 영상링크</a><br>
                    아니면 영상 띄우기
                </div>
                <a href="">대충 추가 정보 링크</a>
            </div>
        </div>
    </div>
<%@ include file = "/views/common/footer.jsp"%>
