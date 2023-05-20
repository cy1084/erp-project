package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.OrderInfoVO;


public interface OrderInfoMapper {
	
	List<OrderInfoVO> getOrderInfos(OrderInfoVO orderInfoVO);
	
	OrderInfoVO getOrderInfo(OrderInfoVO orderInfoVO);
	
	int insertOrderInfo(OrderInfoVO orderInfoVO);
	
	int updateOrderInfo(OrderInfoVO orderInfoVO);
	
	int deleteOrderInfo(OrderInfoVO orderInfoVO);

}
