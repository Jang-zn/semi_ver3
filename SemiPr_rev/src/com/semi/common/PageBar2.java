package com.semi.common;

import javax.servlet.http.*;

public class PageBar2 {

	private String pageBar2;
	private int cPage2;
	private int numPerpage2;
	

	public PageBar2(HttpServletRequest request, int totalData, int pageBarSize, String location) {
		int cPage2;
		try {
			cPage2 = Integer.parseInt(request.getParameter("cPage2"));
		} catch (NumberFormatException e) {
			cPage2 = 1;
		}
		this.cPage2 = cPage2;
		
		
		
		int numPerpage2;
		try {
			numPerpage2 = Integer.parseInt(request.getParameter("numPerpage2"));
		} catch (NumberFormatException e) {
			numPerpage2 = 5;
		}
		this.numPerpage2 = numPerpage2;
		
		
		int totalPage = (int) Math.ceil((double) totalData / numPerpage2);

		int pageNo = ((cPage2 - 1) / pageBarSize) * pageBarSize + 1;

		int pageEnd = pageNo + pageBarSize - 1;

		System.out.println(cPage2 + " " + pageNo + " " + pageEnd);

		String pageBar2 = "";

		if (pageNo == 1) {
			pageBar2 += "<span>&nbsp[이전]&nbsp</span>";
		} else {
			pageBar2 += "<a href='" + request.getContextPath() + location + "&cPage2=" + (pageNo - 1) + "&numPerpage2="
					+ numPerpage2 + "'>[이전]</a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (cPage2 == pageNo) {
				pageBar2 += "<span>&nbsp" + pageNo + "&nbsp</span>";
			} else {
				pageBar2 += "<a href='" + request.getContextPath() + location + "&cPage2=" + pageNo + "&numPerpage2="
						+ numPerpage2 +"'>&nbsp" + pageNo
						+ "&nbsp</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar2 += "<span>&nbsp[다음]&nbsp</span>";
		} else {
			pageBar2 += "<a href='" + request.getContextPath() + location + "&cPage2=" + pageNo + "'>&nbsp[다음]&nbsp</a>";
		}
		
		this.pageBar2 = pageBar2;
	}

	public PageBar2(HttpServletRequest request, int totalData, int pageBarSize, String location, String query) {
		int cPage2;
		try {
			cPage2 = Integer.parseInt(request.getParameter("cPage2"));
		} catch (NumberFormatException e) {
			cPage2 = 1;
		}
		this.cPage2 = cPage2;
		
		
		
		int numPerpage2;
		try {
			numPerpage2 = Integer.parseInt(request.getParameter("numPerpage2"));
		} catch (NumberFormatException e) {
			numPerpage2 = 5;
		}
		this.numPerpage2 = numPerpage2;
		
		
		int totalPage = (int) Math.ceil((double) totalData / numPerpage2);

		int pageNo2 = ((cPage2 - 1) / pageBarSize) * pageBarSize + 1;

		int pageEnd = pageNo2 + pageBarSize - 1;

		System.out.println(cPage2 + " " + pageNo2 + " " + pageEnd);

		String pageBar2 = "";

		if (pageNo2 == 1) {
			pageBar2 += "<span>&nbsp[이전]&nbsp</span>";
		} else {
			pageBar2 += "<a href='" + request.getContextPath() + location + "?"+query+"&cPage2=" + (pageNo2 - 1) + "&numPerpage2="
					+ numPerpage2 + "'>[이전]</a>";
		}
		while (!(pageNo2 > pageEnd || pageNo2 > totalPage)) {
			if (cPage2 == pageNo2) {
				pageBar2 += "<span>&nbsp" + pageNo2 + "&nbsp</span>";
			} else {
				pageBar2 += "<a href='" + request.getContextPath() + location + "?"+query+"&cPage2=" + pageNo2 + "&numPerpage2="
						+ numPerpage2 + "'>&nbsp" + pageNo2
						+ "&nbsp</a>";
			}
			pageNo2++;
		}

		if (pageNo2 > totalPage) {
			pageBar2 += "<span>&nbsp[다음]&nbsp</span>";
		} else {
			pageBar2 += "<a href='" + request.getContextPath() + location + "?"+query+"&cPage2=" + pageNo2 + "'>&nbsp[다음]&nbsp</a>";
		}
		
		this.pageBar2 = pageBar2;
	}
	
	
	
	
	
	
	
	public String getPageBar() {
		return pageBar2;
	}


	public int getCPage() {
		return cPage2;
	}

	public int getNumPerpage() {
		return numPerpage2;
	}
	
}
