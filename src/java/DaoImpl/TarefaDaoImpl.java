package DaoImpl;

import DAO.TarefaDao;
import entidades.Tarefa;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class TarefaDaoImpl implements TarefaDao{

    private EntityManagerFactory fac = Persistence.createEntityManagerFactory("WebApplicationPU");
    
    @Override
    public void save(Tarefa t) {
        EntityManager em = fac.createEntityManager();
        em.getTransaction().begin();
        if(t.getId()>0){
            em.merge(t);
        }else{
            em.persist(t);
        }
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public void delete(Tarefa t) {
        EntityManager em = fac.createEntityManager();
        em.getTransaction().begin();
        
        if(!em.contains(t)){
            em.refresh(t);
        }
        em.remove(t);
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public Tarefa read(int id) {
        EntityManager em = fac.createEntityManager();
        return em.find(Tarefa.class, id);
    }

    @Override
    public List<Tarefa> all() {
        EntityManager em = fac.createEntityManager();
        Query q = em.createQuery("SELECT t FROM Tarefa as t ORDER BY t.id");
        return q.getResultList();
    }
    
}
