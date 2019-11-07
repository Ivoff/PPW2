<%-- 
    Document   : hello
    Created on : Oct 30, 2019, 9:23:08 PM
    Author     : zilas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entidades.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
    </head>
    <body>
        <h1>Clientes</h1>
        
        <%
            List<Cliente> list = (List<Cliente>) session.getAttribute("lista");
        
            if(list == null){
                list = new ArrayList<Cliente>();            
            }
        %>
        
        <table class="table">
            <thead class = "thead-dark">
                <tr>
                    <th scopte="col">Nome</th>
                    <th scopte="col">CPF</th>
                </tr>
            </thead>
            <tbody>
                <%for(Cliente c: list){%>
                <tr>
                    <td><%= c.getNome()%></td>
                    <td><%= c.getCpf()%></td>
                </tr>
                <%}%>
            <tbody>
        </table>
    </body>
</html>