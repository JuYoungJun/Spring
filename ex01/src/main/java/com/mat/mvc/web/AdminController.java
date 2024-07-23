package com.mat.mvc.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mat.mvc.service.AdminService;
import com.mat.mvc.vo.*;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;

	// 관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get Index");
	}

	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
		logger.info("get goods register");

		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	// 상품 등록
	@PostMapping(value = "/goods/register")
	public String postGoodsRegister(GoodsVO vo) throws Exception {
		adminService.register(vo);

		return "redirect:/admin/index";
	}

	// 상품 목록
	@GetMapping(value = "/goods/list")
	public void getGoodsList(Model model) throws Exception {
		logger.info("get Goods List");

		List<GoodsVO> list = adminService.goodslist();
		model.addAttribute("list", list);
	}

	// 상품 조회
	@GetMapping(value = "/goods/view")
	public void getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception {
		logger.info("get goods view");

		GoodsViewVO goods = adminService.goodsView(gdsNum);

		model.addAttribute("goods", goods);
	}

	// 상품 수정
	@GetMapping(value = "/goods/modify")
	public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception {
		logger.info("get goods Modify");

		GoodsViewVO goods = adminService.goodsView(gdsNum);
		model.addAttribute("goods", goods);

		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	// 상품 수정 처리
	@PostMapping(value = "/goods/modify")
	public String postGoodsModify(GoodsVO vo) throws Exception {
		adminService.updateGoods(vo);
		return "redirect:/admin/goods/view?n=" + vo.getGdsNum();
	}

	// 상품 삭제 처리
	@PostMapping(value = "/goods/delete")
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
		adminService.deleteGoods(gdsNum);
		return "redirect:/admin/goods/list";
	}
}
