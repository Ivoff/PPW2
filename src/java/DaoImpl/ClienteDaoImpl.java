package DaoImpl;

import DAO.ClienteDao;
import entidades.Cliente;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ClienteDaoImpl implements ClienteDao{

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("WebApplicationPU");
    
    @Override
    public void save(Cliente e) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        
        if(e.getId() > 0){
            em.merge(e);
        }else{
            em.persist(e);
        }
        
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public void delete(Cliente e) {
        EntityManager em = fabrica.createEntityManager();
        em.getTransaction().begin();
        
        if(!em.contains(e)){
            e = em.merge(e);
        }
        em.remove(e);
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public Cliente read(int id) {
        EntityManager em = fabrica.createEntityManager();
        return em.find(Cliente.class, id);
    }

    @Override
    public List<Cliente> all() {
        EntityManager em = fabrica.createEntityManager();
        Query q = em.createQuery("select c from Cliente c");
        return q.getResultList();
    }
    
}
