package spring.model.booking_affiliation;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class BookingDAO implements IBookingDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = session.insert("booking.create", (BookingDTO)dto);
		
		if (cnt > 0)
			flag = true;
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return session.selectList("booking.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		int b_num = (Integer)pk;

		return session.selectOne("booking.read", b_num);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		int cnt = session.update("booking.update", (BookingDTO)dto);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		int b_num = (Integer)pk;
		boolean flag = false;
		int cnt= session.delete("booking.delete", b_num);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		return session.selectOne("booking.total", map);
		
	}

}
