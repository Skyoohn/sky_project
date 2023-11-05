package edu.global.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.global.ex.mapper.TangoMapper;
import edu.global.ex.page.Criteria;
import edu.global.ex.vo.BoardVO;
import edu.global.ex.vo.TangoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TangoServiceImpl implements TangoService{
	
	@Autowired
	private TangoMapper tangoMapper;
	
	//글전체목록 서비스
	@Override
	public List<TangoVO> getList() {
		log.info("getList()..");
		
		return tangoMapper.getList();
	}

	@Override
	public TangoVO read(int nkid) {
		log.info("read()..");
		
		return tangoMapper.read(nkid);
	}

	@Override
	public int modify(TangoVO tango) {
		log.info("modify()..");
		
		return tangoMapper.levelup(tango);
	}

	@Override
	public int remove(TangoVO tango) {
		log.info("remove()..");
		
		return tangoMapper.delete(tango);
	}

	@Override
	public void register(TangoVO tango) {
		log.info("register()..");
		tangoMapper.insert(tango);
	}

	@Transactional
	@Override
	public void registerReply(TangoVO tango) {
		tangoMapper.updateShape(tango); //답글의 세로 위치를 먼저 잡아 준 후
		tangoMapper.insertReply(tango); //답글을 등록한다.
	}
	
	   @Override
	   public int getTotal() {      
	      return tangoMapper.getTotalCount();
	   }


	@Override
	public int levelup() {
		return tangoMapper.levelup(null);
	}
	
}