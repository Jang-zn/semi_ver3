package com.semi.common;

import java.io.*;
import java.nio.charset.*;
import java.security.*;
import java.util.*;

import javax.crypto.*;

public class AESEncrypt {
	
	private static SecretKey key; 
	
	private String path; 
	
	public AESEncrypt() {
		this.path = AESEncrypt.class.getResource("/").getPath();
		this.path = this.path.substring(0,this.path.indexOf("classes"));
		File file = new File(this.path+"Semi.key");
		if(file.exists()) {
			try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
				key = (SecretKey)ois.readObject();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			generateKey();
		}
	}
	
	private void generateKey() {
		SecureRandom secure = new SecureRandom();
		KeyGenerator keyGen = null;
		try {
			keyGen = KeyGenerator.getInstance("AES");
			keyGen.init(128,secure); //비트, sort
			AESEncrypt.key = keyGen.generateKey();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		File file = new File(this.path+"Semi.key");
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(file))){
			oos.writeObject(AESEncrypt.key);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static String encrypt(String value) throws Exception{
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE,AESEncrypt.key);
		byte[] beforeEnc = value.getBytes(Charset.forName("utf-8"));
		byte[] afterEnc = cipher.doFinal(beforeEnc);
		return Base64.getEncoder().encodeToString(afterEnc);
	}
	
	public static String decrypt(String value) throws Exception{
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, AESEncrypt.key);
		byte[] byteVal = value.getBytes(Charset.forName("utf-8"));
		byte[] beforeDec = Base64.getDecoder().decode(byteVal);
		byte[] afterDec = cipher.doFinal(beforeDec);
		return new String(afterDec);
	}
}
