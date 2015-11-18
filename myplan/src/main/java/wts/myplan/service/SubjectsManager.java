package wts.myplan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import wts.myplan.dao.CommonDAO;
import wts.myplan.dao.SubjectsDAO;
import wts.myplan.model.SubjectsVO;


	@Component
	public class SubjectsManager extends AbstractService<SubjectsVO> {
		@Autowired
		SubjectsDAO subjectsDAO;
		@Autowired
		TermsManager termsManager;

		@Override
		public CommonDAO<SubjectsVO> getDAO() {
			// TODO Auto-generated method stub
			return subjectsDAO;
		}
		public  List<SubjectsVO> getSubjectsByTerm(final String termId){
			List<SubjectsVO> list=subjectsDAO.getSubjectsByTerm(termId);
			return list;
		}
		@Transactional
		public  void subjectRecalculation(final Integer termId){
			try {
				List<SubjectsVO> list=getSubjectsByTerm(termId.toString());
				int termTotalMin=	termsManager.get(termId).getTotalMinutes();
				Double allSubjectsPriority=0.0;//total of all priorities eg:700
				Double noOfSubjects=0.0;  //eg:5
					for (SubjectsVO subjectsVO : list) {
						allSubjectsPriority+=subjectsVO.getPriorityLevel();
						noOfSubjects++;
				
					}
					for (SubjectsVO subjectsVO : list) {
						
						Double currentPriority=subjectsVO.getPriorityLevel();
						Double noOfMinutes=(currentPriority/allSubjectsPriority)*termTotalMin;
						
						subjectsVO.setTotalMinutes(noOfMinutes.intValue());
						subjectsDAO.update(subjectsVO);
					}
					
					
				
			} catch (Exception e) {
			System.out.print("subjectRecalculation -  " +e); 
			}
			
		
	}
	}
