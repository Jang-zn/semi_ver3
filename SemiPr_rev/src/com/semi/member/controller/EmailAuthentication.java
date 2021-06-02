package com.semi.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class EmailAuthentication
 */
@WebServlet("/member/emailAuth")
public class EmailAuthentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailAuthentication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		
		String host="smtp.naver.com";
		String id ="ownlife13@naver.com";
		String password = "formuscle1234!";
		String to_email = email;
		Properties p = new Properties();
		
		//SMTP 서버 정보 설정
		 p.put("mail.smtp.host", host);
         p.put("mail.smtp.port", 465);
         p.put("mail.smtp.auth", "true");
         p.put("mail.smtp.ssl.enable", "true");
		
         //인증 번호 생성기
         StringBuffer temp =new StringBuffer();
         Random rnd = new Random();
         for(int i=0;i<10;i++)
         {
             int rIndex = rnd.nextInt(3);
             switch (rIndex) {
             case 0:
                 // a-z
                 temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                 break;
             case 1:
                 // A-Z
                 temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                 break;
             case 2:
                 // 0-9
                 temp.append((rnd.nextInt(10)));
                 break;
             }
         }
         String AuthenticationKey = temp.toString();
         System.out.println(AuthenticationKey);
         
         Session session = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
             protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(id,password);
             }
         });
         try {
             MimeMessage msg = new MimeMessage(session);
             msg.setFrom(new InternetAddress(id, "for muscle"));
             msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
             
             //메일 제목
             msg.setSubject("안녕하세요 formuscle 인증 메일입니다.");
             //메일 내용
             msg.setText("인증 번호는 :"+temp);
             
             Transport.send(msg);
             System.out.println("이메일 전송");
             
         }catch (Exception e) {
             e.printStackTrace();
         }
         HttpSession saveKey = request.getSession();
 		saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
	}
         
      
		

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
