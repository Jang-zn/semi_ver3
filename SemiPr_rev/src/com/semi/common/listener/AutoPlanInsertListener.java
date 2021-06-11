package com.semi.common.listener;

import java.util.Calendar;
import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.semi.exc.model.service.ExcService;
import com.semi.member.exc.model.vo.MemberExercise;
import com.semi.member.menu.model.vo.MemberMenu;
import com.semi.member.model.vo.Member;
import com.semi.menu.model.service.MenuService;

/**
 * Application Lifecycle Listener implementation class AutoPlanInsertListener
 *
 */
@WebListener
public class AutoPlanInsertListener implements HttpSessionAttributeListener {

    /**
     * Default constructor. 
     */
    public AutoPlanInsertListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent se)  { 
    	HttpSession session = se.getSession();
    	Member member = (Member)session.getAttribute("logged");
    	if(member!=null) {
	    	String memberId = member.getMemberId();
	    	Calendar cal = Calendar.getInstance();
			int last = cal.getActualMaximum(cal.DAY_OF_MONTH); //월 길이 (length로 사용)
			int today = cal.get(cal.DATE); //오늘 날짜
			
			
			int y = cal.get(cal.YEAR);
			String year = (""+y).substring(2); //YY
			
			
			int m = cal.get(cal.MONTH);
			String month="";  //MM
			if(m>10) {
				month=""+(m+1);
			}else {
				month="0"+(m+1);
			}
			String[] arrayCal = new String[last-today+1];
			
			for(int i = 0 ;i<last-today+1;i++) {
				cal.set(y, m, today+i);
				int wnum = cal.get(cal.DAY_OF_WEEK);
				String week ="";
				switch(wnum) {
					case 1: week="일"; break;
					case 2: week="월"; break;
					case 3: week="화"; break;
					case 4: week="수"; break;
					case 5: week="목"; break;
					case 6: week="금"; break;
					case 7: week="토"; break;
				}
				if(today+i<9) {
					arrayCal[i] = (""+year+"/"+month+"/0"+(today+i)+","+week);
				}else {
					arrayCal[i] = (""+year+"/"+month+"/"+(today+i)+","+week);
				}		
			}
			ExcService ex = new ExcService();
			MenuService ms = new MenuService();
			//arrayCal에는 오늘~말일 yy/mm/dd,요일 이 저장됨
			for(String s : arrayCal) {
				
				List<MemberExercise> wlist = ex.getWlist(memberId, s);
				List<MemberMenu> mlist = ms.getWlist(memberId, s);
				if(wlist.size()==0) {
					continue;
				}else {
					//해당일에 계획 등록됐는지 확인
					int planCheck = ex.getPlanCheck(memberId, s);
					int result=0;
					if(planCheck==0) {
						//안돼있으면 등록해줌
						result = ex.setMonthlyPlan(wlist, s);
					}else {
						//돼있으면 업데이트
						result = ex.updateMonthlyPlan(memberId, wlist,s);
					}
					
					int planCheckM = ms.getPlanCheck(memberId, s);
					if(planCheckM==0) {
						//안돼있으면 등록해줌
						result = ms.setMonthlyPlan(mlist, s);
					}else {
						result = ms.updateMonthlyPlan(memberId, mlist,s);
					}
				}
				
			}
	    	//오늘날짜는 PlanCheck='C' 로 표기
			ex.todayCheck(memberId);
			ms.todayCheck(memberId);
			//날짜 지났는데 C면 자동으로 N으로 바꿈
			int tr = ex.autoN(memberId);
			int trm = ms.autoN(memberId);
			
    	}
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}
