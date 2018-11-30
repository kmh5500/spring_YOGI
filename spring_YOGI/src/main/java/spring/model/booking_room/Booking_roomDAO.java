package spring.model.booking_room;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sqlmap.MyAppSqlConfig;

public class Booking_roomDAO {	
	@Override
	protected void finalize() throws Throwable {
		session.close();
	}

	private static SqlSession session;
	private static SqlSessionFactory sqlMapper;
	
	static {
		sqlMapper = MyAppSqlConfig.getSqlMapInstance();
		session = sqlMapper.openSession(true);
	}
	
	// 예약 시 날짜, 예약 상태 등록
	public boolean create(Booking_roomDTO dto) throws Exception {
		boolean flag = false;
		
		if(session.insert("booking_room.create", dto) > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	// 예약 취소(트랜잭션 처리를 위해 Booking_roomService 이용)
	public boolean delete(int bookingRnum) throws Exception { 
		boolean flag = false;
		
		if(session.delete("booking_room.delete", bookingRnum) > 0) {
			flag = true;
		}
		
		return flag;
	}
	
}
