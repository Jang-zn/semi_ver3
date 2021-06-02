package com.semi.board.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.board.model.service.*;
import com.semi.board.model.vo.*;

/**
 * Servlet implementation class InsertBoardCommentServlet
 */
@WebServlet("/board/InsertNoticeComment")
public class InsertBoardCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String CommentContent = request.getParameter("CommentContent");
		System.out.println(CommentContent);
		String userId = request.getParameter("userId");
		int replyNoRef = Integer.parseInt(request.getParameter("replyNoRef"));
		int replyLevel = Integer.parseInt(request.getParameter("replyLevel"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Reply re = new Reply(0,boardNo,userId,CommentContent,null,replyLevel,replyNoRef);
		int result = new BoardService().insertComment(re);
		String msg="";
		if(result>0) {
			msg="댓글 등록 성공!";
			
		}else {
			msg="댓글 등록 실패!";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/board/content?no="+boardNo);
		
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
