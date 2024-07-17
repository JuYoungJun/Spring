package com.mat.mvc.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mat.mvc.dao.MemberVO;
import com.mat.mvc.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
    @Inject
    MemberService service;

    @Autowired
    BCryptPasswordEncoder passEncoder;
    
    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public void getSignup() throws Exception {
        logger.info("get signup");
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String postSignup(MemberVO vo) throws Exception {
        logger.info("post signup");

        String inputPass = vo.getUserPass();
        String pass = passEncoder.encode(inputPass);
        vo.setUserPass(pass);

        service.signup(vo);

        return "redirect:/";
    }

}
