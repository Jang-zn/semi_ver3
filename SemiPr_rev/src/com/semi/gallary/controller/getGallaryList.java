package com.semi.gallary.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.semi.gallary.model.service.GallaryService;
import com.semi.gallary.model.vo.Gallary;

/**
 * Servlet implementation class getGallaryList
 */
@WebServlet("/gallary/getGallaryList")
public class getGallaryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getGallaryList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int galNo= Integer.parseInt(request.getParameter("gal_no"));
		Gallary g=new GallaryService().getNoonList(galNo);
		System.out.println("galNO :" +galNo);
		System.out.println("img,content " + g.getContent()+""+g.getImgName()+""+g.getGalNo());
		System.out.println("date :" +g.getGallaryDate());
		

		DateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		Date date = new Date();        
		
		
		String galdate=dateFormat.format(g.getGallaryDate());
		System.out.println("galdate :" +g.getGallaryDate());

		JSONObject jo=new JSONObject();
		jo.put("imgName", g.getImgName());
		jo.put("content", g.getContent());
		jo.put("galNo", g.getGalNo());

		jo.put("galDate", galdate);
		
		System.out.println("jo:"+jo);
		
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(jo);
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
