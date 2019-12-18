<%-- 
    Document   : cliente
    Created on : Nov 13, 2019, 9:42:54 PM
    Author     : zilas
--%>

<%@page import="java.util.List"%>
<%@page import="entidades.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cliente</h1>                
        
        <div class="container">
            <form action="clientejstl" method="POST">
                
                <input type="hidden" name="id" value="${cliente.id}">
                
                <div class="form-gruop">
                    <div class="form-group">
                        <label id="labelNome" for="nome">Nome</label>
                        <input class="form-control" type="text" id="nome" name="nome" required="" value="${cliente.nome}"/>
                    </div>
                    <div class="form-group">
                        <label id="labelCpf" for="cpf">CPF</label>
                        <input class="form-control" type="text" id="cpf" name="cpf" required="" value="${cliente.cpf}"/>
                    </div>
                    <div class="form-group">
                        <label id="labelTelefone" for="telefone">Telefone</label>
                        <input class="form-control" type="text" id="telefone" name="telefone" required="" value="${cliente.telefone}"/>
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
                    <c:forEach var="c" items="${lista}">
                        <tr>
                            <td>${c.nome}</td>
                            <td>${c.cpf}</td>
                            <td>
                                <a href="cliente?excluir=${c.id}">
                                    <button class="btn btn-danger">Excluir</button>
                                </a>
                                <a href="cliente?editar=${c.id}">
                                    <button class="btn btn-danger">Editar</button>
                                </a>
                            </td>                           
                        </tr>                        
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
