package com.semi.gallary.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.common.PageBar;
import com.semi.gallary.model.service.GallaryService;
import com.semi.gallary.model.vo.Gallary;
import com.semi.member.model.vo.Member;



/**
 * Servlet implementation class GallaryListServlet
 */
@WebServlet("/gallary/list")
public class GallaryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GallaryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("logged");
		String memberId = loginMember.getMemberId();
		
		
		int totalData = new GallaryService().selectGallaryCount(memberId);
		String location ="/gallary/list";
		
		PageBar pb = new PageBar(request,totalData,5,location);
		
		request.setAttribute("pageBar",pb.getPageBar());
		
		List<Gallary> list=new GallaryService().selectGallaryList(memberId,pb.getCPage(),pb.getNumPerpage());
		
		request.setAttribute("list", list);
		
		
		
		
		request.getRequestDispatcher("/views/gallary/noonList.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
