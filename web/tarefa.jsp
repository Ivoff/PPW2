<%-- 
    Document   : tarefa
    Created on : Nov 6, 2019, 10:13:00 PM
    Author     : zilas
--%>

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
            }
        %>
        
        <h1>Tarefas</h1>
        <div class="container">
            <form action="tarefa.jsp">
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
    </body>
</html>
