package com.jersey.persistence;

import com.jersey.representations.Pessoas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface PessoasDao extends JpaRepository<Pessoas, Long> {

    @Query("SELECT u FROM Pessoas u WHERE u.nome = :nome")
       Pessoas findByNome(@Param("nome") String nome);
}