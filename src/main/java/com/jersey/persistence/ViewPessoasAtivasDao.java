package com.jersey.persistence;

/*
 * @author jr
 */
import com.jersey.representations.ViewPessoasativas;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ViewPessoasAtivasDao extends JpaRepository<ViewPessoasativas, Long> {

}