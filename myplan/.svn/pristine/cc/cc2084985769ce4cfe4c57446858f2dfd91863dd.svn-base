package wts.myplan.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JsonConfig;
import wts.myplan.model.UsersVO;
import wts.myplan.service.AbstractService;
import wts.myplan.service.UsersManager;

@RequestMapping(value = "/")
@Controller
public class LandingController extends AbstractController<UsersVO, String> {
	Logger logger = Logger.getLogger(LandingController.class);

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

		return "landing";
	}

	@RequestMapping(value = "/loginattempt", method = RequestMethod.POST)
	public String loginAttempt(HttpServletResponse httpservletResponse, HttpServletRequest request, UsersVO usersVO) {
		try {

			HttpSession session = request.getSession();
			// session.removeAttribute("activeUser");
			UsersVO user = usersManager.get(usersVO.getUserEmail());
			if (user.getPassword().equals(usersVO.getPassword())) {

				session.setAttribute("activeUserEmai", user.getUserEmail());
				session.setAttribute("activeUser", user);
				return "redirect:dashboard";
				//return "dashboard-tile";

			} else {
				session.removeAttribute("activeUser");
				return "landing";
			}

		} catch (Exception e) {
			System.out.println(e);
			getLogger().error(e.getMessage());
			return "landing";
		}
	}

}
