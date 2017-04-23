package com.betha.rest;

import com.betha.dao.ViewPedidosDao;
import com.betha.model.Vwpedidos;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author jr
 */
  
@Path("/vwpedidos")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Component
@Transactional
public class ViewPedidosResources {
    
    private final ViewPedidosDao viewpedidosDao;

    @Inject
    public ViewPedidosResources(ViewPedidosDao viewpedidosDao) {
        this.viewpedidosDao = viewpedidosDao;
    }
        
     /**
     * Get all VwPessoas
     * @return vwpessoas
     */
    @GET
    @Path("/")
    public List<Vwpedidos> getVwPedidosTodos() {
        List<Vwpedidos> vwpedidos = this.viewpedidosDao.findAll();
        return  vwpedidos;
    }
     /**
     * Get single Vw
     * @param nome
     * @return users
     */
    @GET
    @Consumes("application/json; charset=UTF-8")
    @Produces("application/json; charset=UTF-8")
    @Path("/buscar/{nome}")
    public Vwpedidos getViewNome(@PathParam("nome") String nome) {
        Vwpedidos vwpedidos = viewpedidosDao.findByNome(nome);
        if (vwpedidos == null) {
            throw new WebApplicationException((Response.Status.NOT_FOUND));
        }
        return vwpedidos;
    }   
}

