package edu.global.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.global.ex.mapper.CartMapper;
import edu.global.ex.mapper.NbpUserMapper;
import edu.global.ex.vo.CartVO;
import edu.global.ex.vo.TangoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;
	
    @Override
    public void insert(CartVO cartVO) {
    	log.info("insert()..");
    	cartMapper.insert(cartVO);
    }
   
    @Override
    public List<CartVO> listCart(String username) {
    	log.info("listCart()..");
        return cartMapper.listCart(username);
    }

   
    @Override
    public int delete(int product_code, String options) {
    	log.info("delete()..");
		return cartMapper.delete(product_code, options);
    }
    
    @Override
    public void intoCart(String username, TangoVO tangoVO) {
        CartVO cart = new CartVO();
        cart.setUsername(username);
        cart.setProduct_code(tangoVO.getNkid());
        cart.setProduct_img(tangoVO.getNkanji());
        cart.setProduct_name(tangoVO.getNruby());
        cart.setNumber_of_order(tangoVO.getNsetsumei());
        cart.setOptions(tangoVO.getNselector());
        cartMapper.insert(cart);
        log.info("intoCart...");
    }   
}
