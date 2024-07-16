package com.mat.mvc.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void getRegister() throws Exception {
        logger.info("get register");
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegister(MemberVO vo) throws Exception {
        logger.info("post register");

        String inputPass = vo.getUserPW();
        String pass = passEncoder.encode(inputPass);
        vo.setUserPW(pass);

        service.register(vo);

        return "redirect:/";
    }

    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        logger.info("post login");

        HttpSession session = req.getSession();

        MemberVO login = service.login(vo);

        boolean passMatch = passEncoder.matches(vo.getUserPW(), login.getUserPW());

        if (login != null && passMatch) {
            session.setAttribute("member", login);
        } else {
            session.setAttribute("member", null);
            rttr.addFlashAttribute("msg", false);
        }

        return "redirect:/index";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {
        logger.info("get logout");

        session.invalidate();

        return "redirect:/";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public void getUpdate() throws Exception {
        logger.info("get update");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String postUpdate(HttpSession session, MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        logger.info("post Update");

        MemberVO member = (MemberVO) session.getAttribute("member");

        String oldPassFromDB = member.getUserPW();

        String inputPass = vo.getUserPW();

        boolean passMatch = passEncoder.matches(inputPass, oldPassFromDB);

        if (!passMatch) {
            rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
            return "redirect:/member/update";
        }

        service.update(vo);

        session.invalidate();

        return "redirect:/";
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public void getDelete() throws Exception {
        logger.info("get delete");
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String postDelete(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
        logger.info("post delete");

        MemberVO member = (MemberVO) session.getAttribute("member");

        String oldPW = member.getUserPW();
        String newPW = vo.getUserPW();

        boolean passMatch = passEncoder.matches(newPW, oldPW);

        if (!passMatch) {
            rttr.addFlashAttribute("msg", false);
            return "redirect:/member/delete";
        }

        service.delete(vo);

        logout(session);

        return "redirect:/";
    }

    @ResponseBody
    @RequestMapping(value = "/IDCheck", method = RequestMethod.POST)
    public int postIDCheck(HttpServletRequest req) throws Exception {
        logger.info("post IDCheck");

        String userID = req.getParameter("userID");
        MemberVO IDCheck = service.IDCheck(userID);

        int result = 0;

        if (IDCheck != null) {
            result = 1;
        }

        return result;
    }

}
