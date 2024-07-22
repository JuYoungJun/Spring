package com.mat.mvc.dao;

import javax.servlet.http.*;

import org.springframework.web.servlet.HandlerInterceptor;

import com.mat.mvc.vo.MemberVO;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member == null) {
			res.sendRedirect("/member/signin");
			return false;
		}

		if (member == null || member.getVerify() != 9) {
			res.sendRedirect("/");
			return false;
		}

		return true;
	}
}
