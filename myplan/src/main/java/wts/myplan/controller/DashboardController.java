
package wts.myplan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JsonConfig;
import wts.myplan.model.DailyProgressVO;
import wts.myplan.model.SubjectsVO;
import wts.myplan.model.TermsVO;
import wts.myplan.model.TopicsVO;
import wts.myplan.service.AbstractService;
import wts.myplan.service.DailyProgressManager;
import wts.myplan.service.TermsManager;


@RequestMapping(value = "/dashboard")
@Controller
public class DashboardController extends AbstractController<DailyProgressVO, String> {
	Logger logger = Logger.getLogger(DailyProgressManager.class);
	
	/*@Autowired
	DailyProgressManager dailyProgressManager;*/
	
	@Override
	public Logger getLogger() {
		// TODO Auto-generated method stub
		return logger;
	}

	@Override
	public AbstractService<DailyProgressVO> getService() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public JsonConfig getConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getControllerName() {
		// TODO Auto-generated method stub
		return "dashboard-tile";
	}
		
	
/*	@RequestMapping(value="/dailyUpdate", method=RequestMethod.POST)
public void updateProgress(TermsVO termsVO, HttpServletResponse httpservletResponse,
		HttpServletRequest request) {
	List<SubjectsVO> list;
	try {
	
		
	
		
		list = termsVO.getSubjectsVOs();
		String msg = TermsManager.update(sVO);
		for (TopicsVO topicsVO : list) {
			topicsVO.setSubjectsVO(sVO);
			topicsVO.setSubjectId(sVO.getSubjectId());
			msg = topicsManager.saveOrUpdate(topicsVO);
		}
		subjectsManager.subjectRecalculation(sVO.getTermId());
		

		subjectsManager.subjectRecalculation(sVO.getTermId());
		writeJsonString(httpservletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");

	} catch (Exception e) {
		getLogger().error(e.getMessage());
		writeJsonString(httpservletResponse, "{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");

	}

}
	*/
	
	
}

	

