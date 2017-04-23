package com.betha.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author jr
 */
@Entity
@Table(name = "pedidos", catalog = "betha", schema = "public")
public class Pedidos implements Serializable {

 
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpedidos")
    private Long idpedidos;
    
    @Column(name = "datapedido")
    @Temporal(TemporalType.DATE)
    private Date datapedido;
    
    @Column(name = "status")
    private String  status;
    
    @JoinColumn(name = "fkprodutos", referencedColumnName = "idprodutos")
    @ManyToOne
    public Produtos fkprodutos;
    
    @JoinColumn(name = "fkpessoas", referencedColumnName = "idpessoa")
    @ManyToOne
    public Pessoas pessoas;
    
    @Column(name = "quantidade")
    public BigInteger quantidade;
    
    @Column(name = "nota")
    public BigInteger nota;

    public Pedidos() {
    }

    public Pedidos(Long idpedidos) {
        this.idpedidos = idpedidos;
    }

    public Long getIdpedidos() {
        return idpedidos;
    }

    public void setIdpedidos(Long idpedidos) {
        this.idpedidos = idpedidos;
    }

    public Date getDatapedido() {
        return datapedido;
    }

    public void setDatapedido(Date datapedido) {
        this.datapedido = datapedido;
    }

    /**
     * @return the fkprodutos
     */
    public Produtos getFkprodutos() {
        return fkprodutos;
    }

    /**
     * @param fkprodutos the fkprodutos to set
     */
    public void setFkprodutos(Produtos fkprodutos) {
        this.fkprodutos = fkprodutos;
    }

    /**
     * @return the pessoas
     */
    public Pessoas getPessoas() {
        return pessoas;
    }

    /**
     * @param pessoas the fkpessoas to set
     */
    public void setPessoas(Pessoas pessoas) {
        this.pessoas = pessoas;
    }

    /**
     * @return the quantidade
     */
    public BigInteger getQuantidade() {
        return quantidade;
    }

    /**
     * @param quantidade the quantidade to set
     */
    public void setQuantidade(BigInteger quantidade) {
        this.quantidade = quantidade;
    }

    /**
     * @return the nota
     */
    public BigInteger getNota() {
        return nota;
    }

    /**
     * @param nota the nota to set
     */
    public void setNota(BigInteger nota) {
        this.nota = nota;
    }
       /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    
}
