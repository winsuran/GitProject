
package wts.myplan.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Component;

import wts.myplan.model.DailyProgressVO;
import wts.myplan.model.SubjectsVO;


@Component
public class DailyProgressDAO extends CommonDAO<DailyProgressVO>{

	public DailyProgressDAO() {
		super(DailyProgressVO.class);
		// TODO Auto-generated constructor stub
	}
	public  List<DailyProgressVO> getUniqueDailyUpdate(final String currentDate,final Integer subjectId){
		HibernateTemplateImpl hibernateTemplateImpl=getHibernateTemplateImpl();
		List<DailyProgressVO> list=hibernateTemplateImpl.execute(new HibernateCallback<List<DailyProgressVO>>(){

			public List<DailyProgressVO> doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				return arg0.createQuery("from DailyProgressVO where spendDates='"+currentDate+"' AND subjectId='"+subjectId+"'").list();
				
			
			}
			
		});
		return list;
	}
	public  List<DailyProgressVO> getDateBetween(final String fromDate,final String toDate){
		HibernateTemplateImpl hibernateTemplateImpl=getHibernateTemplateImpl();
		List<DailyProgressVO> list=hibernateTemplateImpl.execute(new HibernateCallback<List<DailyProgressVO>>(){

			public List<DailyProgressVO> doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				return arg0.createQuery("from DailyProgressVO where spendDates BETWEEN '"+fromDate+"' AND '"+toDate+"'").list();
				
			
			}
			
		});
		return list;
	}
	
	
}
