package wts.myplan.dao;

import org.springframework.stereotype.Component;

import wts.myplan.model.TopicsVO;

	@Component
	public class TopicsDAO  extends CommonDAO<TopicsVO>{

		public TopicsDAO() {
			super(TopicsVO.class);
		
		}
		
		
	}
