package com.betha.model;

import com.betha.vo.PessoasVO;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.EntityResult;
import javax.persistence.FetchType;
import javax.persistence.FieldResult;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.SqlResultSetMappings;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.annotations.OrderBy;

/**
 *
 * @author jr
 */
@Entity
@Table(name = "pessoas", catalog = "betha", schema = "public")
@SqlResultSetMapping(
    name = "teste",
    entities = {
        @EntityResult(
            entityClass = Pessoas.class,
            fields = {
                @FieldResult(name = "idpessoa", column = "idpessoa"),
                @FieldResult(name = "nome", column = "nome"),
                @FieldResult(name = "cpf", column = "cpf"),
                @FieldResult(name = "email", column = "email")}),
        @EntityResult(
            entityClass = Pedidos.class,
            fields = {
                @FieldResult(name = "idpedidos", column = "idpedidos"),
                @FieldResult(name = "status", column = "status")})}
)
@SqlResultSetMappings({
    @SqlResultSetMapping(
            name = "teste2",
            classes = {
                @ConstructorResult(
                        targetClass = PessoasVO.class,
                        columns = {
                            @ColumnResult(name = "idpessoa"),
                            @ColumnResult(name = "nome")
                        }
                )
            }
    )

})
public class Pessoas implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idpessoa")
    private Long idpessoa;
    
    @NotNull
    @Column(name = "nome")
    private String nome;
    
    @Column(name = "cpf")
    private String cpf;
    
    @OrderBy(clause = "datacadastro") // Ordenando por data de cadastro
    @Column(name = "datacadastro")
    @Temporal(TemporalType.DATE)
    private Date datacadastro;
    
    @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="E-mail inválido")//if the field contains email address consider using this annotation to enforce field validation
    @Column(name = "email")
    private String email;
    
    @Column(name = "telefone")
    private String telefone;
    
    @Column(name = "status")
    private String status;
    
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkpessoas", referencedColumnName = "idpessoa")
    private Set<Pedidos> pedidosList;

    public Pessoas() {
        //todo
    }
      
        
    
    public Pessoas(String nome, String cpf, Date datacadastro, String email, String telefone) {
        this.nome = nome;
        this.cpf = cpf;
        this.datacadastro = datacadastro;
        this.email = email;
        this.telefone = telefone;
    }
    
    public Long getIdpessoa() {
        return idpessoa;
    }

    public void setIdpessoa(Long idpessoa) {
        this.idpessoa = idpessoa;
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

    public Date getDatacadastro() {
        return datacadastro;
    }

    public void setDatacadastro(Date datacadastro) {
        this.datacadastro = datacadastro;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
    public Set<Pedidos> getPedidosList() {
        return pedidosList;
    }

    public void setPedidosList(Set<Pedidos> pedidosList) {
        this.pedidosList = pedidosList;
    }


}
