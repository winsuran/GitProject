package wts.myplan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import net.sf.json.JsonConfig;
import wts.myplan.model.JsonObjectUtil;
import wts.myplan.model.SubjectsVO;
import wts.myplan.model.TermsVO;
import wts.myplan.model.UsersVO;
import wts.myplan.service.AbstractService;
import wts.myplan.service.UsersManager;


@RequestMapping(value = "/users")
@Controller
public class UsersController extends AbstractController<UsersVO, String> {
	Logger logger = Logger.getLogger(UsersController.class);
	
	@Autowired
	UsersManager usersManager;

	@Override
	public Logger getLogger() {
		return logger;
	}

	@Override
	public AbstractService<UsersVO> getService() {
		return usersManager;
	}

	@Override
	public JsonConfig getConfig() {
		return null;
	}

	@Override
	public String getControllerName() {
		return "users-tile";
	}
	@RequestMapping(value = "/save", method = RequestMethod.POST)

   
	public void save(HttpServletResponse httpServletResponse,HttpServletRequest request, UsersVO usersVO) {
		try { 
			
		String msg=	usersManager.add(usersVO);
			
			writeJsonString(httpServletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");
		} catch (Exception e) {

			getLogger().error(e.getMessage());
			writeJsonString(httpServletResponse, "{\"message\":\"" + e.getMessage() + "\",\"success\":false}");
		}
	}

	@RequestMapping(value="/getUser",method = RequestMethod.POST)
public void getUser(HttpServletResponse httpservletResponse, HttpServletRequest request){
	
		HttpSession session = request.getSession();
		// session.removeAttribute("activeUser");
		
	String activeUserEmail=	session.getAttribute("activeUserEmai").toString();
	System.out.print(activeUserEmail);
	
	try {
		UsersVO usersVO = usersManager.get(activeUserEmail);
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode objectNode = new ObjectNode(mapper.getNodeFactory());
		JsonObjectUtil<UsersVO> jsonUtil = new JsonObjectUtil<UsersVO>();
		String m = jsonUtil.getJsonObjectDataDetail(usersVO,2);
		//ArrayNode node = mapper.readValue(m, ArrayNode.class);
		ObjectNode node = mapper.readValue(m, ObjectNode.class);
		objectNode.put("Data", node);
		objectNode.put("success", true);
		writeJson(httpservletResponse, objectNode, mapper);
		
			
		//writeJsonString(httpservletResponse, "{\"message\":\"" + msg + "\",\"success\":true}");
		
	} catch (Exception e) {
		System.out.print(e);
		writeJsonString(httpservletResponse, "{\"Data\":\"" + e.getMessage() + "\",\"success\":false}");
		
	}
	
}
	

	
	
	
	
	
	
}
