package com.erp.chae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.erp.chae.mapper.SalaryInfoMapper;
import com.erp.chae.vo.SalaryInfoVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SalaryInfoService {
 
		@Autowired
		private SalaryInfoMapper salaryInfoMapper;

		public PageInfo<SalaryInfoVO> getSalaryInfos(SalaryInfoVO salaryInfoVO){
			PageHelper.startPage(salaryInfoVO.getPage(), salaryInfoVO.getRows());
			List<SalaryInfoVO> list=salaryInfoMapper.getSalaryInfos(salaryInfoVO);
			return new PageInfo<>(list);
		}
		
		public SalaryInfoVO getSalaryInfo(SalaryInfoVO salaryInfoVO){
			return salaryInfoMapper.getSalaryInfo(salaryInfoVO);
		}
		
		public PageInfo<SalaryInfoVO> getMySalaryInfo(SalaryInfoVO salaryInfoVO){
			PageHelper.startPage(salaryInfoVO.getPage(), salaryInfoVO.getRows());
	
			List<SalaryInfoVO> list=salaryInfoMapper.getMySalaryInfo(salaryInfoVO);
			return new PageInfo<>(list);
		}
		
		public boolean insertSalaryInfo(SalaryInfoVO salaryInfoVO){
			if(salaryInfoMapper.getSalaryInfo(salaryInfoVO)!=null) { 
				return false; 
			}
			return salaryInfoMapper.insertSalaryInfo(salaryInfoVO) == 1;
		}
		
		public boolean updateSalaryInfo(SalaryInfoVO salaryInfoVO){
			if(salaryInfoMapper.getSalaryInfo(salaryInfoVO)!=null) { 
				return false; 
			}
			return salaryInfoMapper.updateSalaryInfo(salaryInfoVO) == 1;
		}
		
		public boolean deleteSalaryInfo(SalaryInfoVO salaryInfoVO){
			return salaryInfoMapper.deleteSalaryInfo(salaryInfoVO) == 1;
		}

	}


