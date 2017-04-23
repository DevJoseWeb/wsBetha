package com.betha.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author jr
 */
@Entity
@Table(name = "produtos", catalog = "betha", schema = "public")
public class Produtos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idprodutos")
    private Long idprodutos;
    
    @Column(name = "descricao")
    private String descricao;
    
    @Column(name = "datacadastro ")
    @Temporal(TemporalType.DATE)
    private Date datacadastro;
    
    @Column(name = "valorunitario")
    private String valorunitario;
    
    @Column(name = "quantidade")
    private String quantidade;
    
    @Column(name = "estoque")
    private String estoque;
    

    @Column(name = "status")
    private String status;

    public Produtos() {
    }

    public Produtos(Long idprodutos) {
        this.idprodutos = idprodutos;
    }

    public Long getIdprodutos() {
        return idprodutos;
    }

    public void setIdprodutos(Long idprodutos) {
        this.idprodutos = idprodutos;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getDatacadastro() {
        return datacadastro;
    }

    public void setDatacadastro(Date datacadastro) {
        this.datacadastro = datacadastro;
    }

    public String getValorunitario() {
        return valorunitario;
    }

    public void setValorunitario(String valorunitario) {
        this.valorunitario = valorunitario;
    }

    public String getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(String quantidade) {
        this.quantidade = quantidade;
    }
    
    public String getEstoque() {
        return estoque;
    }

    public void setEstoque(String estoque) {
        this.estoque = estoque;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
