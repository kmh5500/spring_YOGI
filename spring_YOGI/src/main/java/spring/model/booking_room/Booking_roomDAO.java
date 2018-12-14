package spring.model.booking_room;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Booking_roomDAO implements IBooking_roomDAO {	

	@Autowired
	private SqlSessionTemplate sst;
	
	public void setSst(SqlSessionTemplate sst) {
		this.sst = sst;
	}		
		
	// 예약 시 날짜, 예약 상태 등록
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		
		if(sst.insert("booking_room.create", (Booking_roomDTO)dto) > 0) {
			flag = true;
		}
		
		return flag;
	}

	// 예약 상세 확인
	@Override
	public Object read(Object pk) throws Exception {
		
		int bnum = (Integer)pk;
		
		return sst.selectOne("booking_room.read", bnum);
		
	}

	// 예약 수정
	@Override
	public boolean update(Object dto) throws Exception {
		
		boolean flag = false;
		
		if (sst.update("booking_room.update", (Booking_roomDTO)dto) > 0) {
			flag = true;
		}
		
		return flag;
	}

	// 예약 취소
	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		
		int bnum = (Integer)pk;
		
		if(sst.delete("booking_room.delete", bnum) > 0) {
			flag = true;
		}
		
		return flag;
	}

	// 예약 전체 리스트 확인
	@Override
	public List list(Map map) throws Exception {
		
		return sst.selectList("booking_room.list", map);
		
	}

	@Override
	public int total(Map map) throws Exception {
		return 0;
	}
	
}
