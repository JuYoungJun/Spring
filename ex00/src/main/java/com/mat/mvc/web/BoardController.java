package com.mat.mvc.web;

import java.util.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mat.mvc.dao.*;
import com.mat.mvc.service.*;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	BoardService service;

	@Inject
	ReplyService repservice;

	// 게시물 읽어오기
	@RequestMapping(value = "list", method = RequestMethod.GET)
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

	// 게시물 작성 (더미 늘떄 쓴거 @RequestParam("title") String title,
	// @RequestParam("content") String content)
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo) throws Exception {

		/*
		 * (더미데이터 1300개 작성 for문) for (int i = 1; i <= 1300; i++) { vo.setTitle(title +
		 * " - " + i); vo.setContent(content + " - " + i);
		 * 
		 * service.write(vo); }
		 */

		service.write(vo);

		return "redirect:/board/list";
	}

	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {

		// 조회수 증가
		service.viewCnt(bno);

		BoardVO vo = service.view(bno);

		model.addAttribute("view", vo);

		List<ReplyVO> repList = repservice.readReply(bno);
		model.addAttribute("repList", repList);
	}

	// 게시물 수정하기
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	public void getModify() throws Exception {
//
//	}

	// 게시물 수정하기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {

		BoardVO vo = service.view(bno);

		model.addAttribute("view", vo);
	}

	// 게시물 수정하기
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {
		service.modify(vo);

		return "redirect:/board/view?bno=" + vo.getBno();
	}

	// 게시물 삭제하기
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(int bno) throws Exception {
		service.delete(bno);

		return "redirect:/board/list";
	}

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(service.count());

		List list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}

	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		Page page = new Page();

		page.setNum(num);
		// page.setCount(service.count());
		page.setCount(service.searchCount(searchType, keyword));

		// 검색 타입과 검색어
		page.setSearchTypeKeyword(searchType, keyword);

		List<BoardVO> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
	}

	// 댓글 작성
	@RequestMapping(value = "/writeReply", method = RequestMethod.POST)
	public String writeReply(ReplyVO vo, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			vo.setWriter(member.getUserID());
		}

		repservice.writeReply(vo);
		return "redirect:/board/view?bno=" + vo.getBno();
	}

	// 댓글 수정 폼 이동
	@RequestMapping(value = "/modifyReply", method = RequestMethod.GET)
	public void modifyReplyForm(@RequestParam("rno") int rno, Model model) throws Exception {
		ReplyVO reply = repservice.getReply(rno);
		model.addAttribute("reply", reply);
	}

	// 댓글 수정
	@RequestMapping(value = "/modifyReply", method = RequestMethod.POST)
	public String modifyReply(ReplyVO vo) throws Exception {
		repservice.modifyReply(vo);
		return "redirect:/board/view?bno=" + vo.getBno();
	}

	// 댓글 삭제
//	@RequestMapping(value = "/deleteReply", method = RequestMethod.GET)
//	 public String deleteReply(@RequestParam("rno") int rno, @RequestParam("bno") int bno) throws Exception {
//		repservice.deleteReply(rno);
//		return "redirect:/board/view?bno=" + bno;
//	}

	@RequestMapping(value = "/deleteReply", method = RequestMethod.GET)
	public String deleteReply(@RequestParam("rno") int rno, @RequestParam("bno") int bno, HttpSession session,
			RedirectAttributes rttr) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");

		ReplyVO reply = repservice.getReply(rno);

		if (member != null && reply != null && member.getUserName().equals(reply.getWriter())) {
			repservice.deleteReply(rno);
			rttr.addFlashAttribute("msg", "댓글이 삭제되었습니다.");
		} else {
			rttr.addFlashAttribute("msg", "댓글 삭제 권한이 없습니다.");
		}

		return "redirect:/board/view?bno=" + bno;
	}

}
