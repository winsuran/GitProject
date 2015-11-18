package wts.myplan.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import net.sf.json.JsonConfig;
import wts.myplan.model.DailyProgressPK;
import wts.myplan.model.DailyProgressVO;
import wts.myplan.model.JsonObjectUtil;
import wts.myplan.model.SubjectsVO;
import wts.myplan.model.TermsVO;
import wts.myplan.service.AbstractService;
import wts.myplan.service.DailyProgressManager;

@RequestMapping(value = "/reports")
@Controller

public class reportsController extends AbstractController<TermsVO, Integer> {
	Logger logger = Logger.getLogger(TermsController.class);

	@Autowired
	DailyProgressManager dailyProgressManager;

	@Override
	public Logger getLogger() {
		// TODO Auto-generated method stub
		return logger;
	}

	@Override
	public AbstractService<TermsVO> getService() {
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
		return "reports-tile";
	}

	@RequestMapping(value = "/getRecentProgress", method = RequestMethod.GET)
	public void getRecentProgress(HttpServletResponse httpservletResponse, HttpServletRequest request) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		try {
			List<DailyProgressVO> dailyProgressList = dailyProgressManager.getDateBetween("2015-11-16", "2015-11-18");
			//dailyProgressList.remove(0);
			ObjectMapper mapper = new ObjectMapper();
			ObjectNode objectNode = new ObjectNode(mapper.getNodeFactory());
			JsonObjectUtil<DailyProgressVO> jsonUtil = new JsonObjectUtil<DailyProgressVO>();
			String m = jsonUtil.getJsonObjectDataDetail(dailyProgressList, 1);
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
