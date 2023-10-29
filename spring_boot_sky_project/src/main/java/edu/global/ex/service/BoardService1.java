package edu.global.ex.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.global.ex.mapper.IBDao;
import edu.global.ex.vo.BoardVO;

@Service
public class BoardService1 {
	
	@Autowired
	private SqlSession sqlSession;
	   
	   public List<BoardVO> selectBoardList()throws Exception {
	       IBDao dao = sqlSession.getMapper(IBDao.class);
	      return dao.listDao();
	    }
}