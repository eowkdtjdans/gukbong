package com.spring.biz.profileImage;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("fileUploadService")
public class FileUploadService {
	private static final String SAVE_PATH = "C:/MyStudy/GIT/gukbong/LastProject/src/main/webapp/views/img/upload";
	/*private static final String SAVE_PATH = "C:/MyStudy/GIT/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/LastProject/views/img/upload/";*/
	private static final String PREFIX_URL = "/views/img/upload/";
	
	public String fileUpload(MultipartFile multipartFile) {
		String url = null;
		
		try {
			String originFilename = multipartFile.getOriginalFilename();
			System.out.println("originFilename: " + originFilename);
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			
			Long size = multipartFile.getSize();
			String saveFileName = saveFileName(extName);
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			saveFileDir(multipartFile, saveFileName);
			
			url = PREFIX_URL + saveFileName;
			
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		return url;
	}
	
	private String saveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
	    fileName += calendar.get(Calendar.YEAR);
	    fileName += calendar.get(Calendar.MONTH);
	    fileName += calendar.get(Calendar.DATE);
	    fileName += calendar.get(Calendar.HOUR);
	    fileName += calendar.get(Calendar.MINUTE);
	    fileName += calendar.get(Calendar.SECOND);
	    fileName += calendar.get(Calendar.MILLISECOND);
	    fileName += extName;
		
		return fileName;
	}
	
	private boolean saveFileDir(MultipartFile multipartFile, String saveFileName) throws IOException {
		boolean result = false;
		
		byte[] data =multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
}
