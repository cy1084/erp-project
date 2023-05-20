package com.erp.chae.mapper;

import java.util.List;

import com.erp.chae.vo.NoticeInfoVO;

public interface UiNiMapper {

	List<NoticeInfoVO> selectNotis(int uiNum);
	int insertUiNiMap(NoticeInfoVO niVO);
	int deleteUiNiMap(int uiNum);
}
