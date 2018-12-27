package spring.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public boolean allDelete(String id) {
		boolean flag = false;
		
		try {
			dao.bdrDelete(id); //booked_room
			dao.brDelete(id);  //booking_room
			dao.baDelete(id);  //booking_affiliation
			dao.cDelete(id);   //coupon
			flag = dao.delete(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
		}
		
		return flag;
	}

}
