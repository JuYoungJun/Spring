package com.mat.mvc.service.Impl;

import java.util.*;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mat.mvc.dao.*;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.reply";

	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return sql.selectList(namespace + ".readReply", bno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sql.insert(namespace + ".writeReply", vo);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		sql.update(namespace + ".modifyReply", vo);
	}

	@Override
	public void deleteReply(int rno) throws Exception {
		sql.delete(namespace + ".deleteReply", rno);
	}

	@Override
	public ReplyVO getReply(int rno) throws Exception {
		return sql.selectOne(namespace + ".getReply", rno);
	}

}
