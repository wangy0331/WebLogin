package com.web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.bean.User;

@Controller
@RequestMapping(value = "/auth")
public class AuthController extends BaseController{
	
	//转到登录页面
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(ModelMap model, @RequestParam(value = "error", required = false) String error, HttpServletRequest request){
		model.addAttribute("error", error);
		model.addAttribute("msg", "Hello ~ Log4j");
		return "auth/login";
	}

	/**
	 * 登出
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap model, HttpServletRequest request) {
        return "auth/login";
    }
	
	//验证登录信息
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginUser(ModelMap model, HttpServletRequest request, HttpServletResponse response){
	
		return "jsp/register";
	}
	
	//注册页面
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model, HttpServletRequest request) throws UnsupportedEncodingException{
		model.addAttribute("user", new User());
		return "auth/register";
	}
	
	@RequestMapping(value = "/addRegister", method = RequestMethod.POST)
	public String add(ModelMap model, @ModelAttribute("user") User user, HttpServletRequest request){
		user.setPassword(this.md5Str(this.md5Str(user.getPassword())));
		user.setUserRole(1);
		System.out.println(user.getAddress());
		System.out.println(user.getPhone());
		System.out.println(user.getContact());
		System.out.println(user.getBusiness());
		int createFlag = this.userDAO.insertUser(user);
		if(createFlag > 0){
    		this.setSuccessMsg(request, "用户创建成功！");
    		return "redirect:login";
    	}else{
    		model.addAttribute(FAIL_MSG, "用户创建失败！");
    		return "redirect:login";
    	}
	}
	
	private String md5Str(String password){
		StringBuffer sb = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(password.getBytes());
			byte byteData[] = md.digest();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	/**
	 * 用户名验证
	 * @param model
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/ajaxCheckName", method = RequestMethod.POST)
	@ResponseBody
	public void ajaxPCategory(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException{
		String result = "true";
		String username = request.getParameter("username");
		
		if(this.userDAO.isUserExist(username)){
			result = "false";
		}
		response.getWriter().write(result);
	}

}
