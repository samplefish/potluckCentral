package com.samplefish.dao;

import com.samplefish.entity.Role;

public interface RoleDao {
	
	public Role findRoleByName(String theRoleName);

}
