package com.semi.board.controller;

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownLoadServlet
 */
@WebServlet("/board/fileDonwLoad")
public class FileDownLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			String fileName = request.getParameter("filename");
			String path = getServletContext().getRealPath("/Resource/upload/board/");//-> 서블릿 안에서만 가능
			File f= new File(path+fileName);
			FileInputStream is = new FileInputStream(f);
			BufferedInputStream bis = new BufferedInputStream(is);
			String fileRename = "";
			String header = request.getHeader("user-agent");
			boolean isMS = header.contains("Trident")||header.contains("MSIE");
			if(isMS) {
				fileRename=URLEncoder.encode(fileName,"utf-8").replaceAll("\\+","%20");
			}else {
				fileRename=new String(fileName.getBytes("UTF-8"),"ISO_8859-1");
			}
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment;filename="+fileRename);
			ServletOutputStream sos =response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			int read=-1;
			while((read=bis.read())!=-1) {
				bos.write(read);
			}
			bis.close();
			bos.close();					
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
