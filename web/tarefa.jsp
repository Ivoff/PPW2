<%-- 
    Document   : tarefa
    Created on : Nov 6, 2019, 10:13:00 PM
    Author     : zilas
--%>

<%@page import="java.util.List"%>
<%@page import="DaoImpl.TarefaDaoImpl"%>
<%@page import="DAO.TarefaDao"%>
<%@page import="entidades.Tarefa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
    </head>
    <body>
        
        <%
            Tarefa bean = new Tarefa();
            TarefaDao dao = new TarefaDaoImpl();
            if(request.getParameter("descricao")!=null){
                bean.setDescricao(request.getParameter("descricao"));
                dao.save(bean);
                out.println("Tarefa salva com sucesso");
            }else if(request.getParameter("excluir") != null){
                int id = Integer.parseInt(request.getParameter("excluir"));
                dao.delete(dao.read(id));
            }
            
            List<Tarefa> list = dao.all();
        %>
        
        <h1>Tarefas</h1>
        <div class="container">
            <form action="tarefa.jsp" method="POST">
                <div class="form-gruop row">
                    <div class="col-2">
                        <label for="descricao">Descricao</label>
                    </div>
                    <div class="col">
                        <input class="form-crontrol" type="text" name="descricao"/>
                    </div>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
        
        <div container="container">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">
                            Descrição
                        </th>
                        <th></th>                            
                    </tr>
                </thead>
                <tbody>
                    <%for(Tarefa t: list){%>                        
                        <tr>
                            <td><%=t.getDescricao()%></td>
                            <td><a href="tarefa.jsp?excluir=<%= t.getId()%>"><button class="btn btn-danger">Excluir</button></a></td>
                        </tr>
                    <%}%>                    
                </tbody>
            </table>
        </div>
    </body>
</html>
