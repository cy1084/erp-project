package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.ProductInfoVO;


public interface ProductInfoMapper {
	List<ProductInfoVO> getProductInfos(ProductInfoVO productInfoVO);
	
	ProductInfoVO getProductInfo(ProductInfoVO productInfoVO);
	
	int insertProductInfo(ProductInfoVO productInfoVO);
	
	int updateProductInfo(ProductInfoVO productInfoVO);
	
	int deleteProductInfo(ProductInfoVO productInfoVO);

}
