
package com.jersey.persistence;

import com.jersey.representations.Produtos;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProdutosDao extends JpaRepository<Produtos, Long> {
}
