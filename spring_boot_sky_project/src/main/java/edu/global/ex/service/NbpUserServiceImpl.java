package edu.global.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.global.ex.mapper.NbpUserMapper;
import edu.global.ex.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NbpUserServiceImpl implements NbpUserService {

    @Autowired
    private NbpUserMapper nbpUserMapper; // Company 데이터를 처리하는 Mapper

	@Override
	public List<UserVO> getUsers() {
		
		return nbpUserMapper.getUsers();
	}
	
	@Override
	public List<UserVO> getUser() {
		
		return nbpUserMapper.getUser();
	}

	@Override
	public UserVO read(String username, String cname) {
		// TODO Auto-generated method stub
		return nbpUserMapper.read(cname);
	}
	
	@Override
	public UserVO read(String username) {
		// TODO Auto-generated method stub
		return nbpUserMapper.read(username);
	}

	@Override
	public int modify(UserVO msUserVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(UserVO username) {
		
		log.info("delete()..");
		
		return nbpUserMapper.delete(username);
	}

	@Override
	public void register(UserVO userVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void registerReply(UserVO userVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	@Override
	public void insert(UserVO userVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserVO getCompany(UserVO userVO) {
		// TODO Auto-generated method stub
		return nbpUserMapper.getUser(userVO.getUsername());
	}

	@Override
	public UserVO update(UserVO userVO) {
		// TODO Auto-generated method stub
		return null;
	}


    }