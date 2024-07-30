package com.mat.mvc.service.impl;

import java.util.*;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mat.mvc.dao.*;
import com.mat.mvc.service.*;
import com.mat.mvc.vo.*;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;

	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
		int cateCodeRef = 0;

		if (level == 1) {
			cateCodeRef = cateCode;
			return dao.list(cateCodeRef, cateCode);
		} else {
			return dao.list(cateCode);
		}
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}

	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}

	@Override
	public void deleteCart(CartVO vo) throws Exception {
		dao.deleteCart(vo);
	}

	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}

	@Override
	public void orderInfo_Details(OrderDetailsVO orderDetails) throws Exception {
		dao.orderInfo_Details(orderDetails);
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}
}
