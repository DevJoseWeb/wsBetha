package com.jersey.representations;

import java.io.Serializable;
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
import org.hibernate.annotations.OrderBy;
import org.hibernate.annotations.Sort;
import org.hibernate.annotations.SortType;

/**
 *
 * @author jr
 */
@Entity
@Table(name = "pedidos", catalog = "betha", schema = "public")

public class Pedidos implements Serializable {

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
    @OrderBy(clause = "datapedido DESC") 
    @Sort(type = SortType.NATURAL)
    public Produtos fkprodutos;
    
    @JoinColumn(name = "fkpessoas", referencedColumnName = "idpessoa")
    @ManyToOne
    @OrderBy(clause = "datapedido DESC") 
    @Sort(type = SortType.NATURAL)
    public Pessoas fkpessoas;
      
//    @JoinColumn(name = "fkpessoas", referencedColumnName = "idpessoa")
//    @NotNull
//    private Long fkpessoas;

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
     * @return the fkpessoas
     */
    public Pessoas getFkpessoas() {
        return fkpessoas;
    }

    /**
     * @param fkpessoas the fkpessoas to set
     */
    public void setFkpessoas(Pessoas fkpessoas) {
        this.fkpessoas = fkpessoas;
    }
    
    
}
