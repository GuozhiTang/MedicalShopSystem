package com.ssh.controller;

import com.ssh.entity.Medicine;
import com.ssh.entity.Pojo;
import com.ssh.entity.User;
import com.ssh.service.LRService;
import com.ssh.service.ManagerMedicineService;
import com.ssh.service.OrderService;
import com.ssh.service.QueriesService;
import com.ssh.service.SearchService;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@Autowired
	private LRService lrService;
	@Autowired
	private SearchService searchService;
	@Autowired
	private OrderService orderService;

	@Autowired
	private QueriesService queriesService;
	@Autowired
	private ManagerMedicineService mmService;

	@RequestMapping(value = "/login.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, @ModelAttribute User user) {
		User u = lrService.login(user);
		if (u != null) {

			request.setAttribute("us", u);
			return new ModelAndView("main");

		} else {
			request.setAttribute("fail", "true");

			return new ModelAndView("login");

		}

	}

	@RequestMapping(value = "/back.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView back(HttpServletRequest request, HttpServletResponse response) {
		User user = lrService.getUserByName(request.getParameter("username"));
		request.setAttribute("us", user);
		return new ModelAndView("main");

	}

	@RequestMapping(value = "/register.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response, @ModelAttribute User user) {
		boolean succeed = lrService.register(user);
		if (succeed) {
			return new ModelAndView("login");

		} else {
			request.setAttribute("fail", "true");
			return new ModelAndView("register");

		}

	}

	@RequestMapping(value = "/search.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) {
		String value = request.getParameter("keyword");
		String userName = request.getParameter("username2");
		if (value == null || value.trim().equals("")) {

			return new ModelAndView("search", "pojo", searchService.searchAllMedicine(userName));

		} else {
			return new ModelAndView("search", "pojo", searchService.searchMedicineByName(userName, value));

		}

	}
	@RequestMapping(value = "/search2.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search2(HttpServletRequest request, HttpServletResponse response) {
		String value = request.getParameter("keyword");
		String userName = request.getParameter("username2");
		if (value == null || value.trim().equals("")) {

			return new ModelAndView("managerMedicine", "pojo", searchService.searchAllMedicine(userName));

		} else {
			return new ModelAndView("managerMedicine", "pojo", searchService.searchMedicineByName(userName, value));

		}

	}
	@RequestMapping(value = "/order.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) {
		String uName = request.getParameter("uName");
		String mName = request.getParameter("mName");
		int num = Integer.parseInt(request.getParameter("num"));
		double price = Double.parseDouble(request.getParameter("price"));
		orderService.finishOrder(uName, mName, num, price);
		return new ModelAndView("search", "pojo", searchService.searchAllMedicine(uName));

	}

	@RequestMapping(value = "/myOrders.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myOrders(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("username1");
		return new ModelAndView("myOrders", "pojo", orderService.searchOrdersByName(userName));

	}

	@RequestMapping(value = "/query.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView query(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("username1");
		return new ModelAndView("queries", "pojo", queriesService.searchAllQueries(userName));

	}

	@RequestMapping(value = "/addQuery.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addQuery(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("username1");
		String query = request.getParameter("query");
		queriesService.addQuery(userName, query);
		return new ModelAndView("queries", "pojo", queriesService.searchAllQueries(userName));

	}

	@RequestMapping(value = "/addComment.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addComment(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("username1");
		Long qid = Long.parseLong(request.getParameter("qid"));
		String content = request.getParameter("content");
		queriesService.addComment(qid, userName, content);
		return new ModelAndView("queries", "pojo", queriesService.searchAllQueries(userName));

	}

	@RequestMapping(value = "/showDetails.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView showDetails(HttpServletRequest request, HttpServletResponse response) {
		Long id = Long.parseLong(request.getParameter("id"));
		String username = request.getParameter("username");
		return new ModelAndView("showDetails", "pojo", queriesService.searchCommentsByid(username, id));

	}

	@RequestMapping(value = "/deleteMedicine.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) {
		String mn = request.getParameter("mn");
		String username = request.getParameter("username");
		mmService.delete(mn);
		return new ModelAndView("managerMedicine", "pojo", searchService.searchAllMedicine(username));

	}
	
	@RequestMapping(value = "/addMedicine.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response,@ModelAttribute Medicine me) {
		String username = request.getParameter("username");

		boolean succeed = mmService.add(me);
		if (succeed) {
			return new ModelAndView("managerMedicine", "pojo", searchService.searchAllMedicine(username));

		} else {
			request.setAttribute("fail", "true");
			return new ModelAndView("managerMedicine", "pojo", searchService.searchAllMedicine(username));

		}
	}

}