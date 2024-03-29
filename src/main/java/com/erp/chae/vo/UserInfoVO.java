package com.erp.chae.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserInfoVO extends PageVO{
	private int uiNum;
	private String uiName;
	private String uiId;
	private String uiPwd;
	private String uiBirth;
	private String uiTrans;
	private String uiEmail;
	private String uiAddress;
	private String credat;
	private String cretim;
	private String outdat;
	private String active;
	private String uiLvl;
	private String giName;
	private String diName;
	private String uiDuties; //담당업무
	private int notiCnt;
	private int diNum;
	private int giNum;	
	private String wiStart;
	private String wiEnd;
	private int wiNum;
	private String wiEtc; //근무시간
	private String wiDate;
	private List<NoticeInfoVO> notis;
	private List<UserCertiVO> certies;
	private List<OffUseInfoVO> offUses;
	private MultipartFile uiFile;
	private String uiFilePath;
	private int oiNum;
	private int uiBasepay;
	private int uiExtension;
	private int uiMeal;
	private int uiCarmaintenance;
	private int uiEdu;
	private int uiSpecial;
	private int uiRetirement;
	private WorkingInfoVO working;
	private OffInfoVO off;
	
	
}
