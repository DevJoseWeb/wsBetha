
package com.betha.dao;

import com.betha.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface UsersDao extends JpaRepository<Users, Long> {
    
      @Query("SELECT u FROM Users u WHERE u.name = :name")
       Users findByLastnameOrFirstname(@Param("name") String name);
}
