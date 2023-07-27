package controllers;

import java.io.*;
import java.util.List;

import impl.CapacitacionDAOImpl;
import impl.UsuarioDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.Capacitacion;
import models.Usuario;

/**
 * Servlet implementation class servlets.svContacto
 */
@WebServlet(name = "svListarClientes", value = "/svListarClientes")
public class svListarClientes extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svListarClientes() {
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
            request.setAttribute("listado-clientes", usuario);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("crear-pago.jsp");
        dispatcher.forward(request, response);
    }

    public void init() throws ServletException {
        UsuarioDAOImpl usuarioDAO = new UsuarioDAOImpl();
        List<Usuario> usuario = usuarioDAO.listarUsuarios();
        if (!usuario.isEmpty()) {
            // Almacenar la lista de usuarios en el contexto de la aplicación
            getServletContext().setAttribute("listado-clientes", usuario);
        }
    }

}