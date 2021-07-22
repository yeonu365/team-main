package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.TravelogVO;
import org.zerock.mapper.TravelogMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class TravelogServiceImpl implements TravelogService {

	private TravelogMapper mapper; 
	
	@Override
	public List<TravelogVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public void insert(TravelogVO travelog) {
		mapper.insertSelectKey(travelog);
	}
	
	@Override
	public TravelogVO read(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean delete(Long bno) {
		return mapper.delete(bno) == 1;
	}
	
		

}
