package DAO;


import entidades.Cliente;
import java.util.List;

public interface ClienteDao { 
    public void save(Cliente e);
    public void delete(Cliente e);
    public Cliente read(int id);
    public List<Cliente> all();    
}
