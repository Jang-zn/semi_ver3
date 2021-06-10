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
			
			
			int y = cal.get(cal.YEAR);
			String year = (""+y).substring(2); //YY
			
			
			int m = cal.get(cal.MONTH);
			String month="";  //MM
			if(m>10) {
				month=""+(m+1);
			}else {
				month="0"+(m+1);
			}
			String[] arrayCal = new String[last];
			
			for(int i = 0;i<last;i++) {
				cal.set(y, m, i+1);
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
				if(i<9) {
					arrayCal[i] = (""+year+"/"+month+"/0"+(i+1)+","+week);
				}else {
					arrayCal[i] = (""+year+"/"+month+"/"+(i+1)+","+week);
				}		
			}
	    	
			//arrayCal에는 한달치 yy/mm/dd,요일 이 저장됨
			for(String s : arrayCal) {
				List<MemberExercise> wlist = new ExcService().getWlist(memberId, s);
				List<MemberMenu> mlist = new MenuService().getWlist(memberId, s);
				if(wlist.size()==0) {
					continue;
				}else {
					//해당일에 계획 등록됐는지 확인
					int planCheck = new ExcService().getPlanCheck(memberId, s);
					if(planCheck==0) {
						//안돼있으면 등록해줌
						int result = new ExcService().setMonthlyPlan(wlist, s);
					}
					
					int planCheckM = new MenuService().getPlanCheck(memberId, s);
					if(planCheckM==0) {
						//안돼있으면 등록해줌
						int result = new MenuService().setMonthlyPlan(mlist, s);
					}else {
						continue;
					}
				}
				
			}
	    	//오늘날짜는 PlanCheck='C' 로 표기
			new ExcService().todayCheck(memberId);
			new MenuService().todayCheck(memberId);
			//날짜 지났는데 C면 자동으로 N으로 바꿈
			int tr = new ExcService().autoN(memberId);
			int trm = new MenuService().autoN(memberId);
			
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
