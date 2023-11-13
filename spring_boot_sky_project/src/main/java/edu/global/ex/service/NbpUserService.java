package edu.global.ex.service;

import java.util.List;

import edu.global.ex.page.Criteria;
import edu.global.ex.vo.BoardVO;
import edu.global.ex.vo.UserVO;

public interface NbpUserService {
	
	public List<UserVO> getUsers(); // 리스트메소드
	public List<UserVO> getUser(); // 리스트메소드
	public UserVO read(String username, String cname);  // 글보기메소드
	public UserVO read(String username);  // 유저 정보 하나 가져오기 id값을 통해
	public int modify(UserVO userVO); // 글수정
	public int delete(UserVO userVO); // 삭제
	public void register(UserVO userVO); //글쓰기
	public void registerReply(UserVO userVO); //답글달기
	
	public void insert(UserVO userVO); //회원등록
	public UserVO getCompany(UserVO userVO); //가져오기
	public UserVO update(UserVO userVO); //회원정보업데이트
	
	public int getTotal();

}