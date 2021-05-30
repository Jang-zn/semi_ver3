<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberMyList.css">
<div id="memberMyList">
	<div id="select_weekday">
		<div class="day_myList">일</div>
		<div class="day_myList">월</div>
		<div class="day_myList">화</div>
		<div class="day_myList">수</div>
		<div class="day_myList">목</div>
		<div class="day_myList">금</div>
		<div class="day_myList">토</div>
	</div>
	<div id="list_title_container">
		<div id="myexc" class="list_title_area">
			<h3>X 요일 운동계획</h3>
		</div>
		<div id="mymenu" class="list_title_area">
			<h3>X 요일 식단계획</h3>
			<select>
				<option>아침</option>
				<option>점심</option>
				<option>저녁</option>
			</select>
		</div>
	</div>
	<div id="list_container_myList">
		<div id="my_list_exc">
			<ul>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 운동이름1</span><br> 
						<span>무게 : xx kg</span>
						<span>횟수 : xx reps</span>
						<span>세트수 : xx sets</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 운동이름1</span><br> 
						<span>무게 : xx kg</span>
						<span>횟수 : xx reps</span>
						<span>세트수 : xx sets</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 운동이름1</span><br> 
						<span>무게 : xx kg</span>
						<span>횟수 : xx reps</span>
						<span>세트수 : xx sets</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 운동이름1</span><br> 
						<span>무게 : xx kg</span>
						<span>횟수 : xx reps</span>
						<span>세트수 : xx sets</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 운동이름1</span><br> 
						<span>무게 : xx kg</span>
						<span>횟수 : xx reps</span>
						<span>세트수 : xx sets</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
			</ul>
			<div id="pageBar_mylist">
				<h3>◀ 페이징처리 ▶</h3>
			</div>
		</div>
		<div id="my_list_menu">
			<ul>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
							: xx kcal</span><span>영양소 : ~~~~</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
							: xx kcal</span><span>영양소 : ~~~~</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
							: xx kcal</span><span>영양소 : ~~~~</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
							: xx kcal</span><span>영양소 : ~~~~</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
				<li class="weekDay_list">
					<div class="list_img_area">
						<img src="">
					</div>
					<div class="list_name_area">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
							: xx kcal</span><span>영양소 : ~~~~</span>
					</div>
					<div class="list_button_area">
						<button>수정</button>
						<br>
						<br>
						<button>삭제</button>
					</div>
				</li>
			</ul>
			<div id="pageBar_mylist">
				<h3>◀ 페이징처리 ▶</h3>
			</div>
		</div>
	</div>
	<div id="mylist_info_container">
		<div id="myExc_info" class="mylist_info">
			<h3>대충 선택한 운동 정보</h3>
			<div id="myExc_info_box" class="mylist_box"></div>
		</div>
		<div id="myMenu_info" class="mylist_info">
			<h3>대충 선택한 메뉴 정보</h3>
			<div id="myMenu_info_box" class="mylist_box"></div>
		</div>

	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>