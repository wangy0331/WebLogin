package com.web.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;

import com.web.bean.User;
import com.web.dao.UserDAO;

public class BaseController {
	@Autowired
	public UserDAO userDAO;
	
	public static final String SUCC_MSG = "SUCC_MSG";
	public static final String FAIL_MSG = "FAIL_MSG";

	public void getMsg(ModelMap model, HttpServletRequest request) {
		if (request.getSession().getAttribute(SUCC_MSG) != null) {
			model.addAttribute(SUCC_MSG,
					request.getSession().getAttribute(SUCC_MSG));
			request.getSession().removeAttribute(SUCC_MSG);
		}
		if (request.getSession().getAttribute(FAIL_MSG) != null) {
			model.addAttribute(FAIL_MSG,
					request.getSession().getAttribute(FAIL_MSG));
			request.getSession().removeAttribute(FAIL_MSG);
		}
	}

	public void setSuccessMsg(HttpServletRequest request, String msg) {
		request.getSession().setAttribute(SUCC_MSG, msg);
	}

	public void setFailedMsg(HttpServletRequest request, String msg) {
		request.getSession().setAttribute(FAIL_MSG, msg);
	}

	public String getCurrentDate() {
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		return dateFormat.format(cal.getTime());
	}
	public String makeUrl(HttpServletRequest request, Map<String, String> paraMap){
		StringBuffer url = new StringBuffer(request.getRequestURL().toString());
		url.append("?");
		url.append(this.getParams(paraMap));
		url.append("page=");
	    return url.toString();
	}
	private String getParams(Map<String, String> paraMap){
		StringBuffer params = new StringBuffer();
		if(paraMap != null){
			Iterator<Entry<String, String>> strItor = paraMap.entrySet().iterator();
			while(strItor.hasNext()){
				Entry<String, String> itObj = strItor.next();
				if(itObj.getValue() != null && itObj.getValue().trim() != ""){
					params.append(itObj.getKey());
					params.append("=");
					params.append(itObj.getValue());
					params.append("&");
				}
			}
		}
		return params.toString();
	}
	/**
	 * 
	 * @return
	 */
//	public String getUserId(){
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        String name = auth.getName();
//        User userObj = this.userDAO.getUserByUserId(name);
//		return userObj == null || userObj.getUserId() == null ? "" : userObj.getUserId();
//	}
//	
//	public String getId(){
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        String name = auth.getName();
//        User userObj = this.userDAO.getUserByUserId(name);
//		return (String) (userObj == null ? "" : userObj.getId());
//	}
	
	
	/*
	public String getShowPath(String filePath){
		return filePath == null || filePath.trim() == "" ? "":filePath.replace("/livenews", "");
	}
	*/
	
	
	
}
