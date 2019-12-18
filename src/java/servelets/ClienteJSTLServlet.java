/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DAO.ClienteDao;
import DaoImpl.ClienteDaoImpl;
import entidades.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zilas
 */
@WebServlet(name = "ClienteJSTLServlet", urlPatterns = {"/clientejstl"})
public class ClienteJSTLServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Cliente cliente = new Cliente();
        ClienteDao dao = new ClienteDaoImpl();
        RequestDispatcher view =  request.getRequestDispatcher("clientejstl.jsp");
        
        if(request.getParameter("nome")!=null){
            if(!request.getParameter("id").equals("")){
                int id = Integer.parseInt(request.getParameter("id"));
                cliente.setId(id);
            }
            cliente.setNome(request.getParameter("nome"));
            cliente.setCpf(request.getParameter("cpf"));        
            cliente.setTelefone(request.getParameter("telefone"));                                        
            dao.save(cliente);
        }else if(request.getParameter("excluir") != null){
            int id = Integer.parseInt(request.getParameter("excluir"));
            System.out.println(id);
            System.out.println(dao.read(id).getNome());
            dao.delete(dao.read(id));
        }else if(request.getParameter("editar") != null){
            int id = Integer.parseInt(request.getParameter("editar"));
            cliente = dao.read(id);
            request.setAttribute("cliente", cliente);
        }
                
        request.setAttribute("lista", dao.all());        
        view.forward(request, response);
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
