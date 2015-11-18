package wts.myplan.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Component;


import wts.myplan.model.SubjectsVO;

	@Component
	public class SubjectsDAO extends CommonDAO<SubjectsVO>{

		public SubjectsDAO () {
			super(SubjectsVO.class);
		
		}
		public  List<SubjectsVO> getSubjectsByTerm(final String termId){
			HibernateTemplateImpl hibernateTemplateImpl=getHibernateTemplateImpl();
			List<SubjectsVO> list=hibernateTemplateImpl.execute(new HibernateCallback<List<SubjectsVO>>(){

				public List<SubjectsVO> doInHibernate(Session arg0)
						throws HibernateException, SQLException {
					return arg0.createQuery("from SubjectsVO where termId='"+termId+"'").list();
					
				
				}
				
			});
			return list;
		}
		
		
		
	}
