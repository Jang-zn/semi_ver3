package com.semi.board.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.board.model.service.*;

/**
 * Servlet implementation class DeleteBoardServlet
 */
@WebServlet("/board/delete")
public class DeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath("/upload/board/");
		int boardNo = Integer.parseInt(request.getParameter("no"));
		
		String[] files = new String[5];
		files =new BoardService().filesName(boardNo);
		for(int i=0; i<5; i++) {
			String a = files[i];
			File f = new File(path+a);
			if(f.exists())
				f.delete();
		}
		int result = new BoardService().boardDelete(boardNo);
		int fileresult = new BoardService().fileDelete(boardNo);
		
		
		String msg ="";
		String loc ="/board/boardList?numPerpage=15";
		
		if(result>0) {
			msg ="글 삭제완료!";
		}else {
			msg="글삭제 실패!";
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/error/errorPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
