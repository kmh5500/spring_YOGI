package spring.model.hotel;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class HotelDAO implements IHotelDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = session.insert("hotel.create", (HotelDTO)dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return session.selectList("hotel.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		int hnum = (Integer)pk;
		
		return session.selectOne("hotel.read", hnum);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		
		int cnt = session.update("hotel.update", (HotelDTO)dto);
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
		return session.selectOne("hotel.total", map);
	}

	@Override
	public boolean starupdate(int hnum) throws Exception {
		boolean flag = false;
		
		int cnt = session.update("hotel.starupdate", hnum);
		if(cnt>0) flag = true;
		
		return flag;
		
	}

	@Override
	public boolean duplicateHname(String hname) throws Exception {
		boolean flag = false;
		int cnt = session.selectOne("hotel.duplicateHname", hname);
		if(cnt>0)flag=true;
		return flag;
		
	}

	@Override
	public boolean duplicateHemail(String hemail) throws Exception {
		boolean flag = false;
		int cnt = session.selectOne("hotel.duplicateHemail", hemail);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public int checkHnum(String hid) throws Exception {
		
		return session.selectOne("hotel.checkHnum", hid);
	}

}
