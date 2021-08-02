package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int insert(ReplyVO vo) {
		return mapper.insert(vo);
	}
	@Override
	public ReplyVO read(Long rno) {
		return mapper.read(rno);
	}
	@Override
	public int update(ReplyVO vo) {
		return mapper.update(vo);
	}
	@Override
	public int delete(Long rno) {
		return mapper.delete(rno);
	}
	@Override
	public List<ReplyVO> getList(Long bno) {
		return mapper.getList(bno);
	}
	
}
