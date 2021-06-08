package com.semi.member.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailAuthentication {

	public String connectEmail(String email) {
		 
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
		//네이버 smtp 계정막힘
		String host="smtp.gmail.com"; //smtp 서버
        String id ="formuscle123@gmail.com"; // 네이버/구글 계정(보내는 사람)
        String password = "formuscle123123"; //패스워드
		String from ="관리자"; //보내는 이름 설정
		String toEmail = email;  //받는 이메일 주소
		String subject="ForMuscle 인증번호입니다. "; //보내는 제목 설정
		String content ="인증번호 ["+temp+"]입니다."; //이메일 내용설정
		System.out.println(toEmail);
		Properties p = new Properties();
		
		//SMTP 서버 정보 설정
		p.put("mail.smtp.host", host); //이메일 발송을 처리해줄 stmp서버
		p.put("mail.smtp.port", 465); 
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable","true"); //명시적 보안
        p.put("mail.smtp.ssl.enable", "true");
		
        
         String AuthenticationKey = temp.toString();
         System.out.println(AuthenticationKey);
         Session session = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
             protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(id,password);
             }
         });
         session.setDebug(true); //for debug
        
         try {
        	 //메세지 작성은 javax.mail.Message 클래스 이용
        	 //MimeMessage 클래스로 from, to, title, content etc... 설정
             MimeMessage msg = new MimeMessage(session);
             msg.setFrom(new InternetAddress(id)); //보내는 사람
             InternetAddress to = new InternetAddress(toEmail,"인범");
             InternetAddress[] toList= {to};
             msg.setRecipients(Message.RecipientType.TO, toList);
             //msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail)); //받는 사람
            
             
             
             //메일 제목
             msg.setSubject(subject);
             
             //메일 내용
             msg.setText(content);
             
             Transport.send(msg); //javax.mail.Transport.send() 이용


             System.out.println("이메일 전송");
             
         }catch(MessagingException e){
        	 e.printStackTrace();
         }catch(Exception e){
        	 e.printStackTrace();
         }
         return AuthenticationKey;
	}
}
