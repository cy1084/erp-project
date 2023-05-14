package com.erp.chae.vo;

import lombok.Data;

@Data
public class OffInfoVO extends PageVO{ //offUseInfoVO
	private int oiNum;
	private String oiYear;
	private int oiDay;
	private int uiNum;
	private String uiName;
	private String uiId;
	private int useDay;
	private int leftDay;
}