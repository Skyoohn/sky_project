package edu.global.ex.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
@AutoConfigureMockMvc
class BoardControllerTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void testList() throws Exception {
		// board/list 테스트
		// Board 게시판
		mockMvc.perform(MockMvcRequestBuilders.get("/board/list").accept(MediaType.TEXT_HTML)) // 없어도 됨
				.andExpect(MockMvcResultMatchers.status().isOk()) // 만 있어도 됨
				.andDo(MockMvcResultHandlers.print());
	}

	@Test
	void testModify() throws Exception {
		// board/modify 테스트
		// 게시판 수정 테스트
		String resultPage = mockMvc
			.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bid", "1083")
				.param("btitle", "수정된 테스트 새글 제목")
				.param("bcontent", "수정된 테스트 새글 내용")
				.param("bname", "user00"))
			.andReturn().getModelAndView().getViewName();

		log.info(resultPage);
	}

}