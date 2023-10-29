package edu.global.ex.vo;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BoardVOTest {

	@Test
	void testBoardVO() {
		BoardVO board = new BoardVO();
		
		assertNotNull(board);
		
		board.setBid(10);
		board.setBcontent("hahaha");
		
		assertEquals("hahaha", board.getBcontent());
		assertEquals(10, board.getBid());
		
		System.out.println(board.getBid());
		System.out.println(board);
	}

}
