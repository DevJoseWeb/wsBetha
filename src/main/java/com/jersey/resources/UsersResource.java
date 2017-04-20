package com.jersey.resources;

import com.jersey.persistence.UsersDao;
import com.jersey.representations.Users;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;
import javax.validation.Valid;
import javax.ws.rs.core.Response;

/**
 *
 * @author jr
 */
@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Transactional
@Component
public class UsersResource {

     private final UsersDao usersDao;
    
    @Inject
    public UsersResource(UsersDao usersDao){
        this.usersDao = usersDao;
    }
     /**
     * Get all Users
     * @return users
     */
    @GET
    @Produces("application/json; charset=UTF-8")
    public List<Users> getAll(){
        List<Users> users = this.usersDao.findAll();
        return users;
    }
    
     /**
     * Get single Users
     * @param id
     * @return users
     */
    @GET
    @Consumes("application/json; charset=UTF-8")
    @Produces("application/json; charset=UTF-8")
    @Path("{id}")
    public Users getUsersId(@PathParam("id")long id) {
        Users users = usersDao.findOne(id);
        if (users == null) {
            throw new WebApplicationException((Response.Status.NOT_FOUND));
        }
        return users;
    }
    
     /**
     * Create new Users
     * @param users
     * @return new users
     */
    @POST
    @Consumes("application/json; charset=UTF-8")
    @Produces("application/json; charset=UTF-8")
    @Path("/cadastrar")
    public Users save(Users users) {
        return usersDao.save(users);
    }
     /**
     * Update existing Produtos
     * @param id
     * @param users
     * @return updated produtos
     */
    @PUT
//    @Consumes("application/json; charset=UTF-8")
//    @Produces("application/json; charset=UTF-8")
    @Path("/editar/{id}")
    public Users update(@PathParam("id")long id, @Valid Users users) {
        if(usersDao.findOne(id) == null){
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }else {
            users.setId(id);
            return usersDao.save(users);
        }
    }
     /**
     * Update existing Users
     * @param id
     */
    @DELETE
    @Consumes("application/json; charset=UTF-8")
    @Produces("application/json; charset=UTF-8")
    @Path("/apagar/{id}")
    public void delete(@PathParam("id")long id) {
        Users users = usersDao.findOne(id);
        if(users == null){
            throw new WebApplicationException(Response.Status.NOT_FOUND);
        }else {
            usersDao.delete(users);
        }
    }
}