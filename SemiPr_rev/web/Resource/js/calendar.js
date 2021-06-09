let date = new Date();
let dates = null;
let viewYear = null;
let viewMonth = null; 




// Date 객체 생성
const renderCalendar = () => {

	viewYear = date.getFullYear();
	viewMonth = date.getMonth();

	// year-month 채우기
	$(".year-month").text(viewYear + "년 " + (viewMonth + 1) + "월" + " 실천 현황");
	$("#excMonth").html("<div class='col-md-12'>"+(viewMonth + 1) + "월" + " 운동 실천률</div>");
	$("#menuMonth").html("<div class='col-md-12'>"+(viewMonth + 1) + "월" + " 식단 실천률</div>");
	

	// 지난 달 마지막 Date, 이번 달 마지막 Date
	const prevLast = new Date(viewYear, viewMonth, 0);
	const thisLast = new Date(viewYear, viewMonth + 1, 0);

	const PLDate = prevLast.getDate();
	const PLDay = prevLast.getDay();

	const TLDate = thisLast.getDate();
	const TLDay = thisLast.getDay();

	// Dates 기본 배열들
	const prevDates = [];
	const thisDates = [...Array(TLDate + 1).keys()].slice(1);
	const nextDates = [];

	// prevDates 계산
	if (PLDay !== 6) {
		for (let i = 0; i < PLDay + 1; i++) {
			prevDates.unshift(PLDate - i);
		}
	}

	// nextDates 계산
	for (let i = 1; i < 7 - TLDay; i++) {
		nextDates.push(i)
	}

	// Dates 합치기
	dates = prevDates.concat(thisDates, nextDates);

	// Dates 정리
	const firstDateIndex = dates.indexOf(1);
	const lastDateIndex = dates.lastIndexOf(TLDate);
	dates.forEach((date, i) => {
		const condition = i >= firstDateIndex && i < lastDateIndex + 1
			? 'thism'
			: 'other';


		dates[i] = `<div class="date"><span class="${condition}">${date}</span></div>`;
		dates[i] = "<div class='date col-md-1'><span class='" + condition + "'>" + date + "</span>"
		    +"<div class='col-md-12 eCheck " + condition + "'></div>"
			+ "<div class='col-md-12 mCheck " + condition + "'></div>"
			+ "</div>";
	})


	// Dates 그리기
	$('.dates').html(dates.join(''));

	// 오늘 날짜 그리기
	const today = new Date();
	if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
		for (let date of document.querySelectorAll('.thism')) {
			if (+date.innerText === today.getDate()) {
				date.classList.add('today');
				break;
			}
		}
	}

	callPlan();
}

renderCalendar();

const prevMonth = () => {
	date.setMonth(date.getMonth() - 1);
	renderCalendar();
}

const nextMonth = () => {
	date.setMonth(date.getMonth() + 1);
	renderCalendar();
}

const goToday = () => {
	date = new Date();
	renderCalendar();
}


