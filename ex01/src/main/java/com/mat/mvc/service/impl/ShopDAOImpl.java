package com.mat.mvc.service.impl;

import java.util.*;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mat.mvc.dao.ShopDAO;
import com.mat.mvc.vo.CartListVO;
import com.mat.mvc.vo.CartVO;
import com.mat.mvc.vo.GoodsViewVO;
import com.mat.mvc.vo.OrderDetailsVO;
import com.mat.mvc.vo.OrderListVO;
import com.mat.mvc.vo.OrderVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.jbb.mappers.shopMapper";

	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		
		return sql.selectList(namespace + ".list_1", map);
	}

	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
		return sql.selectList(namespace + ".list_2", cateCode);
	}
	
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne("com.jbb.mappers.adminMapper" + ".goodsView", gdsNum);
	}

	@Override
	public void addCart(CartVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}

	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList", userId);
	}

	@Override
	public void deleteCart(CartVO vo) throws Exception {
		sql.delete(namespace + ".deleteCart", vo);
	}

	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}

	@Override
	public void orderInfo_Details(OrderDetailsVO orderDetails) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetails);
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(namespace + ".cartAllDelete", userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}

}
