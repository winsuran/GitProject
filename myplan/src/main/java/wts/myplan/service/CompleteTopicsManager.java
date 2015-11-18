package wts.myplan.service;

import org.springframework.beans.factory.annotation.Autowired;

import wts.myplan.dao.CommonDAO;
import wts.myplan.dao.CompleteTopicsDAO;
import wts.myplan.model.CompleteTopicsVO;


public class CompleteTopicsManager extends AbstractService<CompleteTopicsVO> {

@Autowired
CompleteTopicsDAO completeTopicsDAO;

	
	
	@Override
	public CommonDAO<CompleteTopicsVO> getDAO() {
		// TODO Auto-generated method stub
		return completeTopicsDAO;
	}
	

}
