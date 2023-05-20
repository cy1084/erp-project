package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.CustomerInfoVO;

public interface CustomerInfoMapper {
	List<CustomerInfoVO> getCustomerInfos(CustomerInfoVO customerInfoVO);
	
	CustomerInfoVO getCustomerInfo(CustomerInfoVO customerInfoVO);
	
	int insertCustomerInfo(CustomerInfoVO customerInfoVO);
	
	int updateCustomerInfo(CustomerInfoVO customerInfoVO);
	
	int deleteCustomerInfo(CustomerInfoVO customerInfoVO);

}
