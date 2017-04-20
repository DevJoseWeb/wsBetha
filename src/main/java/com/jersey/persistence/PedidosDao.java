package com.jersey.persistence;

import com.jersey.representations.Pedidos;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PedidosDao extends JpaRepository<Pedidos, Long> {
}