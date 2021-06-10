package com.semi.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyRenameFile implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		File newFile = null;
		
		do {
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd_HHmmss");
			int rnd =(int)(Math.random()*1500);
			String oriName= oldFile.getName();
			int dot = oriName.lastIndexOf(",");
			String ext ="";
			
			if(dot!=-1) {
				ext=oriName.substring(dot);
			}
			
			
			String newName = "formuscle_"+sdf.format(new Date(currentTime))+"_"+rnd+ext;
			newFile = new File(oldFile.getParent(), newName);
		}while(!createNewFile(newFile));
		return newFile;
	}
	
	
	private boolean createNewFile(File newFile) {
		try {
			return newFile.createNewFile();
		}catch(IOException e) {
			return false;
		}
	}

}
