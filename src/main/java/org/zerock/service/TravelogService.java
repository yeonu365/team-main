package org.zerock.service;

import java.util.List;

import org.zerock.domain.TravelogVO;

public interface TravelogService {

	public List<TravelogVO> getList();
	
	public void insert(TravelogVO travelog);
	
	public TravelogVO read(Long bno);
	
	public boolean delete(Long bno);

}
