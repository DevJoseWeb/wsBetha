package com.betha.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author jr
 */

@Table(catalog = "betha", schema = "public")
@Entity
public class Users implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Long id;
    
    //@Size(max = 2147483647)
    //@Column(length = 2147483647)
    @Column(name = "name")
    private String name;
    
    //@Size(max = 2147483647)
    //@Column(length = 2147483647)
    @Column(name = "phone")
    private String phone;

    //@Size(max = 2147483647)
    //@Column(length = 2147483647)
    @Column(name = "email")
    private String email;
    
     public Users() {
    }

    public Users(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
