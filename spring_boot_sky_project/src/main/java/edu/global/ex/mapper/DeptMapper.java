package edu.global.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.global.ex.page.Criteria;
import edu.global.ex.vo.BoardVO;
import edu.global.ex.vo.DeptVO;
import edu.global.ex.vo.EmpDeptVo;
import edu.global.ex.vo.UserVO;

@Mapper
public interface DeptMapper {
	
	//@Select("select * from emp, dept where emp.deptno = dept.deptno")
	public List<DeptVO> getDeptEmpList();
}