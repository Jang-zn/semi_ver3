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
		String path = getServletContext().getRealPath("/Resource/upload/board");
		MultipartRequest mr = new MultipartRequest(request, path,1024*1024*10,"utf-8",new DefaultFileRenamePolicy());
		Board b = new Board();
		b.setCategory(mr.getParameter("classfication"));
		b.setTitle(mr.getParameter("title"));
		b.setWriter(mr.getParameter("writer"));
		b.setContent(mr.getParameter("content"));
		b.setContentNo(Integer.parseInt(mr.getParameter("contentNo")));
		b.setMemberId(mr.getParameter("memberId"));
		int result = new BoardService().updateBoard(b);
		System.out.println("결과는:"+result);
		int cNo = new BoardService().boardContentNo();
		
		File f0= mr.getFile("upload0");
		File f1= mr.getFile("upload1");
		File f2= mr.getFile("upload2");
		File f3= mr.getFile("upload3");
		File f4= mr.getFile("upload4");
		if(f0!=null&&f0.length()>0) {
			//만약 새로운 파일명이 한다면 이전파일을 삭제함
			//새로운파일이 전달 됨.
			//전에파일 삭제함
			File del = new File(path+mr.getParameter("oldFile"));
			//if문 안해줘도 되긴함
				del.delete();
			
			
		}else {
			//새로운 파일이 없을경우
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
