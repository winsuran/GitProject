package wts.myplan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import wts.myplan.dao.CommonDAO;
import wts.myplan.dao.DailyScheduleDAO;
import wts.myplan.model.DailyScheduleVO;
import wts.myplan.model.Collection.DailyScheduleCollection;
@Component
public class DailyScheduleService extends AbstractService<DailyScheduleVO> {

	@Autowired
	DailyScheduleDAO dailyScheduleDAO;
	
	@Override
	public CommonDAO<DailyScheduleVO> getDAO() {

		return dailyScheduleDAO;
	}

	@Transactional
	public String addList(DailyScheduleCollection list, String activeUserEmai) throws Exception {
		try {
			for(DailyScheduleVO dailyScheduleVO:list.getDailyScheduleVOs()){
				dailyScheduleVO.setUserEmail(activeUserEmai);
				this.saveOrUpdate(dailyScheduleVO);
			}
		} catch (Exception e) {
			throw new Exception("Add fail, because "+e.getMessage());
		}
		return "Update Successful.";
	}

	public List<DailyScheduleVO> getAllWeekEvent(String user) {
		// TODO Auto-generated method stub
		return dailyScheduleDAO.getAllWeekEvent(user);
	}

	public List<DailyScheduleVO> getAllWeekEndEvent(String user) {
		// TODO Auto-generated method stub
		return dailyScheduleDAO.getAllWeekEndEvent( user);
	}

}
