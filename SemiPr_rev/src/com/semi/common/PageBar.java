package com.semi.common;

import javax.servlet.http.*;

public class PageBar {

	private String pageBar;
	private int cPage;
	private int numPerpage;
	

	public PageBar(HttpServletRequest request, int totalData, int pageBarSize, String location) {
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		this.cPage = cPage;
		
		
		
		int numPerpage;
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		} catch (NumberFormatException e) {
			numPerpage = 5;
		}
		this.numPerpage = numPerpage;
		
		
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
				pageBar += "<a href='" + request.getContextPath() + location + "?cPage=" + pageNo + "&numPerpage="
						+ numPerpage +"'>&nbsp" + pageNo
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

	public PageBar(HttpServletRequest request, int totalData, int pageBarSize, String location, String query) {
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		this.cPage = cPage;
		
		
		
		int numPerpage;
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		} catch (NumberFormatException e) {
			numPerpage = 5;
		}
		this.numPerpage = numPerpage;
		
		
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;

		int pageEnd = pageNo + pageBarSize - 1;

		System.out.println(cPage + " " + pageNo + " " + pageEnd);

		String pageBar = "";

		if (pageNo == 1) {
			pageBar += "<span>&nbsp[이전]&nbsp</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + location + "?"+query+"&cPage=" + (pageNo - 1) + "&numPerpage="
					+ numPerpage + "'>[이전]</a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (cPage == pageNo) {
				pageBar += "<span>&nbsp" + pageNo + "&nbsp</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + location + "?"+query+"&cPage=" + pageNo + "&numPerpage="
						+ numPerpage + "'>&nbsp" + pageNo
						+ "&nbsp</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>&nbsp[다음]&nbsp</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + location + "?"+query+"&cPage=" + pageNo + "'>&nbsp[다음]&nbsp</a>";
		}
		
		this.pageBar = pageBar;
	}
	
	
	
	
	
	
	
	public String getPageBar() {
		return pageBar;
	}


	public int getCPage() {
		return cPage;
	}

	public int getNumPerpage() {
		return numPerpage;
	}
	
}
