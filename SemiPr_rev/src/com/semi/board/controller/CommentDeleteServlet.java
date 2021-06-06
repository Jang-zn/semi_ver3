package com.semi.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.model.service.*;

/**
 * Servlet implementation class CommentDeleteServlet
 */
@WebServlet("/board/deleteComment")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				int no = Integer.parseInt(request.getParameter("commentNo"));
				int boardNo =  Integer.parseInt(request.getParameter("boardNo"));
				int result = new BoardService().commentDelete(no);
				String msg="";
				String loc="/board/content?no="+boardNo;
				if(result>0) {
					msg="댓글삭제 완료";
				}else {
					msg="댓글삭제 실패";
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
