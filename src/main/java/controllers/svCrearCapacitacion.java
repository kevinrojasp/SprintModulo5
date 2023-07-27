package controllers;

import java.io.*;
import java.util.ArrayList;
import java.util.List;


import impl.CapacitacionDAOImpl;
import models.Capacitacion;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.Contenedor;


/**
 * Servlet implementation class servlets.svContacto
 */
@WebServlet(name = "svCrearCapacitacion", value = "/svCrearCapacitacion")
public class svCrearCapacitacion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public svCrearCapacitacion() {
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

        CapacitacionDAOImpl capacitacionDAO = new CapacitacionDAOImpl();
        Capacitacion capacitacion = new Capacitacion((String) request.getParameter("nombreCapacitacion"),((String)request.getParameter("detalle")));

        if(capacitacionDAO.registrar(capacitacion)){
            Contenedor.agregarCapacitacion(capacitacion);
            mostrarAlerta2(request,response);
        }


        // Agregar la capacitacion a la lista


    }
    private void mostrarAlerta2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mensaje2 = "Capacitacion enviado.";

        request.setAttribute("mensajeAlerta2", mensaje2);
        RequestDispatcher rd = request.getRequestDispatcher("/crearCapacitacion.jsp");
        rd.forward(request, response);
    }

}



