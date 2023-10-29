package edu.global.ex.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//ORM: RDBMS <-> Class 매핑을 도와주는 프레임워크
//JPA: 일반솔루션 회사
//mybatis: si 회사에서 많이 씀

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class DeptVO {
	   private String deptno;//부서번호
	   private String dname; // 부서이름
	   private String loc; // 지역
	   
	   //1대 다 처리
	   List<EmpDeptVo> empList;
}