package com.mat.mvc.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mat.mvc.dao.AdminDAO;
import com.mat.mvc.service.AdminService;
import com.mat.mvc.vo.CategoryVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;

	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

}
