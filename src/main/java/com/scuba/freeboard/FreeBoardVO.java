package com.scuba.freeboard;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter
@Setter
public class FreeBoardVO {
	private int num;
	private String nickname;
	private int viewcount;
	private int likecount;
	private Date writedate;
	private String title;
	private String content;
	private String communityname;
}
