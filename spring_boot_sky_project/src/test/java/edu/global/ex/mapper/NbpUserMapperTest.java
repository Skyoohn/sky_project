package edu.global.ex.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import edu.global.ex.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class NbpUserMapperTest {

	@Autowired
	private NbpUserMapper nbpUserMapper;
	
	
	/*
	 * @Bean // PasswordEncoder passwordEncoder = new BCryptPasswordEncoder() public
	 * PasswordEncoder passwordEncoder() { return new BCryptPasswordEncoder(); }
	 */
	//아래에 주입 시키는 것
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	//UserVO(username=admin, password=admin, enambed=1)
	//authList=[AuthVO(username=admin,authorty=ROLE=ADMIN)
	//AutoVO(username=admin,authority=ROLE_MANAGER)
	
	@Test
	void testGetList() {
		UserVO user = nbpUserMapper.getUser("admin");
		System.out.println(user);
	}
	
	 @Test void testInsertUser() { UserVO user = new UserVO();
	 user.setUsername("user2"); user.setPassword(passwordEncoder.encode("user2"));
	 user.setEnabled(1);
	
	 nbpUserMapper.insertUser(user); nbpUserMapper.insertAuthorities(user); }

	   
	   //암호 체크 방법
	   @Test
	   void testMatchUser() {
	      UserVO user = new UserVO();
	      user.setUsername("user2");
	      user.setPassword(passwordEncoder.encode("user2"));
	      user.setEnabled(1);
	      
	      boolean bool = passwordEncoder.matches("user2", user.getPassword());
	      
	      System.out.println(bool);
	   }

}
