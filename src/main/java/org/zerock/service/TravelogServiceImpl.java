package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.TravelogVO;
import org.zerock.mapper.ReplyMapper;
import org.zerock.mapper.TravelogMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class TravelogServiceImpl implements TravelogService {

	private TravelogMapper mapper; 
	private ReplyMapper replyMapper;
	
	@Override
	public List<TravelogVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public void insertSelectKey(TravelogVO travelog) {
		mapper.insertSelectKey(travelog);
	}
	
	@Override
	public TravelogVO read(Long bno) {
		return mapper.read(bno);
	}

	@Override
	@Transactional
	public boolean delete(Long bno) {
		replyMapper.deleteByBno(bno);
		int cnt = mapper.delete(bno);
		return cnt == 1;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
