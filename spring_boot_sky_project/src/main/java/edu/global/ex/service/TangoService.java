package edu.global.ex.service;

import java.util.List;

import edu.global.ex.vo.TangoVO;

public interface TangoService {
	List<TangoVO> getList(); //리스트 메소드
	TangoVO read(String nkanji); //글보기 메소드
	int modify(TangoVO tango); //글수정
	int remove(TangoVO tangoVO); //글삭제
	void register(TangoVO tangoVO); //글추가
	void registerReply(TangoVO tangoVO); //답변등록
	int getTotal();
}