package edu.global.ex.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.global.ex.service.CartService;
import edu.global.ex.service.NbpUserService;
import edu.global.ex.vo.CartVO;
import edu.global.ex.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	
//	@GetMapping("/")
//    public String listCart(Principal principal,Model model) {
//		List<CartVO> listCart = cartService.listCart();
//		principal.getName();
//        model.addAttribute("listCart", listCart);
//        log.info("list on!");
//        return "cart";
//    }

    @PostMapping("/delete")
    public ResponseEntity<String> removeFromCart(@RequestParam("product_code") int product_code,@RequestParam("options") String options) {
        try {
            // 데이터베이스에서 해당 상품을 삭제합니다.
            int deletedRows = cartService.delete(product_code, options);

            if (deletedRows > 0) {
                return new ResponseEntity<>("상품 삭제 성공", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("상품 삭제 실패", HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("상품 삭제 실패: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    

    @PostMapping("/insertcart")
	public String insertCart(Principal principal,UserVO userVO,CartVO cartVO, @RequestParam("options") int options) {
    	cartVO.setUsername(principal.getName());
    	cartVO.setOptions(options);
    
		cartService.insert(cartVO);
		
		return "redirect:/cart/";
	}
}
