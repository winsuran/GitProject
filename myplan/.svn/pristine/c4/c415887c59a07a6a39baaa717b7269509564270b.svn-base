package wts.myplan.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import net.sf.json.JsonConfig;
import wts.myplan.Util.DatesCal;
import wts.myplan.model.DailyProgressVO;
import wts.myplan.model.JsonObjectUtil;
import wts.myplan.model.TermsVO;
import wts.myplan.model.UsersVO;
import wts.myplan.service.AbstractService;
import wts.myplan.service.SubjectsManager;
import wts.myplan.service.TermsManager;

@RequestMapping(value = "/terms")
@Controller

public class TermsController extends AbstractController<TermsVO, Integer> {
	Logger logger = Logger.getLogger(TermsController.class);

	@Autowired
	TermsManager termsManager;
	@Autowired
	SubjectsManager subjectsManager;

	@Override
	public Logger getLogger() {
		// TODO Auto-generated method stub
		return logger;
	}

	@Override
	public AbstractService<TermsVO> getService() {
		// TODO Auto-generated method stub
		return termsManager;
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

	/**
	 * add
	 */
	@Transactional
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody void addTerm(TermsVO valueObject, HttpServletResponse httpServletResponse,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			DatesCal datesCal = new DatesCal(valueObject.getStartDate(), valueObject.getEndDate());
			valueObject.setNoOfWeekdays(datesCal.numberOfWeekDays);
			valueObject.setNoOfWeekends(datesCal.numberOfWeekendDays);
			String msg = termsManager.add(valueObject);
			session.setAttribute("activeTerm", valueObject);
			// valueObject.getTermId();
			writeJsonString(httpServletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");
		} catch (Exception e) {
			e.printStackTrace();
			getLogger().error(e.getMessage());
			writeJsonString(httpServletResponse, "{\"message\":\"" + e.getMessage() + "\",\"success\":false}");
		}

	}

	@Transactional
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody void updateTermMiniutes(TermsVO valueObject, HttpServletResponse httpServletResponse,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			TermsVO activeTerm = (TermsVO) session.getAttribute("activeTerm");
			activeTerm.setMinutesForWeekday(valueObject.getMinutesForWeekday());
			activeTerm.setMinutesForWeekend(valueObject.getMinutesForWeekend());
			int totalMins = (valueObject.getMinutesForWeekday() * activeTerm.getNoOfWeekdays())
					+ (valueObject.getMinutesForWeekend() * activeTerm.getNoOfWeekends());
			activeTerm.setTotalMinutes(totalMins);
			String msg = termsManager.update(activeTerm);
			writeJsonString(httpServletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");
		} catch (Exception e) {
			e.printStackTrace();
			getLogger().error(e.getMessage());
			writeJsonString(httpServletResponse, "{\"message\":\"" + e.getMessage() + "\",\"success\":false}");
		}

	}

	@RequestMapping(value = "/editTerm", method = RequestMethod.POST)
	public void editTerm(HttpServletResponse httpservletResponse, TermsVO valueObject) {
		int termId;
		try {
			termId = valueObject.getTermId();
			TermsVO termsVO = termsManager.get(termId);
			termsVO.setTitle(valueObject.getTitle());
			termsVO.setNote(valueObject.getNote());
			termsVO.setStartDate(valueObject.getStartDate());
			termsVO.setEndDate(valueObject.getEndDate());
			String msg = termsManager.update(termsVO);
			termsManager.reCalculateTerm(termId);
			subjectsManager.subjectRecalculation(termId);
			
			writeJsonString(httpservletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");

		} catch (Exception e) {
			System.out.print(e);
			writeJsonString(httpservletResponse, "{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");

		}
	}
	
	
	@RequestMapping(value = "/getTermsByUser", method = RequestMethod.GET)
	public void getTermsByUser(HttpServletResponse httpservletResponse,HttpServletRequest request) {
	try{
		HttpSession session = request.getSession();
		UsersVO activeUser = (UsersVO) session.getAttribute("activeUser");
	List<TermsVO> termsVOs=	termsManager.getTermsByUser(activeUser.getUserEmail());
		
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode objectNode = new ObjectNode(mapper.getNodeFactory());
		JsonObjectUtil<DailyProgressVO> jsonUtil = new JsonObjectUtil<DailyProgressVO>();
		String m = jsonUtil.getJsonObjectDataDetail(termsVOs, 1);
		ArrayNode node = mapper.readValue(m, ArrayNode.class);
		objectNode.put("Data", node);
		objectNode.put("success", true);
		writeJson(httpservletResponse, objectNode, mapper);
		
		} catch (Exception e) {
			getLogger().error(e.getMessage());
			writeJsonString(httpservletResponse, "{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");


		}
	}
}
