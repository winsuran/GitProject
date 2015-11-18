package wts.myplan.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import wts.myplan.model.DailyScheduleVO;
import wts.myplan.model.JsonObjectUtil;
import wts.myplan.model.Collection.DailyScheduleCollection;
import wts.myplan.service.AbstractService;
import wts.myplan.service.DailyScheduleService;

@Controller
@RequestMapping(value="dailyschedule")
public class DailyScheduleController extends AbstractController<DailyScheduleVO, String> {
	
	@Autowired
	DailyScheduleService dailyScheduleService;
	
	Logger logger = Logger.getLogger(DailyScheduleController.class);

	@Override
	public Logger getLogger() {
		// TODO Auto-generated method stub
		return logger;
	}

	@Override
	public AbstractService<DailyScheduleVO> getService() {
		// TODO Auto-generated method stub
		return dailyScheduleService;
	}

	@Override
	public JsonConfig getConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getControllerName() {
		// TODO Auto-generated method stub
		return "eventcalculate-tile";
	}
	
	
	@RequestMapping(value="/addlist" ,method=RequestMethod.POST)
	public @ResponseBody void  addList(DailyScheduleCollection list,HttpServletResponse httpServletResponse,HttpSession session ){
		
		
		try {
			String msg=dailyScheduleService.addList(list,session.getAttribute("activeUserEmai").toString());
			writeJsonString(httpServletResponse, "{\"message\":\"" + msg+ "\",\"success\":true}");
		} catch (Exception e) {
			e.printStackTrace();
			// writeJsonString(httpServletResponse, json.toString());

			getLogger().error(e.getMessage());
			writeJsonString(httpServletResponse,"{\"message\":\"" + e.getMessage()+ "\",\"success\":false}");
		}
	}
	
	@RequestMapping(value="/getAllWeekEvent" ,method=RequestMethod.GET)
	public void getAllWeekEvent(HttpServletResponse httpServletResponse,HttpSession session ){
		try {

			List<DailyScheduleVO> valuObj = dailyScheduleService.getAllWeekEvent(session.getAttribute("activeUserEmai").toString());
			ObjectMapper mapper = new ObjectMapper();
			ObjectNode node2 = new ObjectNode(mapper.getNodeFactory());

			JsonObjectUtil<DailyScheduleVO> jsonUtil = new JsonObjectUtil<DailyScheduleVO>();
			String m = jsonUtil.getJsonObjectDataDetail(valuObj, 2);
			// System.out.println(m);
			ArrayNode node = mapper.readValue(m, ArrayNode.class);
			node2.put("Data", node);
			node2.put("success", true);

			writeJson(httpServletResponse, node2, mapper);
		} catch (Exception e) {
			/*
			 * e.printStackTrace(); json.put("Data", e.getMessage());
			 * json.put("success", false); getLogger().error(e.getMessage());
			 * writeJsonString(httpServletResponse, json.toString());
			 */
			e.printStackTrace();
			getLogger().error(e.getMessage());
			writeJsonString(httpServletResponse,
					"{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");
		}
		
	}
	
	@RequestMapping(value="/getAllWeekEndEvent" ,method=RequestMethod.GET)
	public void getAllWeekEndEvent(HttpServletResponse httpServletResponse,HttpSession session ){
		try {

			List<DailyScheduleVO> valuObj = dailyScheduleService.getAllWeekEndEvent(session.getAttribute("activeUserEmai").toString());
			ObjectMapper mapper = new ObjectMapper();
			ObjectNode node2 = new ObjectNode(mapper.getNodeFactory());

			JsonObjectUtil<DailyScheduleVO> jsonUtil = new JsonObjectUtil<DailyScheduleVO>();
			String m = jsonUtil.getJsonObjectDataDetail(valuObj, 2);
			// System.out.println(m);
			ArrayNode node = mapper.readValue(m, ArrayNode.class);
			node2.put("Data", node);
			node2.put("success", true);

			writeJson(httpServletResponse, node2, mapper);
		} catch (Exception e) {
			/*
			 * e.printStackTrace(); json.put("Data", e.getMessage());
			 * json.put("success", false); getLogger().error(e.getMessage());
			 * writeJsonString(httpServletResponse, json.toString());
			 */
			e.printStackTrace();
			getLogger().error(e.getMessage());
			writeJsonString(httpServletResponse,
					"{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");
		}
		
	}

}
