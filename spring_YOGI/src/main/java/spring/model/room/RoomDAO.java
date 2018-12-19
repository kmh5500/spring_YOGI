package spring.model.room;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDAO implements IRoomDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = session.insert("room.create", (RoomDTO)dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return session.selectList("room.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		int rnum = (Integer)pk;
		
		return session.selectOne("room.read", rnum);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		
		int cnt = session.update("room.update", (RoomDTO)dto);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int total(Map map) throws Exception {
		return session.selectOne("room.total", map);
	}

	@Override
	public List rlist(Map map) throws Exception {
		return session.selectList("room.rlist", map);
	}

	@Override
	public int rtotal(Map map) throws Exception {
		return session.selectOne("room.rtotal", map);
	}

}
