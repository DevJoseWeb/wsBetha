package com.betha.dao;

import com.betha.model.Pessoas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface PessoasDao extends JpaRepository<Pessoas, Long> {

    //@Query("SELECT u FROM Pessoas u WHERE u.nome = :nome")
    @Query(nativeQuery = true, name="sqlresultpedidos", value = "SELECT\n" +
"        public.pessoas.*,\n" +
"        public.pedidos.datapedido,\n" +
"        public.pedidos.quantidade,\n" +
"        public.pedidos.nota,\n" +
"        public.produtos.descricao,\n" +
"        public.produtos.valorunitario,\n" +
"        public.produtos.valorunitario * public.pedidos.quantidade AS total         \n" +
"    FROM\n" +
"        public.pedidos           \n" +
"    JOIN\n" +
"        public.pessoas              \n" +
"            ON public.pedidos.fkpessoas = public.pessoas.idpessoa           \n" +
"    JOIN\n" +
"        public.produtos              \n" +
"            ON public.pedidos.fkprodutos = public.produtos.idprodutos           \n" +
"    WHERE\n" +
"        public.pessoas.nome = :nome      \n" +
"    GROUP BY\n" +
"        public.produtos.descricao,\n" +
"        public.pedidos.datapedido,\n" +
"        public.pedidos.quantidade,\n" +
"        public.produtos.valorunitario,\n" +
"        public.pessoas.cpf,\n" +
"        public.pessoas.datacadastro,\n" +
"        public.pessoas.email,\n" +
"        public.pessoas.status,\n" +
"        public.pessoas.telefone,\n" +
"        public.pedidos.nota,\n" +
"        public.pessoas.idpessoa,\n" +
"        public.pedidos.quantidade,\n" +
"        total")
               
       Pessoas findByNome(@Param("nome") String nome);
}