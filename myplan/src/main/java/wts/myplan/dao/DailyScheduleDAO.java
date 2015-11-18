package wts.myplan.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import wts.myplan.model.DailyScheduleVO;

@Component
public class DailyScheduleDAO extends CommonDAO<DailyScheduleVO> {

	public DailyScheduleDAO() {
		super(DailyScheduleVO.class);
		// TODO Auto-generated constructor stub
	}

	public List<DailyScheduleVO> getAllWeekEvent(String user) {
		HibernateTemplateImpl hibernateTemplateImpl=getHibernateTemplateImpl();
		String hql="from DailyScheduleVO where userEmail='"+user+"' and forWeekend=null";
		return hibernateTemplateImpl.find(hql);
	}

	public List<DailyScheduleVO> getAllWeekEndEvent(String user) {
		HibernateTemplateImpl hibernateTemplateImpl=getHibernateTemplateImpl();
		String hql="from DailyScheduleVO where userEmail='"+user+"' and forWeekday=null";
		return hibernateTemplateImpl.find(hql);
	}

}
