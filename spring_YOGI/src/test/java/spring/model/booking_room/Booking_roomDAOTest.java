package spring.model.booking_room;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class Booking_roomDAOTest {
	
	private static BeanFactory beans;
	private static Booking_roomDAO dao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("daotest.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		dao = (Booking_roomDAO)beans.getBean("booking_room");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testSetSst() {
	}

	@Test @Ignore
	public void testCreate() {
		Booking_roomDTO dto = new Booking_roomDTO();
		
		dto.setbName("daoTest");
		dto.setbPhone("000-000-0000");
		dto.setbHname("호텔이름");
		dto.setbRtype("방종류임");
		dto.setbRinfo("방정보임");
		dto.setbPerson(4);
		dto.setbCapacity("6(2)");
		dto.setbPrice(140000);
		dto.setStartDate("2018-11-15");
		dto.setEndDate("2018-11-18");
		dto.setbCheckIn("14:00");
		dto.setbCheckOut("11:00");
		dto.setId_FK("user2");
		dto.setRnum_FK(1);
		
		try {
			assertTrue(dao.create(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testDelete() {
		try {
			assertTrue(dao.delete(3));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		
		map.put("id_FK", "user2");
		map.put("inSdate", "2018-11-12");
		map.put("inEdate", "2018-11-22");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List list;
		try {
			list = dao.list(map);
			assertEquals(list.size(), 3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Test @Ignore
	public void testRead() {

		Booking_roomDTO dto;
		try {
			dto = dao.read(1);
			assertNotNull(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Test
	public void testUpdate() {
		Booking_roomDTO dto = new Booking_roomDTO();
		
		dto.setbName("예약자변경");
		dto.setbPhone("번호변경");
		dto.setbRtype("방변경");
		dto.setbRinfo("방정보변경");
		dto.setbPerson(6);
		dto.setbPrice(120000);
		dto.setStartDate("2018-11-11");
		dto.setEndDate("2018-11-15");
		dto.setbCheckIn("14:30");
		dto.setbCheckOut("10:30");
		dto.setbStatus("예약완료");
		dto.setbRnum(1);
		
		try {
			assertTrue(dao.update(dto));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
