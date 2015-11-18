package wts.myplan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import wts.myplan.Util.DatesCal;
import wts.myplan.dao.CommonDAO;
import wts.myplan.dao.TermsDAO;
import wts.myplan.model.DailyProgressVO;
import wts.myplan.model.TermsVO;

@Component
public class TermsManager extends AbstractService<TermsVO> {

	@Autowired
	TermsDAO termsDAO;

	@Override
	public CommonDAO<TermsVO> getDAO() {
		// TODO Auto-generated method stub
		return termsDAO;
	}

	@Transactional
	public String reCalculateTerm(int termId) throws Exception {

		try {
			TermsVO termsVO = this.get(termId);
			DatesCal datesCal = new DatesCal(termsVO.getStartDate(), termsVO.getEndDate());
			termsVO.setNoOfWeekdays(datesCal.numberOfWeekDays);
			termsVO.setNoOfWeekends(datesCal.numberOfWeekendDays);
			int totalMins=(termsVO.getMinutesForWeekday()*datesCal.numberOfWeekDays)+(termsVO.getMinutesForWeekend()*datesCal.numberOfWeekendDays);
			termsVO.setTotalMinutes(totalMins);
			this.update(termsVO);
			return "Update Successful.";	

		} catch (Exception e) {
		System.out.print(e);
		return "Update fail.";	
		}
	}
	
	public  List<TermsVO> getTermsByUser( String userEmail){
		List<TermsVO> list=termsDAO.getTermsByUser(userEmail);
		return list;
	}
	
	
}
