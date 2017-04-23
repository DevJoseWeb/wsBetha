package com.betha.rest;

import com.betha.dao.PedidosDao;
import com.betha.model.Pedidos;
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
@Path("/pedidos")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Component
@Transactional
public class PedidosResource {
    private final PedidosDao pedidosDao;

    @Inject
    public PedidosResource(PedidosDao pedidosDao) {
        this.pedidosDao = pedidosDao;
    }
    
     /**
     * Get all Pedidos
     * @return pedidos
     */
    @GET
    @Consumes("application/json; charset=UTF-8")
    @Path("/")
    public List<Pedidos> getPedidosTodos() {
        List<Pedidos> pedidos = this.pedidosDao.findAll();
        return  pedidos;
    }
    
         /**
     * Create new Pessoas
     * @param pedidos
     * @return new pessoas
     */
    @POST
    @Consumes("application/json; charset=UTF-8")
    @Produces("application/json; charset=UTF-8")
    @Path("/cadastrar")
    public Pedidos save(Pedidos pedidos) {
        return pedidosDao.save(pedidos);
    }
    
    /**
     * Get single Pedidos
     * @param idpedidos
     * @return pedidos
     */
    @GET
    @Consumes("application/json; charset=UTF-8")
    @Path("{idpedidos}")
    public Pedidos getPedidosId(@PathParam("idpedidos")long idpedidos) {
        Pedidos pedidos = pedidosDao.findOne(idpedidos);
        if (pedidos == null) {
            throw new WebApplicationException((Response.Status.NOT_FOUND));
        }
        return pedidos;
    }
}

