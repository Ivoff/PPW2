package DAO;

import entidades.Tarefa;
import java.util.List;

public interface TarefaDao {
    public void save(Tarefa t);
    public void delete(Tarefa t);
    public Tarefa read(int id);
    public List<Tarefa> all();
}
