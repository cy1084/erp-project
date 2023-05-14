package com.erp.chae.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeInfoVO extends PageVO{
	private int niNum;
	private String niTitle;
	private String niContent;
	private String credat;
	private String cretim;
	private String active;
	private int uiNum;
	private MultipartFile niFile;
	private String niFilePath;
	private int niCnt;
	private String uiName;
}
