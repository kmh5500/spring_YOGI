package spring.model.booking_room;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Booking_roomService {

	@Autowired
	private static Booking_roomDAO dao;
	private static SqlSessionTemplate sst;
	
	// update로 '예약완료'가 되면 쿠폰 생성
	
}
