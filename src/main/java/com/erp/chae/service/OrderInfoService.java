package com.erp.chae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.OrderInfoMapper;
import com.erp.chae.vo.OrderInfoVO;



	@Service
	public class OrderInfoService {
			@Autowired
			private OrderInfoMapper orderInfoMapper;

			public List<OrderInfoVO> getOrderInfos(OrderInfoVO orderInfoVO){
				return orderInfoMapper.getOrderInfos(orderInfoVO);
			}
			
			public OrderInfoVO getOrderInfo(OrderInfoVO orderInfoVO){
				return orderInfoMapper.getOrderInfo(orderInfoVO);
			}
			
			public boolean insertOrderInfo(OrderInfoVO orderInfoVO){
				if(orderInfoMapper.getOrderInfo(orderInfoVO)!=null) { 
					return false; 
				}
				return orderInfoMapper.insertOrderInfo(orderInfoVO) == 1;
			}
			
			public boolean updateOrderInfo(OrderInfoVO orderInfoVO){
				if(orderInfoMapper.getOrderInfo(orderInfoVO)!=null) { 
					return false; 
				}
				return orderInfoMapper.updateOrderInfo(orderInfoVO) == 1;
			}
			
			public boolean deleteOrderInfo(OrderInfoVO orderInfoVO){
				return orderInfoMapper.deleteOrderInfo(orderInfoVO) == 1;
			}

		}


