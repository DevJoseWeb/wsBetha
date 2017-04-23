package com.betha.rest;

import com.betha.dao.AddressDao;
import com.betha.model.Address;
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
@Path("/address")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Component
@Transactional
public class AddressResource {
    private final AddressDao addressDao;

    @Inject
    public AddressResource(AddressDao addressDao) {
        this.addressDao = addressDao;
    }
        /**
     * Get all Address
     * @return address
     */
    @GET
    @Path("/")
    public List<Address> getAddressTodos() {
        List<Address> address = this.addressDao.findAll();
        return  address;
    }
      
}
