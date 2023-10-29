package edu.global.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.global.ex.service.BoardService;
import edu.global.ex.service.TangoService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private TangoService tangoService;
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("boardList",tangoService.getList());
		
		return "home";
	}
	@GetMapping("/user/userHome")
	public void userHome() {
		log.info("userhome() ..");
//		return "home";
	}
//	위와 같음
//	@GetMapping("/user/userHome")
//	public String userhome() {
////		return "/user/userHome";
//	}
	
	   @GetMapping("/admin/adminHome")
	   public void adminHome() {
	      log.info("adminHome ...");
	   }

}