package edu.global.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.global.ex.vo.TangoVO;

@Mapper
public interface TangoMapper {		
	
	public List<TangoVO> getList();
	TangoVO read(char nkanji);
	int update(TangoVO tango);
	int delete(TangoVO tango); //글삭제
	public void insert(TangoVO tango);
	public void updateShape(TangoVO tango);
	public void insertReply(TangoVO tango);
	
	int getTotalCount();
}