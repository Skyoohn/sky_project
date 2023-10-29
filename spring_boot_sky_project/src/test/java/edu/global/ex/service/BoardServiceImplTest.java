package edu.global.ex.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.global.ex.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class BoardServiceImplTest {

	@Autowired
	private BoardService boardService;
	
	@Test
	void testGetList() {
		assertNotNull(boardService);
		
		System.out.println(boardService.getList().size());
		
		for(BoardVO board : boardService.getList()) {
			log.info(board.toString());
		}
	}

}
