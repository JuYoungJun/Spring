package com.mat.mvc.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mat.mvc.dao.Page;
import com.mat.mvc.service.BoardService;
import com.mat.mvc.vo.BoardVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	BoardService service;

	@GetMapping(value = "list")
	public void getList(Model model) throws Exception {
		List list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

	// 게시물 작성하기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HttpSession session, Model model) throws Exception {
		Object loginInfo = session.getAttribute("member");

		if (loginInfo == null) {
			model.addAttribute("msg", "login_error");
		}
	}

	@PostMapping(value = "/write")
	public String postWrite(BoardVO vo) throws Exception {
		service.write(vo);

		return "redirect:/board/listPageSearch?num=1";
	}

	@GetMapping(value = "/view")
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {

		// 조회수 증가
		service.viewCnt(bno);

		BoardVO vo = service.view(bno);

		model.addAttribute("view", vo);
	}

	// 게시물 수정하기
	@GetMapping(value = "/modify")
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {

		BoardVO vo = service.view(bno);

		model.addAttribute("view", vo);
	}

	// 게시물 수정하기
	@PostMapping(value = "/modify")
	public String postModify(BoardVO vo) throws Exception {
		service.modify(vo);

		return "redirect:/board/view?bno=" + vo.getBno();
	}

	// 게시물 삭제하기
	@GetMapping(value = "/delete")
	public String getDelete(int bno) throws Exception {
		service.delete(bno);

		return "redirect:/board/listPageSearch?num=1";
	}

	// 게시물 목록 + 페이징 추가 + 검색
	@GetMapping(value = "/listPageSearch")
	public void getListPageSearch(Model model, @RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(service.searchCount(searchType, keyword));

		page.setSearchTypeKeyword(searchType, keyword);

		List<BoardVO> list = null;
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
	}

}
