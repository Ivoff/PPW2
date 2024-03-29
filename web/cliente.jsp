<%-- 
    Document   : cliente
    Created on : Nov 13, 2019, 9:42:54 PM
    Author     : zilas
--%>

<%@page import="java.util.List"%>
<%@page import="entidades.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cliente</h1>
        
        <%
            int id = 0;
            String nome = "";
            String telefone = "";
            String cpf = "";
            
            if(request.getAttribute("cliente") != null){
                Cliente ed = (Cliente) request.getAttribute("cliente");
                
                id = ed.getId();
                nome = ed.getNome();
                telefone = ed.getTelefone();
                cpf = ed.getCpf();
            }
        %>
        
        <div class="container">
            <form action="cliente" method="POST">
                
                <input type="hidden" name="id" value="<%= id%>">
                
                <div class="form-gruop">
                    <div class="form-group">
                        <label id="labelNome" for="nome">Nome</label>
                        <input class="form-control" type="text" id="nome" name="nome" required="" value="<%= nome%>"/>
                    </div>
                    <div class="form-group">
                        <label id="labelCpf" for="cpf">CPF</label>
                        <input class="form-control" type="text" id="cpf" name="cpf" required="" value="<%= cpf%>"/>
                    </div>
                    <div class="form-group">
                        <label id="labelTelefone" for="telefone">Telefone</label>
                        <input class="form-control" type="text" id="telefone" name="telefone" required="" value="<%= telefone%>"/>
                    </div>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
        
        <div class="container">
            <table class="table">
                <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Nome</th>
                        <th scope="col">CPF</th>
                        <th scope="col">Acoes</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Cliente> lista;
                        lista = (List<Cliente>) request.getAttribute("lista");
                    %>
                    <% for(Cliente c : lista){ %>
                        <tr>
                            <td><%= c.getNome() %></td>
                            <td><%= c.getCpf() %></td>
                            <td>
                                <a href="cliente?excluir=<%= c.getId()%>">
                                    <button class="btn btn-danger">Excluir</button>
                                </a>
                                <a href="cliente?editar=<%= c.getId()%>">
                                    <button class="btn btn-danger">Editar</button>
                                </a>
                            </td>                           
                        </tr>                        
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
