package com.web.controller.auth;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

public class PasswordEncoder extends Md5PasswordEncoder {
	public PasswordEncoder(){
		super();
	}
	public String encodePassword(String rawPass, Object salt) {
		return super.encodePassword(super.encodePassword(rawPass, salt), salt);
	}
}
