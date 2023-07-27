package controllers;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

/**
 * Servlet implementation class servlets.svContacto
 */
@WebServlet(name = "svCerrarSesion", value = "/svCerrarSesion")
public class svCerrarSesion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svCerrarSesion() {
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
        // Cuando el usuario cierra sesión, invalida la sesión y redirecciona al inicio de sesión
        HttpSession session = request.getSession(false); // Obtiene la sesión actual, si existe
        if (session != null) {
            session.invalidate(); // Invalida la sesión, eliminando los atributos asociados
        }
        response.sendRedirect("index.jsp");
    }
}
