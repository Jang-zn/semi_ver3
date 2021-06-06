package com.semi.common.filter;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	
	}
	private String getSHA512(String val) {
		String encValue;
		MessageDigest md = null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes=val.getBytes(Charset.forName("utf-8"));
		md.update(bytes);
		encValue=Base64.getEncoder().encodeToString(md.digest());
		return encValue;
	}
	
	@Override
	public String getParameter(String password) {
		String value;
		
		if(password.equals("password")||password.equals("password_new")) {
			value=getSHA512(super.getParameter(password));
		}else {
			value=super.getParameter("password");
		}
		return value;
	}
}
