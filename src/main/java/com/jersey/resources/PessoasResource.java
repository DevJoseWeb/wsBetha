package com.jersey.resources;

import com.jersey.persistence.PessoasDao;
import com.jersey.representations.Pessoas;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author jr
 */

@Path("/pessoas")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Component
@Transactional
public class PessoasResource {
    private final PessoasDao pessoasDao;

    @Inject
    public PessoasResource(PessoasDao pessoasDao) {
        this.pessoasDao = pessoasDao;
    }
      
     /**
     * Get single Pessoas
     * @param idpessoa
     * @return pessoas/produtos
     */
    @GET
    @Path("/pedidos/{idpessoa}")
    public Pessoas getAllPedidosPessoas(@PathParam("idpessoa")long idpessoa) {
        Pessoas pessoas = pessoasDao.findOne(idpessoa);
        if (pessoas == null) {
            throw new WebApplicationException((Response.Status.NOT_FOUND));
        }
        
        //Mágica que retorna a lista de pedidos da pessoa
        pessoas.getPedidosList().size();
        return pessoas;
    }

     /**
     * Get single Pessoas
     * @param idpessoa
     * @return pessoas
     */
    @GET
    @Produces("application/json; charset=UTF-8")
    @Path("{idpessoa}")
    public Pessoas getPessoasId(@PathParam("idpessoa")long idpessoa) {
        Pessoas pessoas = pessoasDao.findOne(idpessoa);
        if (pessoas == null) {
            throw new WebApplicationException((Response.Status.NOT_FOUND));
        }
        return pessoas;
    }
    
     /**
     * Get all Pessoas
     * @return pessoas
     */
    @GET
    @Path("/")
    public List<Pessoas> getPessoasTodos() {
        List<Pessoas> pessoas = this.pessoasDao.findAll();
        return  pessoas;
    }
    
     /**
     * Create new Pessoas
     * @param pessoas
     * @return new pessoas
     */
    @POST
    @Consumes("application/json; charset=UTF-8")
    @Produces("application/json; charset=UTF-8")
    @Path("/cadastrar")
    public Pessoas save(Pessoas pessoas) {
        return pessoasDao.save(pessoas);
    }
    
    /**
     * Delete pessoas
     * @param idpessoa
     */
    @DELETE
    @Path("{idpessoa}/deletar")
    public void delete(@PathParam("idpessoa")long idpessoa) {
        Pessoas pessoas = pessoasDao.findOne(idpessoa);
        if(pessoas == null){
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }else {
            pessoasDao.delete(pessoas);
        }
    }
    
    /**
     * Update existing Produtos
     * @param idpessoa
     * @param pessoas
     * @return updated produtos
     */
    @PUT
    @Path("{idpessoa}/editar")
    public Pessoas update(@PathParam("idpessoa")long idpessoa, @Valid Pessoas pessoas) {
        if(pessoasDao.findOne(idpessoa) == null){
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }else {
            pessoas.setIdpessoa(idpessoa);
            return pessoasDao.save(pessoas);
        }
        }
         /**
     * Get single Pessoas
     * @param nome
     * @return pessoas
     */
    @GET
    @Consumes("application/json; charset=UTF-8")
    @Produces("application/json; charset=UTF-8")
    @Path("/buscar/{nome}")
    public Pessoas getPessoasNome(@PathParam("nome") String nome) {
        Pessoas pessoas = pessoasDao.findByNome(nome);
        if (pessoas == null) {
            throw new WebApplicationException((Response.Status.NOT_FOUND));
        }
        return pessoas;
    }
}


