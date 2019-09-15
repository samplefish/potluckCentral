package com.samplefish.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.samplefish.entity.User;
import com.samplefish.user.CrmUser;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(CrmUser crmUser);
}
