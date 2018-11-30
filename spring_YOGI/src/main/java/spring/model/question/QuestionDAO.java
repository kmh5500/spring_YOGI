package spring.model.question;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sqlmap.MyAppSqlConfig;

@Repository
public class QuestionDAO implements IQuestionDAO {
	
	@Autowired
	private static SqlSession session;
	
	public boolean create(QuestionDTO dto) throws Exception {	
		boolean flag = false;
		
		if(session.insert("question.create", dto) > 0) {
			flag = true;
		}		
		
		return flag;	
	}
	
	public List<QuestionDTO> list(Map map) throws Exception {
		
		 return session.selectList("question.list", map);
		 
	}
	
	public QuestionDTO read(int questionNum) throws Exception {
		
		return session.selectOne("question.read", questionNum);
		
	}
	
	public boolean update(QuestionDTO dto) throws Exception {
		boolean flag = false;
		
		if(session.update("question.update", dto) > 0) {
			flag = true;
		}
		
		return flag;	
		
	}
	
	public boolean delete(int questionNum) throws Exception {
		boolean flag = false;
		
		if(session.delete("question.delete", questionNum) > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean checkPasswd(Map map) throws Exception {
		boolean flag = false;
		
		int cnt = session.selectOne("question.checkPasswd", map);
		
		if(cnt > 0) {
			flag = true;
		}
		
		return flag;
	}
	

}
