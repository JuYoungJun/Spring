package com.mat.mvc.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mat.mvc.dao.AdminDAO;
import com.mat.mvc.service.AdminService;
import com.mat.mvc.vo.*;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;

	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public List<GoodsVO> goodslist() throws Exception {
		return dao.goodslist();
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	@Override
	public void updateGoods(GoodsVO vo) throws Exception {
		dao.updateGoods(vo);
	}

	@Override
	public void deleteGoods(int gdsNum) throws Exception {
		dao.deleteGoods(gdsNum);
	}
}
