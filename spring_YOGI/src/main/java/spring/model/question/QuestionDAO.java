package spring.model.question;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAO implements IQuestionDAO {

	@Autowired
	private static SqlSessionTemplate sst;
	
	public static void setSst(SqlSessionTemplate sst) {
		QuestionDAO.sst = sst;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		
		if(sst.insert("question.create", (QuestionDTO)dto) > 0) {
			flag = true;
		}		
		
		return flag;
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		int questionNum = (Integer)pk;
		
		return sst.selectOne("question.read", questionNum);
		
	}

	@Override
	public List list(Map map) throws Exception {
		
		 return sst.selectList("question.list", map);
		 
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		
		if(sst.update("question.update", (QuestionDTO)dto) > 0) {
			flag = true;
		}
		
		return flag;	
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		
		int questionNum = (Integer)pk; 
				
		if(sst.delete("question.delete", questionNum) > 0) {
			flag = true;
		}
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		return 0;
	}
	
	@Override
	public boolean checkPasswd(Map map) throws Exception {
		boolean flag = false;
		
		int cnt = sst.selectOne("question.checkPasswd", map);
		
		if(cnt > 0) {
			flag = true;
		}
		
		return flag;
	}

}
