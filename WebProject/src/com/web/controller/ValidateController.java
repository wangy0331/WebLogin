package com.web.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.bean.User;
import com.web.bean.UserExample;
import com.web.dao.UserDAO;

@Controller
@RequestMapping("/validate")
public class ValidateController extends BaseController{
	
	@Autowired
	private UserDAO userDao;
	
	
	@RequestMapping(value="/factoryList", method = RequestMethod.GET)
	public String list(ModelMap model, HttpServletRequest request) throws UnsupportedEncodingException{
		UserExample userExample = new UserExample();
		String page = request.getParameter("page");
		String msgContentCri = request.getParameter("msgContentCri");
		if(msgContentCri != null){
			try {
				msgContentCri = new String(msgContentCri.getBytes("iso-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		page = page == null || page.trim() == "" ? "1" : page;
		userExample.setCurrentPageNResult(Integer.parseInt(page));
		userExample.setMsgContentCri(msgContentCri);
		List<User> replys = this.userDao.listReply(userExample);
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("msgContentCri",  msgContentCri);
		model.addAttribute("currentPage",page);
		model.addAttribute("totalPages",userExample.getTotalPages());
		model.addAttribute("replys", replys);
		model.addAttribute("url", this.makeUrl(request, paraMap));
		this.getMsg(model, request);
		return "jsp/validate";
	}
	
	@RequestMapping(value="/verifyReply", method = RequestMethod.POST)
	public String verifyMessage(ModelMap model, @ModelAttribute("userForm") User user, HttpServletRequest request){
		user.setUserRole(Integer.parseInt(request.getParameter("status")));
		user.setId(Integer.parseInt(request.getParameter("id")));
		int saveFlag = this.userDao.updateReply(user);
		if(saveFlag > 0){
			this.setSuccessMsg(request, "更新成功！");
			return "redirect:factoryList";
		}else{
			this.setFailedMsg(request, "更新失败！");
			return "redirect:factoryList";
		}
	}
}
