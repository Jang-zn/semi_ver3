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
		

		PageBar sp = new PageBar(request, boardListCount, 5, "/board/boardList");

		request.setAttribute("pageBar",sp.getPageBar());
		
		List<Board> list = new BoardService().boardList(sp.getCPage(),sp.getNumPerpage());
		List<Boolean> fileyumu = new ArrayList();
		for(Board b : list) {
			int result = new BoardService().fileyumu(b.getContentNo());
		
			fileyumu.add(result!=0?false:true);
		};
		
		request.setAttribute("fileyumu", fileyumu); 
		request.setAttribute("boardList", list);
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
