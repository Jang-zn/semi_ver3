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
 * Servlet implementation class Servlet
 */
@WebServlet(urlPatterns = { "/board/boardList" })
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardListCount = new BoardService().boardListCount();
		request.setAttribute("boardListCount",boardListCount);
		
		ServletPageBar sp = new ServletPageBar(request, boardListCount, 5, "/board/boardList");
		
		request.setAttribute("pageBar",sp.getPageBar());
		
		List<Board> list = new BoardService().boardList(sp.getCPage(),sp.getNumPerpage());
		List<Boolean> fileyumu = new ArrayList();
		for(Board b : list) {
			int result = new BoardService().fileyumu(b.getContentNo());
		
			fileyumu.add(result!=0?false:true);
		};
		
		request.setAttribute("fileyumu", fileyumu); 
		request.setAttribute("boardList", list);
		request.getRequestDispatcher("/views/board/new_boardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
