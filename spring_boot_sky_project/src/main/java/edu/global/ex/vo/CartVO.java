package edu.global.ex.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름       널?       유형            
-------- -------- ------------- 
USERNAME NOT NULL VARCHAR2(50)  
PASSWORD NOT NULL VARCHAR2(100) 
ENABLED           CHAR(1)   
*/

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CartVO {
	private String username; // 유저 id
	private String product_img; // 이미지
	private String product_name; // 이름
	private int product_code;
	private String options;
	private int number_of_order;
}
