package com.jersey.representations;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author jr
 */
@Entity
@Table(catalog = "betha", schema = "public")
public class Address implements Serializable {

    private static final long serialVersionUID = 1L;
    
    //@Size(max = 2147483647)
    //@Column(length = 2147483647)
    @Column(name = "street")
    private String street;
    
    //@Size(max = 2147483647)
    //@Column(length = 2147483647)
    @Column(name = "suite")
    private String suite;
    
    //@Size(max = 2147483647)
    //@Column(length = 2147483647)
    @Column(name = "city")
    private String city;
    
    //@Size(max = 2147483647)
    //@Column(length = 2147483647)
    private String zipcode;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Long id;

    public Address() {
    }

    public Address(Long id) {
        this.id = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getSuite() {
        return suite;
    }

    public void setSuite(String suite) {
        this.suite = suite;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
