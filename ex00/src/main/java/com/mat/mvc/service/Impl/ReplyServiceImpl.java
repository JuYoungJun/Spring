package com.mat.mvc.service.Impl;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mat.mvc.dao.ReplyVO;
import com.mat.mvc.service.ReplyService;

@Service

public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAOImpl dao;

	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		dao.modifyReply(vo);
	}

	@Override
	public void deleteReply(int rno) throws Exception {
		dao.deleteReply(rno);
	}

	@Override
	public ReplyVO getReply(int rno) throws Exception {
		return dao.getReply(rno);
	}

}
