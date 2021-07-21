package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TravelogVO {
	private long bno;
	private String title;
	private String city;
	private String content;
	private String writer;
	private Date regdate;
	private String company;
}
