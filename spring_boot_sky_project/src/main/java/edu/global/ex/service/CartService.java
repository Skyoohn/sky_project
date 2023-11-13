package edu.global.ex.service;

import java.util.List;

import edu.global.ex.vo.CartVO;
import edu.global.ex.vo.TangoVO;
import edu.global.ex.vo.UserVO;

public interface CartService {
	
	public void insert(CartVO cartVO);

	public List<CartVO> listCart(String username);
	
	public int delete(int product_code, String options); 

	void updateStockQuantity(String product_name, int stock_quantity, String options);
	
	void intoCart(String username, TangoVO tangoVO);

}
