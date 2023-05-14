package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.SalaryInfoVO;

public interface SalaryInfoMapper {
	
	List<SalaryInfoVO> getSalaryInfos(SalaryInfoVO salaryInfoVO);
	
	SalaryInfoVO getSalaryInfo(SalaryInfoVO salaryInfoVO);
	
	List<SalaryInfoVO> getMySalaryInfo(SalaryInfoVO salaryInfoVO);
	
	int insertSalaryInfo(SalaryInfoVO salaryInfoVO);
	
	int updateSalaryInfo(SalaryInfoVO salaryInfoVO);
	
	int deleteSalaryInfo(SalaryInfoVO salaryInfoVO);

}
