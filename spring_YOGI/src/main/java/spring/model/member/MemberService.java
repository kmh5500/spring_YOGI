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
			dao.bdrDelete(id);
			dao.brDelete(id);
			dao.baDelete(id);
			dao.cDelete(id);
			flag = dao.delete(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
		}
		
		return flag;
	}

}
