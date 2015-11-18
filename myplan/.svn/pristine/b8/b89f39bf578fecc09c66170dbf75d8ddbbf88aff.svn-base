/**
 * 
 */
package wts.myplan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import wts.myplan.dao.CommonDAO;
import wts.myplan.dao.UsersDAO;
import wts.myplan.model.UsersVO;

/**
 * @author anthonydonx
 *
 */
@Component
public class UsersManager extends AbstractService<UsersVO> {
	@Autowired
	UsersDAO usersDAO;

	@Override
	public CommonDAO<UsersVO> getDAO() {
		// TODO Auto-generated method stub
		return usersDAO;
	}
	
}
