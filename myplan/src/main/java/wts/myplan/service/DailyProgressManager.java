
package wts.myplan.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import wts.myplan.dao.CommonDAO;
import wts.myplan.dao.DailyProgressDAO;
import wts.myplan.model.DailyProgressVO;
import wts.myplan.model.SubjectsVO;

@Component
public class DailyProgressManager extends AbstractService<DailyProgressVO> {

	@Autowired
	DailyProgressDAO dailyProgressDAO;
	
	@Override
	public CommonDAO<DailyProgressVO> getDAO() {
		// TODO Auto-generated method stub
		return dailyProgressDAO;
	}
	public  List<DailyProgressVO> getUniqueDailyUpdate(final String currentDate,final Integer subjectId){
		List<DailyProgressVO> list=dailyProgressDAO.getUniqueDailyUpdate(currentDate, subjectId);
		return list;
	}
	
	public  List<DailyProgressVO> getDateBetween(final String fromDate,final String toDate){
		List<DailyProgressVO> list=dailyProgressDAO.getDateBetween(fromDate, toDate);
		return list;
	}
}
