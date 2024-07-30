package com.mat.mvc.service;

import java.util.List;

import com.mat.mvc.vo.CartListVO;
import com.mat.mvc.vo.CartVO;
import com.mat.mvc.vo.GoodsViewVO;
import com.mat.mvc.vo.OrderDetailsVO;
import com.mat.mvc.vo.OrderListVO;
import com.mat.mvc.vo.OrderVO;

public interface ShopService {

	public List<GoodsViewVO> list(int cateCode, int level) throws Exception;

	public GoodsViewVO goodsView(int gdsNum) throws Exception;

	public void addCart(CartVO cart) throws Exception;

	public List<CartListVO> cartList(String userId) throws Exception;
	
	public void deleteCart(CartVO vo) throws Exception;
	
	public void orderInfo(OrderVO order) throws Exception;
	
	public void orderInfo_Details(OrderDetailsVO orderDetails) throws Exception;
	
	public void cartAllDelete(String userId) throws Exception;
	
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
}