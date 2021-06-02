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
 * Servlet implementation class BoardContentServlet
 */
@WebServlet("/board/content")
public class BoardContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardListCount = new BoardService().boardListCount();
		
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		boolean readFlag=false;
	      String boardReadNo="";
	      Cookie[] cookies=request.getCookies();
	      if(cookies!=null) {
	         for(Cookie c : cookies) {
	            String name=c.getName();
	            String value=c.getValue();
	            if(name.equals("noticeReadNo")) { 
	               if(value.contains("|"+no+"|")) {
	                  readFlag=true;
	                  break;
	               }
	               boardReadNo=value;
	            }
	         }
	      }
	      if(!readFlag) {
	         Cookie c=new Cookie("boardReadNo",boardReadNo+"|"+no+"|");
	         c.setMaxAge(-1);
	         response.addCookie(c);
	      }
	      
	      
	      
	      Board b = new BoardService().boardContent(no,readFlag);
	      String[] list2 = new BoardService().selectBoardfile(no);
	      request.setAttribute("boardListCount",boardListCount);
	      request.setAttribute("board", b);
	      
	      PageBar sp = new PageBar(request, boardListCount, 5, "/board/boardList");
		  request.setAttribute("pageBar",sp.getPageBar());
		  List<Board> list = new BoardService().boardList(sp.getCPage(),sp.getNumPerpage());
			List<Boolean> fileyumu = new ArrayList();
			for(Board bb : list) {
				int result = new BoardService().fileyumu(bb.getContentNo());
			
				fileyumu.add(result!=0?false:true);
			};
			
			request.setAttribute("fileyumu", fileyumu); 
		  
		  request.setAttribute("boardList", list);
		  request.setAttribute("selectBoardFile", list2);
		  	
		  //댓글
		  List<Reply> re = new BoardService().commentList(no);
		  request.setAttribute("commentList", re);
		  
		  request.getRequestDispatcher("/views/board/boardContent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
