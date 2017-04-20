
package com.jersey.persistence;

import com.jersey.representations.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsersDao extends JpaRepository<Users, Long> {
}
