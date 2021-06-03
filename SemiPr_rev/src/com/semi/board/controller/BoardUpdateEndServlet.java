package com.semi.board.controller;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import com.semi.board.model.service.*;
import com.semi.board.model.vo.*;

/**
 * Servlet implementation class BoardUpdateEndServlet
 */
@WebServlet("/board/updateEnd")
public class BoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	if(!ServletFileUpload.isMultipartContent(request)) {
			
			return;
		}
		String path = getServletContext().getRealPath("/Resource/upload/board/");
		MultipartRequest mr = new MultipartRequest(request, path,1024*1024*10,"utf-8",new DefaultFileRenamePolicy());
		Board b = new Board();
		b.setCategory(mr.getParameter("classfication"));
		b.setContentNo(Integer.parseInt(mr.getParameter("contentNo")));
		b.setTitle(mr.getParameter("title"));
		b.setWriter(mr.getParameter("writer"));
		b.setContent(mr.getParameter("content"));
		b.setContentNo(Integer.parseInt(mr.getParameter("contentNo")));
		b.setMemberId(mr.getParameter("memberId"));
		int result = new BoardService().updateBoard(b);
		
		for(int i=0; i<5; i++) {
			if(mr.getFilesystemName("upload"+i)!=null) {
				result = new BoardService().boardfile(b.getContentNo(), mr.getFilesystemName("upload"+i));
				
				 File del = new File(path+mr.getParameter("oldfileR"+i)); del.delete();
				 new BoardService().deleteFile(mr.getParameter("oldfileR"+i));
				 
			}
			else if(mr.getFilesystemName("upload"+i)==null&&mr.getFilesystemName("oldfile"+i)!=null) {
				
				
			}
			/*else if(mr.getFilesystemName("upload"+i)==null&&mr.getFilesystemName("oldfile"+i)==null) {
				File del = new File(path+mr.getParameter("oldfileR"+i));
				del.delete();
				new BoardService().deleteFile(mr.getParameter("oldfileR"+i));
			}*/
		}
		String msg ="";
		String loc ="";
		if(result>0) {
			msg ="수정성공!";
			loc ="/board/boardList";
		}else {
			msg="수정실패!";
			loc="/board/update?no="+b.getContentNo();
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
