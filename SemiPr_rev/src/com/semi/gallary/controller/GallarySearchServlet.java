package com.semi.gallary.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.gallary.model.service.GallaryService;
import com.semi.gallary.model.vo.Gallary;

/**
 * Servlet implementation class GallarySearchServlet
 */
@WebServlet("/gallary/noonListSearch")
public class GallarySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GallarySearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerpage;
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerpage=5;
		}
		
		
		
		String keyword=request.getParameter("searchKeyword");
		System.out.println("keyword" + keyword);
		
		List<Gallary> list=new GallaryService().selectSearchGallary(cPage,numPerpage,keyword);
		int totalData=new GallaryService().selectSearchGallaryCount(keyword);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/gallary/noonListSearch?cPage="+(pageNo-1)
			+"&searchKeyword="+keyword+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/gallary/noonListSearch?cPage="+pageNo
				+"&searchKeyword="+keyword+"'>"
				+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/gallary/noonListSearch?cPage="+pageNo
			+"&searchKeyword="+keyword+"'>[다음]</a>";
		}
		
		
		request.setAttribute("pageBar", pageBar);
		
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/gallary/noonList.jsp")
		.forward(request, response);
	
	
	
	}

		
		
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
