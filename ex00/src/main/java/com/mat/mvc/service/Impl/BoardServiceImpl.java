package com.mat.mvc.service.Impl;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import com.mat.mvc.dao.*;
import com.mat.mvc.service.*;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
	}

	@Override
	public BoardVO view(int bno) throws Exception {
		return dao.view(bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public int count() throws Exception {
		return dao.count();
	}

	@Override
	public List listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}
	
	@Override
	public void viewCnt(int bno) throws Exception {
		dao.viewCnt(bno);
	}

	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		return dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}

}
