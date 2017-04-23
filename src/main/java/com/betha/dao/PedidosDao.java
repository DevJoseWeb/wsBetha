package com.betha.dao;

import com.betha.model.Pedidos;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PedidosDao extends JpaRepository<Pedidos, Long> {
}