<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberMyList.css">
<div id="memberMyList">
	<div class="row">
		<div class="col-md-1"></div>
		<div id="select_weekday" class="col-md-10">
			<div class="day_myList col-md-1">
				<br> <br>월<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>화<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>수<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>목<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>금<br> <br>
			</div>
			<div class="col-md-1"></div>
			<div class="day_myList col-md-1">
				<br> <br>토<br> <br>
			</div>
			<div class="day_myList col-md-1">
				<br> <br>일<br> <br>
			</div>

		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div id="list_title_container" class="col-md-10">
			<div id="myexc" class="list_title_area col-md-6"
				style="font-size: 3rem">X 요일 운동계획</div>
			<div id="mymenu" class="list_title_area col-md-6">
				<div class="col-md-10" style="font-size: 3rem">X 요일 식단계획</div>
				<div class="col-md-2" style="font-size: 2rem">
					<select>
						<option>아침</option>
						<option>점심</option>
						<option>저녁</option>
					</select>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div id="list_container_myList" class="col-md-10">
			<div id="my_list_exc" class="col-md-6">
			
			
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 운동이름1</span><br> <span>무게 : xx kg</span> <span>횟수
							: xx reps</span> <span>세트수 : xx sets</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 운동이름1</span><br> <span>무게 : xx kg</span> <span>횟수
							: xx reps</span> <span>세트수 : xx sets</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 운동이름1</span><br> <span>무게 : xx kg</span> <span>횟수
							: xx reps</span> <span>세트수 : xx sets</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 운동이름1</span><br> <span>무게 : xx kg</span> <span>횟수
							: xx reps</span> <span>세트수 : xx sets</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 운동이름1</span><br> <span>무게 : xx kg</span> <span>횟수
							: xx reps</span> <span>세트수 : xx sets</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 운동이름1</span><br> <span>무게 : xx kg</span> <span>횟수
							: xx reps</span> <span>세트수 : xx sets</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				<div id="pageBar_mylist_exc">
					<h3>◀ 페이징처리 ▶</h3>
				</div>
			</div>
			<div id="my_list_menu" class="col-md-6">
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
								: xx kcal</span><span>영양소 : ~~~~</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
								: xx kcal</span><span>영양소 : ~~~~</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
								: xx kcal</span><span>영양소 : ~~~~</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
								: xx kcal</span><span>영양소 : ~~~~</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
								: xx kcal</span><span>영양소 : ~~~~</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>
				
				<div class="row">
					<div class="list_img_area col-md-2">
						<br> <img src=""> <br> <br> <br>
					</div>
					<div class="list_name_area col-md-9">
						<span>대충 저장한 메뉴이름1</span><br> <span>양 : xx g</span><span>칼로리
								: xx kcal</span><span>영양소 : ~~~~</span><br>
						<br>
					</div>
					<div class="list_button_area col-md-1">
						<div class="btn">수정</div>
						<br>
						<div class="btn">삭제</div>
					</div>
				</div>	
				
				<div id="pageBar_mylist_menu">
					<h3>◀ 페이징처리 ▶</h3>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div id="mylist_info_container" class="col-md-10">
			<div id="myExc_info" class="mylist_info col-md-6">
				<h3>대충 선택한 운동 정보</h3>
				<div id="myExc_info_box" class="mylist_box"></div>
			</div>
			<div id="myMenu_info" class="mylist_info col-md-6">
				<h3>대충 선택한 메뉴 정보</h3>
				<div id="myMenu_info_box" class="mylist_box"></div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>