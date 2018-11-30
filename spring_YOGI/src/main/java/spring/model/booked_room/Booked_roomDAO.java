package spring.model.booked_room;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class Booked_roomDAO implements IBooked_roomDAO {
	
	@Autowired
	private static SqlSessionTemplate session;
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		
		if(session.insert("booked_room.create", (Booked_roomDTO)dto) > 0) {
			flag = true;
		}
		
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return null;
	}

	@Override
	public Object read(Object pk) throws Exception {
		return null;
	}

	@Override
	public boolean update(Object dto) throws Exception {
		return false;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		
		int bookedRnum = (Integer)pk;
		
		if (session.delete("booked_room.delete", bookedRnum) > 0) {
			flag = true;
		}
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {		
		return 0;
	}
	
}
