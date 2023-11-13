package edu.global.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.global.ex.vo.CartVO;

@Mapper
public interface CartMapper {

	public void insert(CartVO cartVO);
	
	public List<CartVO> listCart(String username);
	
	public int delete(int product_code, String options);

	void updateStockQuantity(String product_name, int stock_quantity, String options);
	
	void intoCart(@Param("username") String username, @Param("productCategory") String productCategory, 
			@Param("productCode") int productCode);
	
}
