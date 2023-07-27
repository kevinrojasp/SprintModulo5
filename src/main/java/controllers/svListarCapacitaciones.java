package controllers;

import java.io.*;
import java.util.List;

import impl.CapacitacionDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.Capacitacion;

/**
 * Servlet implementation class servlets.svContacto
 */
@WebServlet(name = "svListarCapacitaciones", value = "/svListarCapacitaciones")
public class svListarCapacitaciones extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svListarCapacitaciones() {
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
        CapacitacionDAOImpl capacitacionDAO = new CapacitacionDAOImpl();

        List<Capacitacion> capacitacion = capacitacionDAO.listarCapacitaciones();
        if (!capacitacion.isEmpty()) {
            request.setAttribute("lista-capacitaciones", capacitacion);
            request.getRequestDispatcher("listado-capacitaciones.jsp").forward(request, response);
        }
    }
}
