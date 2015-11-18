package wts.myplan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import wts.myplan.dao.CommonDAO;
import wts.myplan.dao.TopicsDAO;
import wts.myplan.model.TopicsVO;

	@Component
	public class TopicsManager extends AbstractService<TopicsVO> {
		@Autowired
		TopicsDAO topicsDAO;

		@Override
		public CommonDAO<TopicsVO> getDAO() {
			// TODO Auto-generated method stub
			return topicsDAO;
		}
		
	}
