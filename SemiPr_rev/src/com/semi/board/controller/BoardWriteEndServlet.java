package com.semi.board.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.servlet.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

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
		String path = getServletContext().getRealPath("");
		MultipartRequest mr = new MultipartRequest(request, path,1024*1024*10,"utf-8",new DefaultFileRenamePolicy());
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
