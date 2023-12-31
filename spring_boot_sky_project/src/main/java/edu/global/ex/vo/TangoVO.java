package edu.global.ex.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TangoVO {
	   private int nkid;
	   private String nkanji;
	   private String nruby;
	   private String nsetsumei;
	   private int ndifficulty;
	   private Timestamp ndate;
	   private int nselector;
}