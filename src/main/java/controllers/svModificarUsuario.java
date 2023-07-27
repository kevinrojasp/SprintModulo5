package controllers;

import java.io.*;
import java.util.ArrayList;
import java.util.List;


import impl.CapacitacionDAOImpl;
import impl.UsuarioDAOImpl;
import models.Capacitacion;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.Contenedor;
import models.Usuario;


/**
 * Servlet implementation class servlets.svContacto
 */
@WebServlet(name = "svModificarUsuario", value = "/svModificarUsuario")
public class svModificarUsuario extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svModificarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsuarioDAOImpl usuarioDao = new UsuarioDAOImpl();
        Integer idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
        Usuario usuario = new Usuario((String) request.getParameter("nombreUsuario"),((String)request.getParameter("tipoUsuario")),((String)request.getParameter("password")));
        usuario.setId(idUsuario);
        usuarioDao.modificarUser(usuario);
        RequestDispatcher rd = request.getRequestDispatcher("/dashboard.jsp");
        rd.forward(request, response);
    }
}



