package com.web.controller.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.web.dao.UserDAO;



public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private UserDAO userDao;
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException,DataAccessException {
		
		UserDetails user = null;
		try{
			
			com.web.bean.User dbUser = userDao.getUserByUserId(username);
			
			if(dbUser != null){
				if(dbUser.getUserRole() == 2 || dbUser.getUserRole() == 3){
					user = new UserObject(dbUser.getUsername(), dbUser.getPassword(), true,
						true, true, true, getAuthorities(dbUser.getUserRole()));
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			throw new UsernameNotFoundException("Error in retrieving user");
		}
		
		return user;
	}

	@SuppressWarnings("deprecation")
	public Collection<GrantedAuthority> getAuthorities(int i) {
		// Create a list of grants for this user
		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>(2);

		// All users are granted with ROLE_USER access
		// Therefore this user gets a ROLE_USER by default
		authList.add(new GrantedAuthorityImpl("ROLE_USER"));

		// Check if this user has admin access
		// We interpret Integer(1) as an admin user
		if (i == 2) {
			// User has admin access
			authList.add(new GrantedAuthorityImpl("ROLE_ADMIN"));
		}

		// Return list of granted authorities
		return authList;
	}

}
