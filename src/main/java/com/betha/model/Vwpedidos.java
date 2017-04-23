package com.betha.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author jr
 */

@Entity
@Table(catalog = "betha", schema = "public", name = "vwpedidos")
public class Vwpedidos implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Column(name = "datapedido")
    @Temporal(TemporalType.DATE)
    private Date datapedido;
    
    @Column(name = "quantidade")
    private BigInteger quantidade;
    
    @Column(name = "nome")
    private String nome;
    
    @Id
    @Column(name = "cpf")
    private String cpf;
    
    @Column(name = "descricao")
    private String descricao;
    
    @Column(name = "valorunitario")
    private BigInteger valorunitario;
    
    @Column(name = "total")
    private BigInteger total;

    public Vwpedidos() {
    }

    public Date getDatapedido() {
        return datapedido;
    }

    public void setDatapedido(Date datapedido) {
        this.datapedido = datapedido;
    }

    public BigInteger getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(BigInteger quantidade) {
        this.quantidade = quantidade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigInteger getValorunitario() {
        return valorunitario;
    }

    public void setValorunitario(BigInteger valorunitario) {
        this.valorunitario = valorunitario;
    }

    public BigInteger getTotal() {
        return total;
    }

    public void setTotal(BigInteger total) {
        this.total = total;
    }
    
}
