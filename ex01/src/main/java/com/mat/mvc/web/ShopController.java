package com.mat.mvc.web;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mat.mvc.service.ShopService;
import com.mat.mvc.vo.CartListVO;
import com.mat.mvc.vo.CartVO;
import com.mat.mvc.vo.GoodsViewVO;
import com.mat.mvc.vo.MemberVO;
import com.mat.mvc.vo.OrderDetailsVO;
import com.mat.mvc.vo.OrderListVO;
import com.mat.mvc.vo.OrderVO;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(ShopController.class);

	@Autowired
	private ShopService service;

	@GetMapping(value = "/list")
	public void getList(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
		logger.info("get list");

		List<GoodsViewVO> list = null;
		list = service.list(cateCode, level);

		model.addAttribute("list", list);
	}

	@GetMapping(value = "/view")
	public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {
		logger.info("get View");

		GoodsViewVO view = service.goodsView(gdsNum);
		model.addAttribute("view", view);
	}

	// 카트 담기
	@ResponseBody
	@PostMapping(value = "/view/addCart")
	public int addCart(CartVO cart, HttpSession session) throws Exception {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			cart.setUserId(member.getUserId());
			service.addCart(cart);
			result = 1;
		}

		return result;
	}

	// 카트 목록
	@GetMapping(value = "/cartList")
	public void getCartList(HttpSession session, Model model) throws Exception {
		logger.info("get cart list");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		List<CartListVO> cartList = service.cartList(userId);

		model.addAttribute("cartList", cartList);
	}

	// 카트 삭제
	@ResponseBody
	@PostMapping(value = "/deleteCart")
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart)
			throws Exception {
		logger.info("delete cart");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		int result = 0;
		int cartNum = 0;

		if (member != null) {
			cart.setUserId(userId);

			for (String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}

	// 주문
	@PostMapping(value = "/cartList")
	public String order(HttpSession session, OrderVO order, OrderDetailsVO orderDetails) throws Exception {
		logger.info("order");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		// 주문 번호 생성할려고 가져옴
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String tm = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = tm + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;

		order.setOrderId(orderId);
		order.setUserId(userId);

		service.orderInfo(order);

		orderDetails.setOrderId(orderId);
		service.orderInfo_Details(orderDetails);

		service.cartAllDelete(userId);

		return "redirect:/shop/orderlist";
	}

	// 주문 목록
	@GetMapping(value = "/orderList")
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
		logger.info("get order list");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);

		List<OrderVO> orderList = service.orderList(order);

		model.addAttribute("orderList", orderList);
	}

	@GetMapping(value = "/orderView")
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model)
			throws Exception {
		logger.info("get order view");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);
		order.setOrderId(orderId);

		List<OrderListVO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);
	}

}