package edu.global.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.global.ex.service.TangoService;
import edu.global.ex.vo.TangoVO;
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
	
	@GetMapping("/content_view")
	public String content_view(TangoVO tangoVO, Model model) {
		log.info("content_view()..");
		
		int nkid = tangoVO.getNkid();
		model.addAttribute("content_view",tangoService.read(nkid));
		
		return "/content_view";
	}
	
	@GetMapping("/levelup")
	public String levelup(@RequestParam int nkid) {
	    tangoService.levelup(nkid);
	    return "redirect:/";
	}
	
	@GetMapping("/user/userHome")
	public void userHome() {
		log.info("userhome() ..");
//		return "home";
	}
	
	@GetMapping("/{boardlist}")
	public ModelAndView shop(@PathVariable String productCategory, 
	                         @PathVariable int productCode,
	                         TangoVO tangoVO, Model model) {
	    log.info("shop()..");


	    log.info(productCategory + productCode);
	    
	    // 모델에 데이터 추가
	    model.addAttribute("spVO", tangoService.read(productCode));

	    System.out.println(tangoService.read(productCode));
	    
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("/cart");

	    return mv;
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