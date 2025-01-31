package com.mat.mvc.dao;

import java.util.*;
import com.mat.mvc.vo.*;

public interface AdminDAO {
	
	// 카테고리
	public List<CategoryVO> category() throws Exception;
	
	// 상품 등록
	public void register(GoodsVO vo) throws Exception;
	
	// 상품 목록 가져오기
	public List<GoodsViewVO> goodslist() throws Exception;
	
	// 상세보기
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
    // 상품 수정
    public void updateGoods(GoodsVO vo) throws Exception;
    
    // 상품 삭제
    public void deleteGoods(int gdsNum) throws Exception;
    
	public List<OrderVO> orderList() throws Exception;
	
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	public void delivery(OrderVO order) throws Exception;

}
