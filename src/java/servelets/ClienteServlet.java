/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import entidades.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zilas
 */
@WebServlet(name = "ClienteServlet", urlPatterns = {"/cliente"})
public class ClienteServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Cliente cliente = new Cliente();
        cliente.setNome(request.getParameter("nome"));
        cliente.setCpf(request.getParameter("cpf"));
        cliente.setEmail(request.getParameter("email"));
        cliente.setTelefone(request.getParameter("telefone"));
        cliente.setGenero(request.getParameter("genero"));
        cliente.setEndereco(request.getParameter("endereco"));
        
        try{
            SimpleDateFormat date = new SimpleDateFormat("dd/mm/yyyy");
            cliente.setDataNascimento(date.parse(request.getParameter("dataNasc")));
        }catch(Exception e){
        
        }
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Cliente data</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<p>Nome: "+cliente.getNome()+"</p>");
            out.println("<p>CPF: "+cliente.getCpf()+"</p>");
            out.println("<p>Email: "+cliente.getEmail()+"</p>");
            out.println("<p>Telefone: "+cliente.getTelefone()+"</p>");
            out.println("<p>Genero: "+cliente.getGenero()+"</p>");
            out.println("<p>Endereco: "+cliente.getEndereco()+"</p>");                        
            out.println("</body>");
            out.println("</html>");
        }
        
        List<Cliente> list = (List<Cliente>) request.getSession().getAttribute("lista");
        
        if(list == null){
            list = new ArrayList<Cliente>();            
        }
        
        list.add(cliente);
        request.getSession().setAttribute("lista", list);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
