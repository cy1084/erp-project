package com.erp.chae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.chae.mapper.ProductInfoMapper;
import com.erp.chae.vo.ProductInfoVO;


	@Service
	public class ProductInfoService {
			@Autowired
			private ProductInfoMapper productInfoMapper;

			public List<ProductInfoVO> getProductInfos(ProductInfoVO productInfoVO){
				return productInfoMapper.getProductInfos(productInfoVO);
			}
			
			public ProductInfoVO getProductInfo(ProductInfoVO productInfoVO){
				return productInfoMapper.getProductInfo(productInfoVO);
			}
			
			public boolean insertProductInfo(ProductInfoVO productInfoVO){
				if(productInfoMapper.getProductInfo(productInfoVO)!=null) { 
					return false; 
				}
				return productInfoMapper.insertProductInfo(productInfoVO) == 1;
			}
			
			public boolean updateProductInfo(ProductInfoVO productInfoVO){
				if(productInfoMapper.getProductInfo(productInfoVO)!=null) { 
					return false; 
				}
				return productInfoMapper.updateProductInfo(productInfoVO) == 1;
			}
			
			public boolean deleteProductInfo(ProductInfoVO productInfoVO){
				return productInfoMapper.deleteProductInfo(productInfoVO) == 1;
			}

		}


