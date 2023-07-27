package controllers;

import java.io.*;
import java.util.List;

import impl.CapacitacionDAOImpl;
import impl.UsuarioDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.Capacitacion;
import models.Usuario;

/**
 * Servlet implementation class servlets.svContacto
 */
@WebServlet(name = "svListarUsuarios", value = "/svListarUsuarios")
public class svListarUsuarios extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svListarUsuarios() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsuarioDAOImpl usuarioDAO = new UsuarioDAOImpl();
        List<Usuario> usuario = usuarioDAO.listarUsuarios();
        if (!usuario.isEmpty()) {
            request.setAttribute("lista-usuarios", usuario);
            request.getRequestDispatcher("listado-usuarios.jsp").forward(request, response);
        }
    }
}
