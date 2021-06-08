package com.semi.board.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.servlet.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import com.semi.board.model.service.*;
import com.semi.board.model.vo.*;

/**
 * Servlet implementation class BoardWriteEndServlet
 */
@WebServlet("/board/boardWriteEnd")
public class BoardWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteEndServlet() {
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
		b.setTitle(mr.getParameter("title"));
		b.setWriter(mr.getParameter("writer"));
		b.setContent(mr.getParameter("content"));
		b.setMemberId(mr.getParameter("memberId"));
		int result = new BoardService().insertBoard(b);
		int cNo = new BoardService().boardContentNo();
		String f1 = mr.getFilesystemName("upload0");
		String f2 = mr.getFilesystemName("upload1");
		String f3 = mr.getFilesystemName("upload2");
		String f4 = mr.getFilesystemName("upload3");
		String f5 = mr.getFilesystemName("upload4");
		String[] f = new String[5];
		f[0] = f1;
		f[1] = f2;
		f[2] = f3;
		f[3] = f4;
		f[4] = f5;
		
		int result2 = 0;
		if(cNo!=0) {
			for(int i=0; i<5; i++) {
					if(f[i]==null) {
						break;
					}
				 result2 = new BoardService().boardfile(cNo,f[i]);
			}
		}else {
			result2 = 0;
		}
		String msg ="";
		String loc ="";
		if(result>0) {
			msg ="등록성공!";
			loc ="/board/boardList?numPerpage=15";
			
		}else {
			msg="등록실패!";
			loc="/board/write";
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
