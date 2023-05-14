package com.erp.chae.util;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Component
public class UploadFileUtil {

	@Value("${upload.file.path}")
	private String uploadFilePath;
	
	public <T> void saveFile(T clazz, String methodName) {
		try {
			Method getMethod = clazz.getClass().getMethod("get" + methodName,null);
			Method setMethod = clazz.getClass().getMethod("set" + methodName + "Path", String.class);
			MultipartFile mf = (MultipartFile) getMethod.invoke(clazz, null);
			String filePath = saveFile(mf);
			setMethod.invoke(clazz, filePath);
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public String saveFile(MultipartFile mf, String... fileNames) throws IllegalStateException, IOException {
		if(mf==null) {
			return  null;
		}
		String fileName = UUID.randomUUID().toString();
		if(fileNames.length!=0) {
			fileName = fileNames[0];
		}
		String extName = mf.getOriginalFilename();
		if(extName.lastIndexOf(".")!=0) {
			extName = extName.substring(extName.lastIndexOf("."));
		}
		
		File file = new File(uploadFilePath,fileName+extName);
		mf.transferTo(file);
		return file.getName();
	}
	
	public List<String> saveFiles(List<MultipartFile> mfs) throws IllegalStateException, IOException {
		List<String> pathList = new ArrayList<>();
		for(MultipartFile mf : mfs) {
			pathList.add(saveFile(mf));
		}
		return pathList;
	}
	
}
