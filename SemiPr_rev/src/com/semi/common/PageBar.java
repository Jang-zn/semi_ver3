package com.semi.common;

import javax.servlet.http.*;

public class PageBar {

	private String pageBar;

	public PageBar(HttpServletRequest request, int totalData, int pageBarSize, String location) {
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerpage;
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		} catch (NumberFormatException e) {
			numPerpage = 5;
		}

		int totalPage = (int) Math.ceil((double) totalData / numPerpage);

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;

		int pageEnd = pageNo + pageBarSize - 1;

		System.out.println(cPage + " " + pageNo + " " + pageEnd);

		String pageBar = "";

		if (pageNo == 1) {
			pageBar += "<span>&nbsp[이전]&nbsp</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + location + "?cPage=" + (pageNo - 1) + "&numPerpage="
					+ numPerpage + "'>[이전]</a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (cPage == pageNo) {
				pageBar += "<span>&nbsp" + pageNo + "&nbsp</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + location + "?cPage=" + pageNo + "'>&nbsp" + pageNo
						+ "&nbsp</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>&nbsp[다음]&nbsp</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + location + "?cPage=" + pageNo + "'>&nbsp[다음]&nbsp</a>";
		}
		
		this.pageBar = pageBar;
	}

	
	
	public String getPageBar() {
		return pageBar;
	}



	
	
	
	
}
