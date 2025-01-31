package com.mat.mvc.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mat.mvc.dao.*;
import com.mat.mvc.service.*;
import com.mat.mvc.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;

	@Override
	public void signup(MemberVO vo) throws Exception {
		dao.signup(vo);
	}

	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return dao.signin(vo);
	}

}
