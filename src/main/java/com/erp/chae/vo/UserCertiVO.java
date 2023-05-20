package com.erp.chae.vo;

import lombok.Data;

@Data
public class UserCertiVO extends PageVO{
	private String ucNum;
	private String periodStart;
	private String periodEnd;
	private String ucType;
	private String ucActive;
	private String credat;
	private String cretim;
	private int uiNum;
	private String url;
	private String uiId;
	private String uiName;
	private int uiLvl;
}
