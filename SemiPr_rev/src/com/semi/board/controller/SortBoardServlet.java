package com.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.model.service.BoardService;
import com.semi.board.model.vo.Board;
import com.semi.common.PageBar;

/**
 * Servlet implementation class SortBoardServlet
 */
@WebServlet("/board/boardSort")
public class SortBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");

		
		int sortBoardCount = new BoardService().sortBoardListCount(type);
		PageBar pagebar = new PageBar(request,sortBoardCount,5,"/board/boardSort","&type="+type); 
		
		List<Board> list = new BoardService().sortBoardList(type,pagebar.getCPage(),pagebar.getNumPerpage());
		
		
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
		System.out.println(pagebar.getPageBar());
		request.setAttribute("fileyumu", fileyumu); 
		
		request.setAttribute("boardListCount", sortBoardCount);
		request.setAttribute("boardList", list);
		request.setAttribute("pageBar", pagebar.getPageBar());
		request.setAttribute("sortType", type);
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
