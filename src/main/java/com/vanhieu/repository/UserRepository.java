package com.vanhieu.repository;

import com.vanhieu.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findByUsernameAndStatus(String username, int status);
}
