
package com.betha.dao;

import com.betha.model.Produtos;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProdutosDao extends JpaRepository<Produtos, Long> {
}
