package wts.myplan.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JsonConfig;
import wts.myplan.model.TopicsVO;
import wts.myplan.service.AbstractService;
import wts.myplan.service.SubjectsManager;
import wts.myplan.service.TopicsManager;

@RequestMapping(value="/topics")
@Controller
public class TopicsController extends AbstractController<TopicsVO, Integer>{
Logger logger = Logger.getLogger(TopicsController.class);
	
	@Autowired
	TopicsManager topicsManager;

	@Override
	public Logger getLogger() {
		// TODO Auto-generated method stub
		return logger;
	}

	@Override
	public AbstractService<TopicsVO> getService() {
		// TODO Auto-generated method stub
		return topicsManager;
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
	
	
	
	
	
}
