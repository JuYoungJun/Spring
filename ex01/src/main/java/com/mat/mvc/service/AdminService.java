package com.mat.mvc.service;

import java.util.List;

import com.mat.mvc.vo.CategoryVO;

public interface AdminService {
	
	// 카테고리
	public List<CategoryVO> category() throws Exception;

}
