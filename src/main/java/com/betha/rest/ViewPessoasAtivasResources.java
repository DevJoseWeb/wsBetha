package com.betha.rest;

import com.betha.dao.ViewPessoasAtivasDao;
import com.betha.model.ViewPessoasativas;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author jr
 */
  
@Path("/vwpessoasativas")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Component
@Transactional
public class ViewPessoasAtivasResources {
    
    private final ViewPessoasAtivasDao viewpessoasativasDao;

    @Inject
    public ViewPessoasAtivasResources(ViewPessoasAtivasDao viewpessoasativasDao) {
        this.viewpessoasativasDao = viewpessoasativasDao;
    }
        
     /**
     * Get all VwPessoas
     * @return vwpessoas
     */
    @GET
    @Path("/")
    public List<ViewPessoasativas> getVwPessoasTodos() {
        List<ViewPessoasativas> vwpessoasativas = this.viewpessoasativasDao.findAll();
        return  vwpessoasativas;
    }
}

