import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyTests {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Test
	public void test() {
		assertNotNull(mapper);
	}
	
	@Test
	public void test2() {
		ReplyVO vo = new ReplyVO();
		vo.setReply("테스트댓글");
		vo.setReplyer("테스터");
		vo.setBno(162L);
		
		int cnt = mapper.insert(vo);
		assertEquals(1, cnt);
	}
	
	@Test
	public void testRead() {
		ReplyVO vo = mapper.read(1L);
		assertEquals("테스트댓글", vo.getReply());
		
	}
	
	@Test
	public void testDelete() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(162L);
		vo.setReply("replying");
		vo.setReplyer("tester39");
		
		mapper.insertSelectKey(vo);
		int cnt = mapper.delete(vo.getRno());
		assertEquals(1, cnt);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = mapper.read(1L);
		String re = "수정 댓글";
		vo.setReply(re);
		assertEquals(1, mapper.update(vo));
		vo = mapper.read(1L);
		assertEquals(re, vo.getReply());
	}
	
	
}
