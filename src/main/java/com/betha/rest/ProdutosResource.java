package com.betha.rest;

import com.betha.dao.ProdutosDao;
import com.betha.model.Produtos;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;


/**
 *
 * @author jr
 */
@Path("/produtos")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Transactional
@Component
public class ProdutosResource {
     private final ProdutosDao produtosDao;
    
    @Inject
    public ProdutosResource(ProdutosDao produtosDao){
        this.produtosDao = produtosDao;
    }
    
     /**
     * Get all Produtos
     * @return produtos
     */
    @GET
    public List<Produtos> getAll(){
        List<Produtos> produtos = this.produtosDao.findAll();
        return produtos;
    }
     /**
     * Get single Produtos
     * @param idprodutos
     * @return produtos
     */
    @GET
    @Path("{idprodutos}")
    public Produtos getOne(@PathParam("idprodutos")long idprodutos) {
        Produtos produtos = produtosDao.findOne(idprodutos);
        if(produtos == null){
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }else {
            return produtos;
        }
    }
     /**
     * Create new Produtos
     * @param produtos
     * @return new produtos
     */
    @POST
    @Path("/cadastrar")
    public Produtos save(@Valid Produtos produtos) {
        if(produtos == null){
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }else {
            return produtosDao.save(produtos);
        }
      }
    
    /**
     * Update existing Produtos
     * @param idprodutos
     * @param produtos
     * @return updated produtos
     */
    @PUT
    @Path("{idprodutos}/editar")
    public Produtos update(@PathParam("idprodutos")long idprodutos, @Valid Produtos produtos) {
        if(produtosDao.findOne(idprodutos) == null){
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }else {
            produtos.setIdprodutos(idprodutos);
            return produtosDao.save(produtos);
        }
    }
    /**
     * Delete produtos
     * @param idprodutos
     */
    @DELETE
    @Path("{idprodutos}/deletar")
    public void delete(@PathParam("idprodutos")long idprodutos) {
        Produtos produtos = produtosDao.findOne(idprodutos);
        if(produtos == null){
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }else {
            produtosDao.delete(produtos);
        }
    }
}
    

