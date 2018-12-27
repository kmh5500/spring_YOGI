package spring.model.question;

import java.util.Map;

import spring.model.yogiinter.DAOSTDInter;

public interface IQuestionDAO extends DAOSTDInter {

	boolean checkPasswd(Map map) throws Exception;
}
