package com.mat.mvc.web;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mat.mvc.service.AdminService;
import com.mat.mvc.utill.UploadFileUtils;
import com.mat.mvc.vo.*;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;

	@Resource(name = "uploadPath")
	private String uploadPath;

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

	// 상품 등록 처리
	@PostMapping(value = "/goods/register")
	public String postGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		logger.info("Upload Path: {}", imgUploadPath);
		logger.info("Calculated Path: {}", ymdPath);

		if (file != null && !file.isEmpty()) {
			// 파일이 첨부된 경우
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			// gdsImg와 gdsThumbImg에 경로를 설정
			String originalImgPath = File.separator + "imgUpload" + ymdPath + File.separator + fileName;
			String thumbImgPath = File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_"
					+ fileName;

			vo.setGdsImg(originalImgPath);
			vo.setGdsThumbImg(thumbImgPath);

			logger.info("Uploaded file name: {}", fileName);
			logger.info("Image Path: {}", originalImgPath);
			logger.info("Thumbnail Path: {}", thumbImgPath);
		} else {
			// 파일이 첨부되지 않은 경우
			fileName = File.separator + "imgUpload" + File.separator + "images" + File.separator + "test.png";

			vo.setGdsImg(fileName);
			vo.setGdsThumbImg(fileName);

			logger.info("No file uploaded, using default image.");
			logger.info("Default Image Path: {}", fileName);
		}

		// 상품 등록 처리
		adminService.register(vo);

		logger.info("Product registered with ID: {}", vo.getGdsNum());

		return "redirect:/admin/goods/list";
	}

	// 상품 목록
	@GetMapping(value = "/goods/list")
	public void getGoodsList(Model model) throws Exception {
		logger.info("get Goods List");

		List<GoodsViewVO> list = adminService.goodslist();
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
	public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("post goods modify");

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else {
			// 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setGdsImg(req.getParameter("gdsImg"));
			vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));

		}

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
