package com.mat.mvc.web;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ErrorController {
	
	private static Logger logger = LoggerFactory.getLogger(ErrorController.class);
	
	@GetMapping("/error404")
	public String Error404(HttpServletResponse res, Model model) {
		logger.warn("==== ERROR 404 PAGE ====");
		model.addAttribute("code", "ERROR_404");
		return "Error/404";
	}
	
	@GetMapping("/error500")
	public String Error500(HttpServletResponse res, Model model) {
		logger.warn("==== ERROR 500 PAGE ====");
		model.addAttribute("code", "ERROR_500");
		return "Error/500";
	}
	
	@GetMapping("/error400")
	public String Error400(HttpServletResponse res, Model model) {
		logger.warn("==== ERROR 400 PAGE ====");
		model.addAttribute("code", "ERROR_400");
		return "Error/400";
	}
}
