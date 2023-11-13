package edu.global.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.global.ex.page.Criteria;
import edu.global.ex.vo.BoardVO;
import edu.global.ex.vo.UserVO;

@Mapper
public interface NbpUserMapper {
	
	   public UserVO getUsers(String username);   
	   public UserVO getUser(String username);   
	   
	   @Insert("insert into users(username,password,enabled) values(#{username},#{password},#{enabled})")
	   public int insertUser(UserVO userVO);

	   @Insert("insert into AUTHORITIES (username,AUTHORITY) values(#{username},'ROLE_USER')")
	   public void insertAuthorities(UserVO UserVO);
	   
	   @Insert("INSERT INTO nbp_users (username, password, cname, caddress1, caddress2, caddress3, caddress4, caddress5, phone1, phone2)"
		   		+ "VALUES (#{username}, #{password}, #{cname}, #{caddress1}, #{caddress2}, #{caddress3}, #{caddress4}, #{caddress5}, #{phone1}, #{phone2})")
			public void insert(UserVO userVO);
			
		@Select("select * from nbp_users")
		public UserVO getUser(UserVO userVO); //가져오기

		@Update("update nbp_users set cname= #{cname}, caddress1 = #{caddress1}, caddress2 = #{caddress2}, caddress3 = #{caddress3}, caddress4 = #{caddress4}, caddress5 = #{caddress5}, phone1 = #{phone1}, phone2 = #{phone2} where username = #{username}")
		public int update(UserVO userVO);
	   

	   public List<UserVO> getUser();
	   public List<UserVO> getUsers();

	   public UserVO read(String cname);

	   public int delete(UserVO username);


}