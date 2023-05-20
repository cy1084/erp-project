package com.erp.chae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.CustomerInfoMapper;
import com.erp.chae.vo.CustomerInfoVO;

@Service
public class CustomerInfoService {
		@Autowired
		private CustomerInfoMapper customerInfoMapper;

		public List<CustomerInfoVO> getCustomerInfos(CustomerInfoVO customerInfoVO){
			return customerInfoMapper.getCustomerInfos(customerInfoVO);
		}
		
		public CustomerInfoVO getCustomerInfo(CustomerInfoVO customerInfoVO){
			return customerInfoMapper.getCustomerInfo(customerInfoVO);
		}
		
		public boolean insertCustomerInfo(CustomerInfoVO customerInfoVO){
			if(customerInfoMapper.getCustomerInfo(customerInfoVO)!=null) { 
				return false; 
			}
			return customerInfoMapper.insertCustomerInfo(customerInfoVO) == 1;
		}
		
		public boolean updateCustomerInfo(CustomerInfoVO customerInfoVO){			
			return customerInfoMapper.updateCustomerInfo(customerInfoVO) == 1;
		}
		
		public boolean deleteCustomerInfo(CustomerInfoVO customerInfoVO){
			return customerInfoMapper.deleteCustomerInfo(customerInfoVO) == 1;
		}
	}



