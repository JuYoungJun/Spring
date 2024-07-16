package com.mat.mvc.service.Impl;

import java.util.*;
import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.Repository;

import com.mat.mvc.dao.*;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.board";

	@Override
	public List<BoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void write(BoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public BoardVO view(int bno) throws Exception {
		return sql.selectOne(namespace + ".view", bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
	}

	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");
	}

	@Override
	public List listPage(int displayPost, int postNum) throws Exception {

		HashMap data = new HashMap();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sql.selectList(namespace + ".listPage", data);
	}

	@Override
	public void viewCnt(int bno) throws Exception {
		sql.update(namespace + ".viewCnt", bno);
	}

	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);

		return sql.selectList(namespace + ".listPageSearch", data);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		
		HashMap data = new HashMap();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".searchCount", data);
	}

}
