package com.semi.board.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.board.model.service.*;
import com.semi.board.model.vo.*;
import com.semi.common.*;

/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/board/boardSearch")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		int totalData = new BoardService().boardSearchCount(searchType,searchKeyword);
		PageBar p1 = new PageBar(request, totalData, 5, "/board/boardSearch", "&searchKeyword="+searchKeyword+"&searchType="+searchType);
		List<Board> list = new BoardService().boardsearch(searchType,searchKeyword,p1.getCPage(),p1.getNumPerpage());
		List<Boolean> a = new ArrayList();
		for(Board b : list) {
			int result = new BoardService().fileyumu(b.getContentNo());
		
			a.add(result!=0?false:true);
		};
		
		
		List<Boolean> fileyumu = new ArrayList();
		for(Board b : list) {
			int result = new BoardService().fileyumu(b.getContentNo());
		
			fileyumu.add(result!=0?false:true);
		};
		
		request.setAttribute("fileyumu", fileyumu); 
		request.setAttribute("searchKeyword", searchKeyword);
		request.setAttribute("searchType", searchType);
		request.setAttribute("pageBar",p1.getPageBar());
		request.setAttribute("boardList", list);
		request.setAttribute("boardListCount", totalData);
		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
