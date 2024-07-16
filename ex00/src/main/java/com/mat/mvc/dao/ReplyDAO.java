package com.mat.mvc.dao;

import java.util.*;

public interface ReplyDAO {

	// 댓글 조회
	public List<ReplyVO> readReply(int bno) throws Exception;

	// 댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;

	// 댓글 수정
	public void modifyReply(ReplyVO vo) throws Exception;

	// 댓글 삭제
	public void deleteReply(int rno) throws Exception;

	// 댓글 하나 조회
	public ReplyVO getReply(int rno) throws Exception;

}
