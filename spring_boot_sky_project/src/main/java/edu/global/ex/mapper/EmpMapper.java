package edu.global.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import edu.global.ex.page.Criteria;
import edu.global.ex.vo.BoardVO;
import edu.global.ex.vo.EmpDeptVo;
import edu.global.ex.vo.UserVO;

@Mapper
public interface EmpMapper {
	List<EmpDeptVo> getEmpDeptList();
	
}