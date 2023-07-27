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
@WebServlet(name = "svCrearUsuario", value = "/svCrearUsuario")
public class svCrearUsuario extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svCrearUsuario() {
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
        // TODO Auto-generated method stub

        UsuarioDAOImpl usuarioDao = new UsuarioDAOImpl();
        Usuario usuario = new Usuario((String) request.getParameter("nombreUsuario"),((String)request.getParameter("tipoUsuario")),((String)request.getParameter("password")));

        if(usuarioDao.registrar(usuario)){
            Contenedor.agregarUsuario(usuario);
            mostrarAlerta2(request,response);
        }


        // Agregar la capacitacion a la lista


    }
    private void mostrarAlerta2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mensaje2 = "Capacitacion enviado.";
        request.setAttribute("mensajeAlerta2", mensaje2);
        RequestDispatcher rd = request.getRequestDispatcher("/crear-usuario.jsp");
        rd.forward(request, response);
    }

}



