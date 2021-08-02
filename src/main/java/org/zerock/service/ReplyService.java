package org.zerock.service;

import java.util.List;

import org.zerock.domain.ReplyVO;

public interface ReplyService {

	public int insert(ReplyVO vo);
	public ReplyVO read(Long rno);
	public int update(ReplyVO vo);
	public int delete(Long rno);
	public List<ReplyVO> getList(Long bno);
}
