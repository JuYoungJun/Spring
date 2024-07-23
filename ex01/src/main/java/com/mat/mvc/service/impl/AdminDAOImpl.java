package com.mat.mvc.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mat.mvc.dao.AdminDAO;
import com.mat.mvc.vo.*;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.jbb.mappers.adminMapper";

	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
	}

	@Override
	public void register(GoodsVO vo) {
		sql.insert(namespace + ".register", vo);
	}

	@Override
	public List<GoodsVO> goodslist() throws Exception {
		return sql.selectList(namespace + ".goodslist");
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}

    @Override
    public void updateGoods(GoodsVO vo) throws Exception {
        sql.update(namespace + ".updateGoods", vo);
    }

    @Override
    public void deleteGoods(int gdsNum) throws Exception {
        sql.delete(namespace + ".deleteGoods", gdsNum);
    }

}
