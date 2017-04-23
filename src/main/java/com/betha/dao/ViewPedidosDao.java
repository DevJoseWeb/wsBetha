package com.betha.dao;

/*
 * @author jr
 */

import com.betha.model.Vwpedidos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface ViewPedidosDao extends JpaRepository<Vwpedidos, Long> {
    @Query("SELECT u FROM Vwpedidos u WHERE u.nome = :nome")
       Vwpedidos findByNome(@Param("nome") String nome);

}