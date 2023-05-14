package com.erp.chae.vo;

import lombok.Data;

@Data
public class SalaryInfoVO extends PageVO{
	private int siNum;
	private int uiNum;
	private int basePay;
	private int extensionAllowance;
	private int mealAllowance;
	private int overtimeAllowance;
	private int carMaintenance;
	private int eduExpense;
	private int dutyAllowance;
	private int specialAllowance;
	private int retirementPay;
	private int siYear;
	private String uiName;
	private String uiId;

}
