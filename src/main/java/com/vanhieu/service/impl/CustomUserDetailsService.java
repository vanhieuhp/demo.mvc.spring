package com.vanhieu.service.impl;

import com.vanhieu.constant.SystemConstant;
import com.vanhieu.dto.MyUser;
import com.vanhieu.entity.RoleEntity;
import com.vanhieu.entity.UserEntity;
import com.vanhieu.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity userEntity = userRepository.findByUsernameAndStatus(username, SystemConstant.ACTIVE_STATUS);

        if (userEntity == null) {
            throw new UsernameNotFoundException("Username not found");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (RoleEntity role : userEntity.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getCode()));
        }

        MyUser myUser = new MyUser(userEntity.getUsername(), userEntity.getPassword(),
                true, true, true, true, authorities);
        myUser.setFullname(userEntity.getFullname());
        return myUser;
    }
}
