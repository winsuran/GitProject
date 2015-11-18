package wts.myplan.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import net.sf.json.JsonConfig;
import wts.myplan.Util.DatesCal;
import wts.myplan.model.DailyProgressPK;
import wts.myplan.model.DailyProgressVO;
import wts.myplan.model.SubjectsVO;
import wts.myplan.model.TermsVO;
import wts.myplan.model.TopicsVO;
import wts.myplan.service.AbstractService;
import wts.myplan.service.DailyProgressManager;
import wts.myplan.service.SubjectsManager;
import wts.myplan.service.TopicsManager;

@RequestMapping(value = "/subjects")
@Controller
public class SubjectsController extends AbstractController<SubjectsVO, Integer> {
	Logger logger = Logger.getLogger(SubjectsController.class);

	@Autowired
	SubjectsManager subjectsManager;
	@Autowired
	TopicsManager topicsManager;
	@Autowired
	DailyProgressManager dailyProgressManager;

	@Override
	public Logger getLogger() {
		// TODO Auto-generated method stub
		return logger;
	}

	@Override
	public AbstractService<SubjectsVO> getService() {
		// TODO Auto-generated method stub
		return subjectsManager;
	}

	@Override
	public JsonConfig getConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getControllerName() {
		// TODO Auto-generated method stub
		return "terms-tile";
	}

	@RequestMapping(value = "/getSubjectsByTerm", method = RequestMethod.GET)
	public void getSubjectsByTerm(HttpServletResponse httpservletResponse, TermsVO termsVO,
			HttpServletRequest request) {

		try {

			if (termsVO.getTermId() == null) {
				HttpSession session = request.getSession();
				TermsVO activeTerm = (TermsVO) session.getAttribute("activeTerm");
				termsVO.setTermId(activeTerm.getTermId());

			}
			List<SubjectsVO> valueObj = subjectsManager.getSubjectsByTerm(termsVO.getTermId().toString());
			if (valueObj != null && valueObj.size() > 0) {
				ObjectMapper mapper = new ObjectMapper();
				ObjectNode objectNode = new ObjectNode(mapper.getNodeFactory());
				wts.myplan.model.JsonObjectUtil<SubjectsVO> jsonUtil = new wts.myplan.model.JsonObjectUtil<SubjectsVO>();
				String m = jsonUtil.getJsonObjectDataDetail(valueObj, 1);
				ArrayNode node = mapper.readValue(m, ArrayNode.class);
				objectNode.put("Data", node);
				objectNode.put("success", true);
				writeJson(httpservletResponse, objectNode, mapper);
			} else {
				writeJsonString(httpservletResponse, "{\"Data\":\"Empty\",\"success\":false}");
			}
		} catch (Exception e) {
			getLogger().error(e.getMessage());
			writeJsonString(httpservletResponse, "{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");

		}

	}

