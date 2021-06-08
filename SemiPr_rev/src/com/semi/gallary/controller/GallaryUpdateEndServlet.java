package com.semi.gallary.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.semi.gallary.model.service.GallaryService;
import com.semi.gallary.model.vo.Gallary;

/**
 * Servlet implementation class GallaryUpdateEndServlet
 */
@WebServlet("/gallary/updateGallaryEnd")
public class GallaryUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GallaryUpdateEndServlet() {
        super();
   
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("msg", "수정실패");
			request.setAttribute("loc", "/gallary/list");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			return;
		}
		String path=getServletContext().getRealPath("/upload/gallary");
		MultipartRequest mr=new MultipartRequest(request,path,1024*1024*50,
				"utf-8",new DefaultFileRenamePolicy());
		
		Gallary g=new Gallary();
		g.setContent(mr.getParameter("content"));
		g.setGalNo(Integer.parseInt(mr.getParameter("galno")));
		
		String fileName=mr.getFilesystemName("imgUp");
		File f=mr.getFile("imgUp");
		
		if(f!=null&&f.length()>0) {

			File del=new File(path+mr.getParameter("oldFile"));
			del.delete();
		}else {
		
			fileName=mr.getParameter("oldFile");
		}
		g.setImgName(fileName);
		System.out.println(g.getGalNo());
		System.out.println(g.getContent());
		System.out.println(g.getImgName());
		
		
		
		int result=new GallaryService().updateGallary(g);
		int result2 =new GallaryService().updateImg(g);
		System.out.println(result+ "," +result2);
		
		
		String msg="";
		String loc="";
		if(result>0&&result2>0) {
			msg="수정되었습니다.";
			loc="/gallary/list?numPerpage=6";
		}else {
			//수정실패
			msg="수정 실패";
			loc="/gallary/updateGallary";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request,response);
		
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
