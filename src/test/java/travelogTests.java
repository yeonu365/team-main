import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.Criteria;
import org.zerock.domain.TravelogVO;
import org.zerock.mapper.TravelogMapper;
import org.zerock.service.TravelogService;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class travelogTests {

	@Setter(onMethod_= @Autowired)
	private TravelogMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private TravelogService service;
	
//	@Test
//	public void testGetList() {
//		assertNotNull(mapper);
//	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<TravelogVO> list = mapper.getListWithPaging(cri);
		
		assertEquals(10, list.size());
		
	}
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria(2,5);
		List<TravelogVO> list = service.getList(cri);
		
		assertNotNull(list);
		assertTrue(list.size() > 0);
		assertEquals(5, list.size());
		
	}
	
}
