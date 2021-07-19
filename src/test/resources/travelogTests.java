import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.travelogMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:srcfile:src/main/webapp/WEB-INF/spring/root-context.xml")
public class travelogTests {

	@Setter(onMethod_= @Autowired)
	private travelogMapper mapper;
	
	@Test
	public void testGetList() {
		assertNotNull(mapper);
		
		List<travelogVO> list = mapper.getList();
	}

}
