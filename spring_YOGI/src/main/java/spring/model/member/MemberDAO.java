package spring.model.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements IMemberDAO{
	
	@Autowired
	private SqlSessionTemplate mysql;
	
	//회원가입 생성
	@Override
	public boolean create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt  =  mysql.insert("member.create", dto);
		if(cnt > 0 ) { 
			flag = true;
		}
		return flag;
	}
	
	//회원 목록
	@Override
	public List list(Map map)  {
		// TODO Auto-generated method stub
		return mysql.selectList("member.list", map);
	}
	
	//내정보 및 회원정보
	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.read", pk);
	}
	
	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt  =  mysql.insert("member.update", dto);
		if(cnt > 0 ) { 
			flag = true;
		}
		return flag;
		
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt  =  mysql.insert("member.delete", pk);
		if(cnt > 0 ) { 
			flag = true;
		}
		return flag;
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.total", map);
	}

	//비밀번호 변경
	@Override
	public boolean updatePass(Map map) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt  =  mysql.insert("member.updatePass", map);
		if(cnt > 0 ) { 
			flag = true;
		}
		return flag;
		
	}
	//비밀번호 찾기시 비밀번호 재발급 후 변경
	@Override
	public boolean updatenewPass(Map map) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt  =  mysql.insert("member.updatenewPass", map);
		if(cnt > 0 ) { 
			flag = true;
		}
		return flag;
	}

	//로그인??
	@Override
	public int passCheck(Map map) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.passCheck", map);
	}
	//ID중복확인
	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.idCheck", id);
	}
	//email중복확인
	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.emailCheck", email);
	}

	@Override
	public void bdrDelete(String id) {
		// TODO Auto-generated method stub
		mysql.delete("member.bdrdelete", id);
		
	}

	@Override
	public void brDelete(String id) {
		// TODO Auto-generated method stub
		mysql.delete("member.brdelete", id);
	}

	@Override
	public void cDelete(String id) {
		// TODO Auto-generated method stub
		mysql.delete("member.cdelete", id);
	}

	@Override
	public void baDelete(String id) {
		// TODO Auto-generated method stub
		mysql.delete("member.badelete", id);
		
	}
	//로그인
	@Override
	public int loginCheck(Map map) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.loginCheck", map);
	}
	//회원 분류(회원, 호텔, 업체 ,관리자)
	@Override
	public String getGrade(String id) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.getGrade", id);
	}
	//ID찾기
	@Override
	public String findid(String email) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.findid", email);
	}
	//비밀번호 찾기(비밀번호 재발급 생성후 사용 안함)
	@Override
	public String findpass(String email) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.findpass", email);
	}
	//ID 와 email확인 (미완성)
	public int idEmailCheck(Map map) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.idemailcheck", map);
	}
	//임시 비밀번호 발급
	@Override
	public String getRamdomPassword(int len) { 
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
				'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
	    int idx = 0; 
	    StringBuffer sb = new StringBuffer();
	    //System.out.println("charSet.length :::: "+charSet.length); 
		        for (int i = 0; i < len; i++) { 
		        	idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거)
		        	//System.out.println("idx :::: "+idx);
		        	sb.append(charSet[idx]); 
		        	} 
		        return sb.toString(); 
	}

	

	
}
