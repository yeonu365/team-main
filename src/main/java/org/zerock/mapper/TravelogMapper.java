package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.TravelogVO;

public interface TravelogMapper {

	public List<TravelogVO> getList();
	
	public int insert(TravelogVO travelog);
	
	public int insertSelectKey(TravelogVO travelog);
	
	public TravelogVO read(Long bno);
	
	public int delete(Long bno);
	
	public List<TravelogVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);

	public void removeByUserid(MemberVO vo);
	
}
