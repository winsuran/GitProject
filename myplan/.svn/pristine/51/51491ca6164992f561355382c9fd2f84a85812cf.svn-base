package wts.myplan.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Component;

import wts.myplan.model.DailyProgressVO;
import wts.myplan.model.TermsVO;

@Component
public class TermsDAO extends CommonDAO<TermsVO>{

	public TermsDAO () {
		super(TermsVO.class);
	
	}
	
	public  List<TermsVO> getTermsByUser(final String userEmail){
		HibernateTemplateImpl hibernateTemplateImpl=getHibernateTemplateImpl();
		List<TermsVO> list=hibernateTemplateImpl.execute(new HibernateCallback<List<TermsVO>>(){

			public List<TermsVO> doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				return arg0.createQuery("from TermsVO where userEmail='"+userEmail+"'").list();
				
			
			}
			
		});
		return list;
	}
	
	
}