	@RequestMapping(value = "/addSubject", method = RequestMethod.POST)
	public void addSubject(SubjectsVO subjectsVO, HttpServletResponse httpservletResponse, HttpServletRequest request) {
		List<TopicsVO> list;
		try {
			if (subjectsVO.getTermId() != null) {
				SubjectsVO sVO = new SubjectsVO();
				sVO.setName(subjectsVO.getName());
				sVO.setColor(subjectsVO.getColor());
				sVO.setTermId(subjectsVO.getTermId());
				sVO.setPriorityLevel(subjectsVO.getPriorityLevel());
				sVO.setCompleteMinutes(0);

				list = subjectsVO.getTopicsVOs();

				String msg = subjectsManager.saveOrUpdate(sVO);
				if (list != null) {
					for (TopicsVO topicsVO : list) {
						topicsVO.setSubjectsVO(sVO);
						topicsVO.setSubjectId(sVO.getSubjectId());
						topicsManager.saveOrUpdate(topicsVO);
					}
				}

				subjectsManager.subjectRecalculation(sVO.getTermId());

				writeJsonString(httpservletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");
			} else {
				HttpSession session = request.getSession();
				TermsVO activeTerm = (TermsVO) session.getAttribute("activeTerm");
				SubjectsVO sVO = new SubjectsVO();
				sVO.setName(subjectsVO.getName());
				sVO.setTermId(subjectsVO.getTermId());
				sVO.setColor(subjectsVO.getColor());
				sVO.setPriorityLevel(subjectsVO.getPriorityLevel());
				sVO.setCompleteMinutes(0);
				list = subjectsVO.getTopicsVOs();
				sVO.setTermId(activeTerm.getTermId());

				String msg = subjectsManager.saveOrUpdate(sVO);
				if (list != null) {
					for (TopicsVO topicsVO : list) {
						topicsVO.setSubjectsVO(sVO);
						topicsVO.setSubjectId(sVO.getSubjectId());
						topicsManager.saveOrUpdate(topicsVO);
					}
				}
				subjectsManager.subjectRecalculation(sVO.getTermId());
				writeJsonString(httpservletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");
			}

		} catch (Exception e) {
			getLogger().error(e.getMessage());
			writeJsonString(httpservletResponse, "{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");

		}

	}

	@RequestMapping(value = "/editSubject", method = RequestMethod.POST)
	public void editSubject(SubjectsVO subjectsVO, HttpServletResponse httpservletResponse,
			HttpServletRequest request) {
		List<TopicsVO> list;
		try {
			SubjectsVO sVO = subjectsManager.get(subjectsVO.getSubjectId());
			sVO.setName(subjectsVO.getName());
			sVO.setTermId(subjectsVO.getTermId());
			sVO.setColor(subjectsVO.getColor());
			sVO.setPriorityLevel(subjectsVO.getPriorityLevel());
			list = subjectsVO.getTopicsVOs();
			String msg = subjectsManager.update(sVO);
			if(list!=null){
			for (TopicsVO topicsVO : list) {
				topicsVO.setSubjectsVO(sVO);
				topicsVO.setSubjectId(sVO.getSubjectId());
				msg = topicsManager.saveOrUpdate(topicsVO);
			}
			}
			subjectsManager.subjectRecalculation(sVO.getTermId());

			subjectsManager.subjectRecalculation(sVO.getTermId());
			writeJsonString(httpservletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");

		} catch (Exception e) {
			getLogger().error(e.getMessage());
			writeJsonString(httpservletResponse, "{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");

		}

	}

	@RequestMapping(value = "/updateDaily", method = RequestMethod.POST)
	public void updateDaily(SubjectsVO subjectsVO, HttpServletResponse httpservletResponse,
			HttpServletRequest request) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		try {
			SubjectsVO sVO = subjectsManager.get(subjectsVO.getSubjectId());
			sVO.setCompleteMinutes(subjectsVO.getCompleteMinutes() + sVO.getCompleteMinutes());
			String msg = subjectsManager.update(sVO);

			/*
			 * List<DailyProgressVO> dPVOList =
			 * dailyProgressManager.getUniqueDailyUpdate(dateFormat.format(date)
			 * ,subjectsVO.getSubjectId()); DailyProgressVO dailyProgressVO =
			 * new DailyProgressVO();
			 * dailyProgressVO.setSpendDates(dateFormat.format(date));
			 * dailyProgressVO.setSubjectId(subjectsVO.getSubjectId()); if
			 * (!dPVOList.isEmpty()) {
			 * dailyProgressVO.setSpendMinutes(dPVOList.get(0).getSpendMinutes()
			 * +subjectsVO.getCompleteMinutes()); }else{
			 * dailyProgressVO.setSpendMinutes(subjectsVO.getCompleteMinutes());
			 * }
			 */
			DailyProgressPK dailyProgressPK = new DailyProgressPK();
			dailyProgressPK.setSpendDates(dateFormat.format(date));
			dailyProgressPK.setSubjectId(sVO.getSubjectId());
			DailyProgressVO dailyProgressVO = dailyProgressManager.get(dailyProgressPK);
			if (dailyProgressVO!=null) {
				dailyProgressVO.setSpendMinutes(dailyProgressVO.getSpendMinutes()+subjectsVO.getCompleteMinutes());
				dailyProgressManager.saveOrUpdate(dailyProgressVO);
			}else{
				DailyProgressVO dPVO=new DailyProgressVO();
				dPVO.setDailyProgressPK(dailyProgressPK);
				dPVO.setSpendDates(dateFormat.format(date));
				dPVO.setSpendMinutes(subjectsVO.getCompleteMinutes());	
				dailyProgressManager.saveOrUpdate(dPVO);
			}
			

			
			// subjectsManager.subjectRecalculation(sVO.getTermId());
			writeJsonString(httpservletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");

		} catch (Exception e) {
			getLogger().error(e.getMessage());
			writeJsonString(httpservletResponse, "{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");

		}

	}
}
