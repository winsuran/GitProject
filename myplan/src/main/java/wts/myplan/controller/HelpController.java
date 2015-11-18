package wts.myplan.controller;

import java.io.Serializable;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JsonConfig;
import wts.myplan.service.AbstractService;

@RequestMapping(value = "/help")
@Controller
public class HelpController extends AbstractController<Serializable, Serializable> {
	Logger logger = Logger.getLogger(UsersController.class);
	
	@Override
	public Logger getLogger() {
		// TODO Auto-generated method stub
		return logger;
	}

	@Override
	public AbstractService<Serializable> getService() {
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
		return "help-tile";
	}

}
